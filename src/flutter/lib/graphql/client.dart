import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';
import 'package:gql/ast.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:oktoast/oktoast.dart';
import 'package:rime_app/common/env.dart';
import 'package:rime_app/common/global.dart';
import 'package:rime_app/graphql/error_code.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/utils/storage.dart';

class GQL {
  static late Client ferryClient;
  static String graphQLEndpoint = GRAPHQL_ENDPOINT;
  static dio.Dio dioClient = dio.Dio();

  static final defaultFetchPolicy = {
    OperationType.query: FetchPolicy.NetworkOnly,
    OperationType.mutation: FetchPolicy.NetworkOnly,
    OperationType.subscription: FetchPolicy.NetworkOnly,
  };

  static Future<Map<String, String>> getHeader() async {
    String token = await SecureStorage.readValue(key: 'token') ?? "";
    Map<String, String> defaultHeader = {
      'Authorization': 'Bearer $token',
      'user-agent': USER_AGENT,
    };

    return defaultHeader;
  }

  static Future<String> initClient() async {
    Map<String, String> header = await getHeader();
    HttpLink defaultLink = HttpLink(graphQLEndpoint, defaultHeaders: header);
    final client = Client(
      link: defaultLink,
      defaultFetchPolicies: defaultFetchPolicy,
    );

    ferryClient = client;
    return 'success';
  }

  static StreamSubscription<OperationResponse<TData, TVars>>
      executeQuery<TData, TVars>(
    OperationRequest<TData, TVars> request, {
    BuildContext? context,
    Function(StreamSubscription<OperationResponse<TData, TVars>>,
            OperationResponse<TData, TVars> data)?
        onData,
    Function(StreamSubscription<OperationResponse<TData, TVars>>,
            List<GraphQLError> graphQLErrors)?
        onError,
  }) {
    var streamSubscription = ferryClient.request(request).listen(null);
    streamSubscription.onData((data) {
      if (data.hasErrors) {
        print(data.graphqlErrors);
        if (context != null && onError == null)
          GQL.handleError(data.graphqlErrors, context);

        if (onError != null) {
          if (data.graphqlErrors == null && IS_DEV) {
            print(data.linkException.toString());
          }
          onError(streamSubscription, data.graphqlErrors ?? []);
        }
      }
      if (onData != null) {
        onData(streamSubscription, data);
      }
    });
    return streamSubscription;
  }

  /// 只展示第一条 error message
  static showErrorToast(List<GraphQLError> error) {
    if (error.length > 0) {
      var jsonvalue = parseFirstApiError(error);
      if (jsonvalue != null) showToast(jsonvalue.message);
    }
  }

  // return first api error, if no error, return null
  static ApiError? parseFirstApiError(List<GraphQLError> gqlErrors) {
    if (gqlErrors.length == 0) {
      return null;
    }

    for (final err in gqlErrors) {
      try {
        final errString = err.toString();
        final reg = RegExp(r"(\{.*?\})");
        final match = reg.firstMatch(errString);
        final v = match?.group(0);
        final m = json.decode(v!);
        final code = m["Code"];
        final message = m["Message"];

        int.parse(code, radix: 10);

        if (code != null &&
            message != null &&
            code.length == 6 &&
            message.length != 0) {
          return ApiError(code, message);
        }
      } catch (e) {}
    }

    return null;
  }

  static void handleError(List<GraphQLError>? gqlError, BuildContext context) {
    if (gqlError != null && gqlError.length > 0) {
      String errorCode = '';
      String errorMessage = '';
      Map<String, dynamic> graphqlErrors;
      try {
        graphqlErrors = jsonDecode(gqlError[0].message);
      } catch (e) {
        try {
          graphqlErrors = jsonDecode(
              gqlError[0].message.substring(21, gqlError[0].message.length));
        } catch (error) {
          print(error);
          graphqlErrors = {"Code": '', "Message": '发生错误'};
        }
      }

      errorCode = graphqlErrors['Code'];
      errorMessage = graphqlErrors['Message'];

      switch (errorCode) {
        // 异地登陆
        case '111001':
        // 账号未登录， token有问题
        case '111000':
        case '101000':
          showToast("请重新登录");
          SecureStorage.deleteValue(key: 'token');
          String alias =
              LocalStorage.sharedPreferences.getString('getuiAlias') ?? "";
          if (alias != "") Global.getuiPushUtil.deleteAilas(alias);

          Navigator.popAndPushNamed(context, Routes.signIn);
          break;
        //超出验证码次数
        case '109407':
          break;
        case '109203':
          showToast(errorMessage + '，请稍候再试。');
          break;

        default:
          showToast(errorMessage);
          break;
      }
    }
  }

  // 使用 Dio 上传图片
  static Future<String> dioUpload(File file) async {
    String token = await SecureStorage.readValue(key: 'token') ?? "";

    dioClient.options.headers = {
      'Authorization': 'Bearer $token',
      "Accept": "*/*",
      "Accept-Encoding": "gzip, deflate",
      "Host": "rimedata.com:9998",
      "Origin": "https://rimedata.com",
      "Referer": "https://rimedata.com/user",
      "User-Agent":
          "Mozilla/5.0 (Linux; Android 4.1.1; Galaxy Nexus Build/JRO03C) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19",
    };

    // 把 file 文件转换成 formFile 类型，用于上传
    final avatarFile = await dio.MultipartFile.fromFile(file.path);

    dio.FormData data = dio.FormData.fromMap({
      "operations":
          r'{"query":"mutation SingleUpload($file: Upload!) {\n  singleUpload(file: $file)\n}\n","operationName":"SingleUpload","variables":{"file":null}}',
      "map": r'{"0":["variables.file"]}',
      "0": avatarFile
    });

    //请求成功返回照片储存地址
    dio.Response response = await dioClient
        .post("$GRAPHQL_ENDPOINT", data: data)
        .catchError((e) => throw e);

    if (response.data["errors"] != null) {
      return "";
    }

    if (response.data != null) {
      return response.data["data"]['singleUpload'] ?? "";
    } else {
      return "";
    }
  }
}
