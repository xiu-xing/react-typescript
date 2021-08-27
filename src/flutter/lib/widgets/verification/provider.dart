import 'dart:io';

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/mutations/business_card/business_card.data.gql.dart';
import 'package:rime_app/graphql/mutations/business_card/business_card.req.gql.dart';
import 'package:rime_app/graphql/mutations/business_card/business_card.var.gql.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';

class VerficationProvider extends ChangeNotifier {
  late BuildContext context;

  VerficationProvider(BuildContext context) {
    context = context;
  }

  Future<String> _saveImage(File file) async {
    String url = await GQL.dioUpload(file);

    if (url == "") {
      return Future.error("上传名片失败");
    }

    return url;
  }

  Future<bool> _createTicket(String url) async {
    final mutation = GCreateBusinessCardApprovalTicketReq(
      (b) => b..vars.businessCardUrl = url,
    );

    GQL.executeQuery<GCreateBusinessCardApprovalTicketData,
        GCreateBusinessCardApprovalTicketVars>(
      mutation,
      context: context,
      onData: (stream, res) {
        stream.cancel();
        if (res.data?.createBussinessCardApprovalTicket ?? false) {
          return Future.value(true);
        }
      },
      onError: (stream, err) {
        stream.cancel();
        return Future.error("申请审核失败");
      },
    );

    return Future.error("申请审核失败");
  }

  Future<String> _createVerificationCode(String phone) {
    final mutation = GCreateVerificationCodeReq(
      (b) => b
        ..vars.contactInfo = phone
        ..vars.contactType = GContactType.PHONE,
    );

    GQL.executeQuery<GCreateVerificationCodeData, GCreateVerificationCodeVars>(
      mutation,
      context: context,
      onData: (stream, res) {
        stream.cancel();
        if (res.data?.createVerificationCode != null) {
          return Future.value(res.data?.createVerificationCode);
        }
      },
      onError: (stream, err) {
        stream.cancel();
        return Future.error("创建验证码失败");
      },
    );
    return Future.error("创建验证码失败");
  }

  Future<bool> _verifyCode(String phone, String code, String tokenString) {
    final mutation = GVerifyCodeAndApproveJoinRequestReq(
      (b) => b
        ..vars.input.contactType = GContactType.PHONE
        ..vars.input.verificationCode = code
        ..vars.input.contactInfo = phone
        ..vars.input.tokenString = tokenString,
    );

    GQL.executeQuery<GVerifyCodeAndApproveJoinRequestData,
        GVerifyCodeAndApproveJoinRequestVars>(
      mutation,
      context: context,
      onData: (stream, res) {
        stream.cancel();
        if (res.data?.verifyCodeAndApproveJoinRequest ?? false) {
          return Future.value(true);
        }
      },
      onError: (stream, err) {
        stream.cancel();
        return Future.error("验证码错误");
      },
    );

    return Future.error("验证码错误");
  }

  Future<bool> createTicket(File file) async {
    String url = await _saveImage(file).catchError((e) {
      showToast(e);
    });
    bool res = await _createTicket(url).catchError((e) {
      showToast(e);
    });

    if (res) return Future.value(true);

    return Future.value(false);
  }

  Future<bool> verifyCode(String phone, String code) async {
    String tokenString = await _createVerificationCode(phone).catchError((e) {
      showToast(e);
    });
    bool res = await _verifyCode(phone, code, tokenString).catchError((e) {
      showToast(e);
    });

    if (res) return Future.value(true);

    return Future.value(false);
  }
}
