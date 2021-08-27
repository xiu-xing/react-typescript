// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_code_builder/src/serializers/inline_fragment_serializer.dart'
    as _i2;
import 'package:rime_app/graphql/schema/schema.schema.gql.dart' as _i4;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;
import 'package:rime_app/graphql/types/page_info/page_info.data.gql.dart'
    as _i5;
import 'package:rime_app/graphql/types/permission/permission.data.gql.dart'
    as _i3;

part 'research.data.gql.g.dart';

abstract class GArticleDetailData
    implements Built<GArticleDetailData, GArticleDetailDataBuilder> {
  GArticleDetailData._();

  factory GArticleDetailData([Function(GArticleDetailDataBuilder b) updates]) =
      _$GArticleDetailData;

  static void _initializeBuilder(GArticleDetailDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GArticleDetailData_appArticleDetail? get appArticleDetail;
  static Serializer<GArticleDetailData> get serializer =>
      _$gArticleDetailDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GArticleDetailData.serializer, this)
          as Map<String, dynamic>);
  static GArticleDetailData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GArticleDetailData.serializer, json);
}

abstract class GArticleDetailData_appArticleDetail
    implements
        Built<GArticleDetailData_appArticleDetail,
            GArticleDetailData_appArticleDetailBuilder> {
  GArticleDetailData_appArticleDetail._();

  factory GArticleDetailData_appArticleDetail(
          [Function(GArticleDetailData_appArticleDetailBuilder b) updates]) =
      _$GArticleDetailData_appArticleDetail;

  static void _initializeBuilder(
          GArticleDetailData_appArticleDetailBuilder b) =>
      b..G__typename = 'Article';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get data;
  static Serializer<GArticleDetailData_appArticleDetail> get serializer =>
      _$gArticleDetailDataAppArticleDetailSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GArticleDetailData_appArticleDetail.serializer, this)
      as Map<String, dynamic>);
  static GArticleDetailData_appArticleDetail? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GArticleDetailData_appArticleDetail.serializer, json);
}

abstract class GArticleUriData
    implements Built<GArticleUriData, GArticleUriDataBuilder> {
  GArticleUriData._();

  factory GArticleUriData([Function(GArticleUriDataBuilder b) updates]) =
      _$GArticleUriData;

  static void _initializeBuilder(GArticleUriDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GArticleUriData_appArticleUri? get appArticleUri;
  static Serializer<GArticleUriData> get serializer =>
      _$gArticleUriDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GArticleUriData.serializer, this)
          as Map<String, dynamic>);
  static GArticleUriData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GArticleUriData.serializer, json);
}

abstract class GArticleUriData_appArticleUri
    implements
        Built<GArticleUriData_appArticleUri,
            GArticleUriData_appArticleUriBuilder> {
  GArticleUriData_appArticleUri._();

  factory GArticleUriData_appArticleUri(
          [Function(GArticleUriData_appArticleUriBuilder b) updates]) =
      _$GArticleUriData_appArticleUri;

  static void _initializeBuilder(GArticleUriData_appArticleUriBuilder b) =>
      b..G__typename = 'ArticleResource';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get resourceURI;
  int? get numOfUsedRead;
  int? get numOfUnusedRead;
  int? get numOfUsedDownload;
  int? get numOfUnusedDownload;
  BuiltList<GArticleUriData_appArticleUri_permissions>? get permissions;
  static Serializer<GArticleUriData_appArticleUri> get serializer =>
      _$gArticleUriDataAppArticleUriSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GArticleUriData_appArticleUri.serializer, this) as Map<String, dynamic>);
  static GArticleUriData_appArticleUri? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GArticleUriData_appArticleUri.serializer, json);
}

abstract class GArticleUriData_appArticleUri_permissions {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GArticleUriData_appArticleUri_permissions> get serializer =>
      _i2.InlineFragmentSerializer<GArticleUriData_appArticleUri_permissions>(
          'GArticleUriData_appArticleUri_permissions',
          GArticleUriData_appArticleUri_permissions__base, [
        GArticleUriData_appArticleUri_permissions__asLockPermission,
        GArticleUriData_appArticleUri_permissions__asFrequencyPermission,
        GArticleUriData_appArticleUri_permissions__asPaginationPermission
      ]);
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GArticleUriData_appArticleUri_permissions.serializer, this)
      as Map<String, dynamic>);
  static GArticleUriData_appArticleUri_permissions? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GArticleUriData_appArticleUri_permissions.serializer, json);
}

abstract class GArticleUriData_appArticleUri_permissions__base
    implements
        Built<GArticleUriData_appArticleUri_permissions__base,
            GArticleUriData_appArticleUri_permissions__baseBuilder>,
        GArticleUriData_appArticleUri_permissions {
  GArticleUriData_appArticleUri_permissions__base._();

  factory GArticleUriData_appArticleUri_permissions__base(
      [Function(GArticleUriData_appArticleUri_permissions__baseBuilder b)
          updates]) = _$GArticleUriData_appArticleUri_permissions__base;

  static void _initializeBuilder(
          GArticleUriData_appArticleUri_permissions__baseBuilder b) =>
      b..G__typename = 'Permission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GArticleUriData_appArticleUri_permissions__base>
      get serializer => _$gArticleUriDataAppArticleUriPermissionsBaseSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GArticleUriData_appArticleUri_permissions__base.serializer, this)
      as Map<String, dynamic>);
  static GArticleUriData_appArticleUri_permissions__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GArticleUriData_appArticleUri_permissions__base.serializer, json);
}

abstract class GArticleUriData_appArticleUri_permissions__asLockPermission
    implements
        Built<GArticleUriData_appArticleUri_permissions__asLockPermission,
            GArticleUriData_appArticleUri_permissions__asLockPermissionBuilder>,
        GArticleUriData_appArticleUri_permissions,
        _i3.GLockPermissionFields {
  GArticleUriData_appArticleUri_permissions__asLockPermission._();

  factory GArticleUriData_appArticleUri_permissions__asLockPermission(
      [Function(
              GArticleUriData_appArticleUri_permissions__asLockPermissionBuilder
                  b)
          updates]) = _$GArticleUriData_appArticleUri_permissions__asLockPermission;

  static void _initializeBuilder(
          GArticleUriData_appArticleUri_permissions__asLockPermissionBuilder
              b) =>
      b..G__typename = 'LockPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get locked;
  static Serializer<GArticleUriData_appArticleUri_permissions__asLockPermission>
      get serializer =>
          _$gArticleUriDataAppArticleUriPermissionsAsLockPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GArticleUriData_appArticleUri_permissions__asLockPermission.serializer,
      this) as Map<String, dynamic>);
  static GArticleUriData_appArticleUri_permissions__asLockPermission? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GArticleUriData_appArticleUri_permissions__asLockPermission
              .serializer,
          json);
}

abstract class GArticleUriData_appArticleUri_permissions__asFrequencyPermission
    implements
        Built<GArticleUriData_appArticleUri_permissions__asFrequencyPermission,
            GArticleUriData_appArticleUri_permissions__asFrequencyPermissionBuilder>,
        GArticleUriData_appArticleUri_permissions,
        _i3.GFrequencyPermissionFields {
  GArticleUriData_appArticleUri_permissions__asFrequencyPermission._();

  factory GArticleUriData_appArticleUri_permissions__asFrequencyPermission(
          [Function(
                  GArticleUriData_appArticleUri_permissions__asFrequencyPermissionBuilder
                      b)
              updates]) =
      _$GArticleUriData_appArticleUri_permissions__asFrequencyPermission;

  static void _initializeBuilder(
          GArticleUriData_appArticleUri_permissions__asFrequencyPermissionBuilder
              b) =>
      b..G__typename = 'FrequencyPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get used;
  int get total;
  int get remaining;
  static Serializer<
          GArticleUriData_appArticleUri_permissions__asFrequencyPermission>
      get serializer =>
          _$gArticleUriDataAppArticleUriPermissionsAsFrequencyPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GArticleUriData_appArticleUri_permissions__asFrequencyPermission
          .serializer,
      this) as Map<String, dynamic>);
  static GArticleUriData_appArticleUri_permissions__asFrequencyPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GArticleUriData_appArticleUri_permissions__asFrequencyPermission
              .serializer,
          json);
}

abstract class GArticleUriData_appArticleUri_permissions__asPaginationPermission
    implements
        Built<GArticleUriData_appArticleUri_permissions__asPaginationPermission,
            GArticleUriData_appArticleUri_permissions__asPaginationPermissionBuilder>,
        GArticleUriData_appArticleUri_permissions,
        _i3.GPaginationPermissionFields {
  GArticleUriData_appArticleUri_permissions__asPaginationPermission._();

  factory GArticleUriData_appArticleUri_permissions__asPaginationPermission(
          [Function(
                  GArticleUriData_appArticleUri_permissions__asPaginationPermissionBuilder
                      b)
              updates]) =
      _$GArticleUriData_appArticleUri_permissions__asPaginationPermission;

  static void _initializeBuilder(
          GArticleUriData_appArticleUri_permissions__asPaginationPermissionBuilder
              b) =>
      b..G__typename = 'PaginationPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get rowLimit;
  bool get lockNextPage;
  bool get lockPreviousPage;
  static Serializer<
          GArticleUriData_appArticleUri_permissions__asPaginationPermission>
      get serializer =>
          _$gArticleUriDataAppArticleUriPermissionsAsPaginationPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GArticleUriData_appArticleUri_permissions__asPaginationPermission
          .serializer,
      this) as Map<String, dynamic>);
  static GArticleUriData_appArticleUri_permissions__asPaginationPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GArticleUriData_appArticleUri_permissions__asPaginationPermission
              .serializer,
          json);
}

abstract class GArticleListData
    implements Built<GArticleListData, GArticleListDataBuilder> {
  GArticleListData._();

  factory GArticleListData([Function(GArticleListDataBuilder b) updates]) =
      _$GArticleListData;

  static void _initializeBuilder(GArticleListDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GArticleListData_appArticleList? get appArticleList;
  static Serializer<GArticleListData> get serializer =>
      _$gArticleListDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GArticleListData.serializer, this)
          as Map<String, dynamic>);
  static GArticleListData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GArticleListData.serializer, json);
}

abstract class GArticleListData_appArticleList
    implements
        Built<GArticleListData_appArticleList,
            GArticleListData_appArticleListBuilder> {
  GArticleListData_appArticleList._();

  factory GArticleListData_appArticleList(
          [Function(GArticleListData_appArticleListBuilder b) updates]) =
      _$GArticleListData_appArticleList;

  static void _initializeBuilder(GArticleListData_appArticleListBuilder b) =>
      b..G__typename = 'ArticleListConnection';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int? get totalCount;
  BuiltList<GArticleListData_appArticleList_nodes>? get nodes;
  GArticleListData_appArticleList_pageInfo get pageInfo;
  BuiltList<GArticleListData_appArticleList_permissions>? get permissions;
  static Serializer<GArticleListData_appArticleList> get serializer =>
      _$gArticleListDataAppArticleListSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GArticleListData_appArticleList.serializer, this)
      as Map<String, dynamic>);
  static GArticleListData_appArticleList? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GArticleListData_appArticleList.serializer, json);
}

abstract class GArticleListData_appArticleList_nodes
    implements
        Built<GArticleListData_appArticleList_nodes,
            GArticleListData_appArticleList_nodesBuilder> {
  GArticleListData_appArticleList_nodes._();

  factory GArticleListData_appArticleList_nodes(
          [Function(GArticleListData_appArticleList_nodesBuilder b) updates]) =
      _$GArticleListData_appArticleList_nodes;

  static void _initializeBuilder(
          GArticleListData_appArticleList_nodesBuilder b) =>
      b..G__typename = 'ArticleListNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get articleID;
  _i4.GArticleType? get articleType;
  String? get data;
  static Serializer<GArticleListData_appArticleList_nodes> get serializer =>
      _$gArticleListDataAppArticleListNodesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GArticleListData_appArticleList_nodes.serializer, this)
      as Map<String, dynamic>);
  static GArticleListData_appArticleList_nodes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GArticleListData_appArticleList_nodes.serializer, json);
}

abstract class GArticleListData_appArticleList_pageInfo
    implements
        Built<GArticleListData_appArticleList_pageInfo,
            GArticleListData_appArticleList_pageInfoBuilder>,
        _i5.GPageInfoFields {
  GArticleListData_appArticleList_pageInfo._();

  factory GArticleListData_appArticleList_pageInfo(
      [Function(GArticleListData_appArticleList_pageInfoBuilder b)
          updates]) = _$GArticleListData_appArticleList_pageInfo;

  static void _initializeBuilder(
          GArticleListData_appArticleList_pageInfoBuilder b) =>
      b..G__typename = 'PageInfo';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get hasPreviousPage;
  bool get hasNextPage;
  String? get startCursor;
  String? get endCursor;
  static Serializer<GArticleListData_appArticleList_pageInfo> get serializer =>
      _$gArticleListDataAppArticleListPageInfoSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GArticleListData_appArticleList_pageInfo.serializer, this)
      as Map<String, dynamic>);
  static GArticleListData_appArticleList_pageInfo? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GArticleListData_appArticleList_pageInfo.serializer, json);
}

abstract class GArticleListData_appArticleList_permissions {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GArticleListData_appArticleList_permissions>
      get serializer => _i2.InlineFragmentSerializer<
                  GArticleListData_appArticleList_permissions>(
              'GArticleListData_appArticleList_permissions',
              GArticleListData_appArticleList_permissions__base, [
            GArticleListData_appArticleList_permissions__asLockPermission,
            GArticleListData_appArticleList_permissions__asFrequencyPermission,
            GArticleListData_appArticleList_permissions__asPaginationPermission
          ]);
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GArticleListData_appArticleList_permissions.serializer, this)
      as Map<String, dynamic>);
  static GArticleListData_appArticleList_permissions? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GArticleListData_appArticleList_permissions.serializer, json);
}

abstract class GArticleListData_appArticleList_permissions__base
    implements
        Built<GArticleListData_appArticleList_permissions__base,
            GArticleListData_appArticleList_permissions__baseBuilder>,
        GArticleListData_appArticleList_permissions {
  GArticleListData_appArticleList_permissions__base._();

  factory GArticleListData_appArticleList_permissions__base(
      [Function(GArticleListData_appArticleList_permissions__baseBuilder b)
          updates]) = _$GArticleListData_appArticleList_permissions__base;

  static void _initializeBuilder(
          GArticleListData_appArticleList_permissions__baseBuilder b) =>
      b..G__typename = 'Permission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GArticleListData_appArticleList_permissions__base>
      get serializer =>
          _$gArticleListDataAppArticleListPermissionsBaseSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GArticleListData_appArticleList_permissions__base.serializer, this)
      as Map<String, dynamic>);
  static GArticleListData_appArticleList_permissions__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GArticleListData_appArticleList_permissions__base.serializer, json);
}

abstract class GArticleListData_appArticleList_permissions__asLockPermission
    implements
        Built<GArticleListData_appArticleList_permissions__asLockPermission,
            GArticleListData_appArticleList_permissions__asLockPermissionBuilder>,
        GArticleListData_appArticleList_permissions,
        _i3.GLockPermissionFields {
  GArticleListData_appArticleList_permissions__asLockPermission._();

  factory GArticleListData_appArticleList_permissions__asLockPermission(
          [Function(
                  GArticleListData_appArticleList_permissions__asLockPermissionBuilder
                      b)
              updates]) =
      _$GArticleListData_appArticleList_permissions__asLockPermission;

  static void _initializeBuilder(
          GArticleListData_appArticleList_permissions__asLockPermissionBuilder
              b) =>
      b..G__typename = 'LockPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get locked;
  static Serializer<
          GArticleListData_appArticleList_permissions__asLockPermission>
      get serializer =>
          _$gArticleListDataAppArticleListPermissionsAsLockPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GArticleListData_appArticleList_permissions__asLockPermission.serializer,
      this) as Map<String, dynamic>);
  static GArticleListData_appArticleList_permissions__asLockPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GArticleListData_appArticleList_permissions__asLockPermission
              .serializer,
          json);
}

abstract class GArticleListData_appArticleList_permissions__asFrequencyPermission
    implements
        Built<
            GArticleListData_appArticleList_permissions__asFrequencyPermission,
            GArticleListData_appArticleList_permissions__asFrequencyPermissionBuilder>,
        GArticleListData_appArticleList_permissions,
        _i3.GFrequencyPermissionFields {
  GArticleListData_appArticleList_permissions__asFrequencyPermission._();

  factory GArticleListData_appArticleList_permissions__asFrequencyPermission(
          [Function(
                  GArticleListData_appArticleList_permissions__asFrequencyPermissionBuilder
                      b)
              updates]) =
      _$GArticleListData_appArticleList_permissions__asFrequencyPermission;

  static void _initializeBuilder(
          GArticleListData_appArticleList_permissions__asFrequencyPermissionBuilder
              b) =>
      b..G__typename = 'FrequencyPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get used;
  int get total;
  int get remaining;
  static Serializer<
          GArticleListData_appArticleList_permissions__asFrequencyPermission>
      get serializer =>
          _$gArticleListDataAppArticleListPermissionsAsFrequencyPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GArticleListData_appArticleList_permissions__asFrequencyPermission
          .serializer,
      this) as Map<String, dynamic>);
  static GArticleListData_appArticleList_permissions__asFrequencyPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GArticleListData_appArticleList_permissions__asFrequencyPermission
              .serializer,
          json);
}

abstract class GArticleListData_appArticleList_permissions__asPaginationPermission
    implements
        Built<
            GArticleListData_appArticleList_permissions__asPaginationPermission,
            GArticleListData_appArticleList_permissions__asPaginationPermissionBuilder>,
        GArticleListData_appArticleList_permissions,
        _i3.GPaginationPermissionFields {
  GArticleListData_appArticleList_permissions__asPaginationPermission._();

  factory GArticleListData_appArticleList_permissions__asPaginationPermission(
          [Function(
                  GArticleListData_appArticleList_permissions__asPaginationPermissionBuilder
                      b)
              updates]) =
      _$GArticleListData_appArticleList_permissions__asPaginationPermission;

  static void _initializeBuilder(
          GArticleListData_appArticleList_permissions__asPaginationPermissionBuilder
              b) =>
      b..G__typename = 'PaginationPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get rowLimit;
  bool get lockNextPage;
  bool get lockPreviousPage;
  static Serializer<
          GArticleListData_appArticleList_permissions__asPaginationPermission>
      get serializer =>
          _$gArticleListDataAppArticleListPermissionsAsPaginationPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GArticleListData_appArticleList_permissions__asPaginationPermission
          .serializer,
      this) as Map<String, dynamic>);
  static GArticleListData_appArticleList_permissions__asPaginationPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GArticleListData_appArticleList_permissions__asPaginationPermission
              .serializer,
          json);
}

abstract class GArticleTabsData
    implements Built<GArticleTabsData, GArticleTabsDataBuilder> {
  GArticleTabsData._();

  factory GArticleTabsData([Function(GArticleTabsDataBuilder b) updates]) =
      _$GArticleTabsData;

  static void _initializeBuilder(GArticleTabsDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GArticleTabsData_appArticleTabs> get appArticleTabs;
  static Serializer<GArticleTabsData> get serializer =>
      _$gArticleTabsDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GArticleTabsData.serializer, this)
          as Map<String, dynamic>);
  static GArticleTabsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GArticleTabsData.serializer, json);
}

abstract class GArticleTabsData_appArticleTabs {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GArticleTabsData_appArticleTabs> get serializer =>
      _i2.InlineFragmentSerializer<GArticleTabsData_appArticleTabs>(
          'GArticleTabsData_appArticleTabs',
          GArticleTabsData_appArticleTabs__base,
          [GArticleTabsData_appArticleTabs__asArticleTab]);
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GArticleTabsData_appArticleTabs.serializer, this)
      as Map<String, dynamic>);
  static GArticleTabsData_appArticleTabs? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GArticleTabsData_appArticleTabs.serializer, json);
}

abstract class GArticleTabsData_appArticleTabs__base
    implements
        Built<GArticleTabsData_appArticleTabs__base,
            GArticleTabsData_appArticleTabs__baseBuilder>,
        GArticleTabsData_appArticleTabs {
  GArticleTabsData_appArticleTabs__base._();

  factory GArticleTabsData_appArticleTabs__base(
          [Function(GArticleTabsData_appArticleTabs__baseBuilder b) updates]) =
      _$GArticleTabsData_appArticleTabs__base;

  static void _initializeBuilder(
          GArticleTabsData_appArticleTabs__baseBuilder b) =>
      b..G__typename = 'Tab';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GArticleTabsData_appArticleTabs__base> get serializer =>
      _$gArticleTabsDataAppArticleTabsBaseSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GArticleTabsData_appArticleTabs__base.serializer, this)
      as Map<String, dynamic>);
  static GArticleTabsData_appArticleTabs__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GArticleTabsData_appArticleTabs__base.serializer, json);
}

abstract class GArticleTabsData_appArticleTabs__asArticleTab
    implements
        Built<GArticleTabsData_appArticleTabs__asArticleTab,
            GArticleTabsData_appArticleTabs__asArticleTabBuilder>,
        GArticleTabsData_appArticleTabs {
  GArticleTabsData_appArticleTabs__asArticleTab._();

  factory GArticleTabsData_appArticleTabs__asArticleTab(
      [Function(GArticleTabsData_appArticleTabs__asArticleTabBuilder b)
          updates]) = _$GArticleTabsData_appArticleTabs__asArticleTab;

  static void _initializeBuilder(
          GArticleTabsData_appArticleTabs__asArticleTabBuilder b) =>
      b..G__typename = 'ArticleTab';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  GArticleTabsData_appArticleTabs__asArticleTab_modifier? get modifier;
  BuiltList<GArticleTabsData_appArticleTabs__asArticleTab_filters>? get filters;
  BuiltList<GArticleTabsData_appArticleTabs__asArticleTab_permissions>?
      get permissions;
  String get articleListID;
  _i4.GArticleType get articleType;
  static Serializer<GArticleTabsData_appArticleTabs__asArticleTab>
      get serializer => _$gArticleTabsDataAppArticleTabsAsArticleTabSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GArticleTabsData_appArticleTabs__asArticleTab.serializer, this)
      as Map<String, dynamic>);
  static GArticleTabsData_appArticleTabs__asArticleTab? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GArticleTabsData_appArticleTabs__asArticleTab.serializer, json);
}

abstract class GArticleTabsData_appArticleTabs__asArticleTab_modifier
    implements
        Built<GArticleTabsData_appArticleTabs__asArticleTab_modifier,
            GArticleTabsData_appArticleTabs__asArticleTab_modifierBuilder> {
  GArticleTabsData_appArticleTabs__asArticleTab_modifier._();

  factory GArticleTabsData_appArticleTabs__asArticleTab_modifier(
      [Function(GArticleTabsData_appArticleTabs__asArticleTab_modifierBuilder b)
          updates]) = _$GArticleTabsData_appArticleTabs__asArticleTab_modifier;

  static void _initializeBuilder(
          GArticleTabsData_appArticleTabs__asArticleTab_modifierBuilder b) =>
      b..G__typename = 'Modifier';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get hasUpdatedContent;
  bool get isNew;
  static Serializer<GArticleTabsData_appArticleTabs__asArticleTab_modifier>
      get serializer =>
          _$gArticleTabsDataAppArticleTabsAsArticleTabModifierSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GArticleTabsData_appArticleTabs__asArticleTab_modifier.serializer,
      this) as Map<String, dynamic>);
  static GArticleTabsData_appArticleTabs__asArticleTab_modifier? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GArticleTabsData_appArticleTabs__asArticleTab_modifier.serializer,
          json);
}

abstract class GArticleTabsData_appArticleTabs__asArticleTab_filters {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GArticleTabsData_appArticleTabs__asArticleTab_filters>
      get serializer => _i2.InlineFragmentSerializer<
                  GArticleTabsData_appArticleTabs__asArticleTab_filters>(
              'GArticleTabsData_appArticleTabs__asArticleTab_filters',
              GArticleTabsData_appArticleTabs__asArticleTab_filters__base, [
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asSelectorFilter,
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asDayFilter,
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asYearFilter,
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asMonthFilter,
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asCheckboxFilter,
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asNestedCheckboxFilter,
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeFilter,
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeSelectorFilter,
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asSuggestionFilter
          ]);
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GArticleTabsData_appArticleTabs__asArticleTab_filters.serializer,
      this) as Map<String, dynamic>);
  static GArticleTabsData_appArticleTabs__asArticleTab_filters? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GArticleTabsData_appArticleTabs__asArticleTab_filters.serializer,
          json);
}

abstract class GArticleTabsData_appArticleTabs__asArticleTab_filters__base
    implements
        Built<GArticleTabsData_appArticleTabs__asArticleTab_filters__base,
            GArticleTabsData_appArticleTabs__asArticleTab_filters__baseBuilder>,
        GArticleTabsData_appArticleTabs__asArticleTab_filters {
  GArticleTabsData_appArticleTabs__asArticleTab_filters__base._();

  factory GArticleTabsData_appArticleTabs__asArticleTab_filters__base(
      [Function(
              GArticleTabsData_appArticleTabs__asArticleTab_filters__baseBuilder
                  b)
          updates]) = _$GArticleTabsData_appArticleTabs__asArticleTab_filters__base;

  static void _initializeBuilder(
          GArticleTabsData_appArticleTabs__asArticleTab_filters__baseBuilder
              b) =>
      b..G__typename = 'Filter';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GArticleTabsData_appArticleTabs__asArticleTab_filters__base>
      get serializer =>
          _$gArticleTabsDataAppArticleTabsAsArticleTabFiltersBaseSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GArticleTabsData_appArticleTabs__asArticleTab_filters__base.serializer,
      this) as Map<String, dynamic>);
  static GArticleTabsData_appArticleTabs__asArticleTab_filters__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GArticleTabsData_appArticleTabs__asArticleTab_filters__base
              .serializer,
          json);
}

abstract class GArticleTabsData_appArticleTabs__asArticleTab_filters__asSelectorFilter
    implements
        Built<
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asSelectorFilter,
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asSelectorFilterBuilder>,
        GArticleTabsData_appArticleTabs__asArticleTab_filters {
  GArticleTabsData_appArticleTabs__asArticleTab_filters__asSelectorFilter._();

  factory GArticleTabsData_appArticleTabs__asArticleTab_filters__asSelectorFilter(
          [Function(
                  GArticleTabsData_appArticleTabs__asArticleTab_filters__asSelectorFilterBuilder
                      b)
              updates]) =
      _$GArticleTabsData_appArticleTabs__asArticleTab_filters__asSelectorFilter;

  static void _initializeBuilder(
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asSelectorFilterBuilder
              b) =>
      b..G__typename = 'SelectorFilter';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get icon;
  String? get name;
  String? get operator;
  bool? get multiple;
  BuiltList<
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asSelectorFilter_options>?
      get options;
  String? get defaultValue;
  bool? get split;
  static Serializer<
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asSelectorFilter>
      get serializer =>
          _$gArticleTabsDataAppArticleTabsAsArticleTabFiltersAsSelectorFilterSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GArticleTabsData_appArticleTabs__asArticleTab_filters__asSelectorFilter
          .serializer,
      this) as Map<String, dynamic>);
  static GArticleTabsData_appArticleTabs__asArticleTab_filters__asSelectorFilter?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asSelectorFilter
              .serializer,
          json);
}

abstract class GArticleTabsData_appArticleTabs__asArticleTab_filters__asSelectorFilter_options
    implements
        Built<
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asSelectorFilter_options,
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asSelectorFilter_optionsBuilder> {
  GArticleTabsData_appArticleTabs__asArticleTab_filters__asSelectorFilter_options._();

  factory GArticleTabsData_appArticleTabs__asArticleTab_filters__asSelectorFilter_options(
          [Function(
                  GArticleTabsData_appArticleTabs__asArticleTab_filters__asSelectorFilter_optionsBuilder
                      b)
              updates]) =
      _$GArticleTabsData_appArticleTabs__asArticleTab_filters__asSelectorFilter_options;

  static void _initializeBuilder(
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asSelectorFilter_optionsBuilder
              b) =>
      b..G__typename = 'FilterOption';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get key;
  String get value;
  static Serializer<
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asSelectorFilter_options>
      get serializer =>
          _$gArticleTabsDataAppArticleTabsAsArticleTabFiltersAsSelectorFilterOptionsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GArticleTabsData_appArticleTabs__asArticleTab_filters__asSelectorFilter_options
          .serializer,
      this) as Map<String, dynamic>);
  static GArticleTabsData_appArticleTabs__asArticleTab_filters__asSelectorFilter_options?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asSelectorFilter_options
              .serializer,
          json);
}

abstract class GArticleTabsData_appArticleTabs__asArticleTab_filters__asDayFilter
    implements
        Built<
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asDayFilter,
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asDayFilterBuilder>,
        GArticleTabsData_appArticleTabs__asArticleTab_filters {
  GArticleTabsData_appArticleTabs__asArticleTab_filters__asDayFilter._();

  factory GArticleTabsData_appArticleTabs__asArticleTab_filters__asDayFilter(
          [Function(
                  GArticleTabsData_appArticleTabs__asArticleTab_filters__asDayFilterBuilder
                      b)
              updates]) =
      _$GArticleTabsData_appArticleTabs__asArticleTab_filters__asDayFilter;

  static void _initializeBuilder(
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asDayFilterBuilder
              b) =>
      b..G__typename = 'DayFilter';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get icon;
  String? get name;
  int? get min;
  int? get max;
  String? get operator;
  static Serializer<
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asDayFilter>
      get serializer =>
          _$gArticleTabsDataAppArticleTabsAsArticleTabFiltersAsDayFilterSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GArticleTabsData_appArticleTabs__asArticleTab_filters__asDayFilter
          .serializer,
      this) as Map<String, dynamic>);
  static GArticleTabsData_appArticleTabs__asArticleTab_filters__asDayFilter?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asDayFilter
              .serializer,
          json);
}

abstract class GArticleTabsData_appArticleTabs__asArticleTab_filters__asYearFilter
    implements
        Built<
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asYearFilter,
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asYearFilterBuilder>,
        GArticleTabsData_appArticleTabs__asArticleTab_filters {
  GArticleTabsData_appArticleTabs__asArticleTab_filters__asYearFilter._();

  factory GArticleTabsData_appArticleTabs__asArticleTab_filters__asYearFilter(
          [Function(
                  GArticleTabsData_appArticleTabs__asArticleTab_filters__asYearFilterBuilder
                      b)
              updates]) =
      _$GArticleTabsData_appArticleTabs__asArticleTab_filters__asYearFilter;

  static void _initializeBuilder(
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asYearFilterBuilder
              b) =>
      b..G__typename = 'YearFilter';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get icon;
  String? get name;
  int? get min;
  int? get max;
  String? get operator;
  static Serializer<
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asYearFilter>
      get serializer =>
          _$gArticleTabsDataAppArticleTabsAsArticleTabFiltersAsYearFilterSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GArticleTabsData_appArticleTabs__asArticleTab_filters__asYearFilter
          .serializer,
      this) as Map<String, dynamic>);
  static GArticleTabsData_appArticleTabs__asArticleTab_filters__asYearFilter?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asYearFilter
              .serializer,
          json);
}

abstract class GArticleTabsData_appArticleTabs__asArticleTab_filters__asMonthFilter
    implements
        Built<
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asMonthFilter,
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asMonthFilterBuilder>,
        GArticleTabsData_appArticleTabs__asArticleTab_filters {
  GArticleTabsData_appArticleTabs__asArticleTab_filters__asMonthFilter._();

  factory GArticleTabsData_appArticleTabs__asArticleTab_filters__asMonthFilter(
          [Function(
                  GArticleTabsData_appArticleTabs__asArticleTab_filters__asMonthFilterBuilder
                      b)
              updates]) =
      _$GArticleTabsData_appArticleTabs__asArticleTab_filters__asMonthFilter;

  static void _initializeBuilder(
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asMonthFilterBuilder
              b) =>
      b..G__typename = 'MonthFilter';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get icon;
  String? get name;
  int? get min;
  int? get max;
  String? get operator;
  static Serializer<
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asMonthFilter>
      get serializer =>
          _$gArticleTabsDataAppArticleTabsAsArticleTabFiltersAsMonthFilterSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GArticleTabsData_appArticleTabs__asArticleTab_filters__asMonthFilter
          .serializer,
      this) as Map<String, dynamic>);
  static GArticleTabsData_appArticleTabs__asArticleTab_filters__asMonthFilter?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asMonthFilter
              .serializer,
          json);
}

abstract class GArticleTabsData_appArticleTabs__asArticleTab_filters__asCheckboxFilter
    implements
        Built<
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asCheckboxFilter,
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asCheckboxFilterBuilder>,
        GArticleTabsData_appArticleTabs__asArticleTab_filters {
  GArticleTabsData_appArticleTabs__asArticleTab_filters__asCheckboxFilter._();

  factory GArticleTabsData_appArticleTabs__asArticleTab_filters__asCheckboxFilter(
          [Function(
                  GArticleTabsData_appArticleTabs__asArticleTab_filters__asCheckboxFilterBuilder
                      b)
              updates]) =
      _$GArticleTabsData_appArticleTabs__asArticleTab_filters__asCheckboxFilter;

  static void _initializeBuilder(
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asCheckboxFilterBuilder
              b) =>
      b..G__typename = 'CheckboxFilter';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get name;
  String? get icon;
  BuiltList<
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asCheckboxFilter_options>?
      get options;
  String? get operator;
  static Serializer<
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asCheckboxFilter>
      get serializer =>
          _$gArticleTabsDataAppArticleTabsAsArticleTabFiltersAsCheckboxFilterSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GArticleTabsData_appArticleTabs__asArticleTab_filters__asCheckboxFilter
          .serializer,
      this) as Map<String, dynamic>);
  static GArticleTabsData_appArticleTabs__asArticleTab_filters__asCheckboxFilter?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asCheckboxFilter
              .serializer,
          json);
}

abstract class GArticleTabsData_appArticleTabs__asArticleTab_filters__asCheckboxFilter_options
    implements
        Built<
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asCheckboxFilter_options,
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asCheckboxFilter_optionsBuilder> {
  GArticleTabsData_appArticleTabs__asArticleTab_filters__asCheckboxFilter_options._();

  factory GArticleTabsData_appArticleTabs__asArticleTab_filters__asCheckboxFilter_options(
          [Function(
                  GArticleTabsData_appArticleTabs__asArticleTab_filters__asCheckboxFilter_optionsBuilder
                      b)
              updates]) =
      _$GArticleTabsData_appArticleTabs__asArticleTab_filters__asCheckboxFilter_options;

  static void _initializeBuilder(
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asCheckboxFilter_optionsBuilder
              b) =>
      b..G__typename = 'FilterOption';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get key;
  String get value;
  static Serializer<
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asCheckboxFilter_options>
      get serializer =>
          _$gArticleTabsDataAppArticleTabsAsArticleTabFiltersAsCheckboxFilterOptionsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GArticleTabsData_appArticleTabs__asArticleTab_filters__asCheckboxFilter_options
          .serializer,
      this) as Map<String, dynamic>);
  static GArticleTabsData_appArticleTabs__asArticleTab_filters__asCheckboxFilter_options?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asCheckboxFilter_options
              .serializer,
          json);
}

abstract class GArticleTabsData_appArticleTabs__asArticleTab_filters__asNestedCheckboxFilter
    implements
        Built<
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asNestedCheckboxFilter,
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asNestedCheckboxFilterBuilder>,
        GArticleTabsData_appArticleTabs__asArticleTab_filters {
  GArticleTabsData_appArticleTabs__asArticleTab_filters__asNestedCheckboxFilter._();

  factory GArticleTabsData_appArticleTabs__asArticleTab_filters__asNestedCheckboxFilter(
          [Function(
                  GArticleTabsData_appArticleTabs__asArticleTab_filters__asNestedCheckboxFilterBuilder
                      b)
              updates]) =
      _$GArticleTabsData_appArticleTabs__asArticleTab_filters__asNestedCheckboxFilter;

  static void _initializeBuilder(
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asNestedCheckboxFilterBuilder
              b) =>
      b..G__typename = 'NestedCheckboxFilter';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get icon;
  String? get name;
  String? get operator;
  static Serializer<
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asNestedCheckboxFilter>
      get serializer =>
          _$gArticleTabsDataAppArticleTabsAsArticleTabFiltersAsNestedCheckboxFilterSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GArticleTabsData_appArticleTabs__asArticleTab_filters__asNestedCheckboxFilter
          .serializer,
      this) as Map<String, dynamic>);
  static GArticleTabsData_appArticleTabs__asArticleTab_filters__asNestedCheckboxFilter?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asNestedCheckboxFilter
              .serializer,
          json);
}

abstract class GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeFilter
    implements
        Built<
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeFilter,
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeFilterBuilder>,
        GArticleTabsData_appArticleTabs__asArticleTab_filters {
  GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeFilter._();

  factory GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeFilter(
          [Function(
                  GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeFilterBuilder
                      b)
              updates]) =
      _$GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeFilter;

  static void _initializeBuilder(
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeFilterBuilder
              b) =>
      b..G__typename = 'DateRangeFilter';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get icon;
  String? get name;
  int? get min;
  int? get max;
  _i4.GDatePrecise? get precise;
  int get defaultEndDate;
  int get defaultStartDate;
  static Serializer<
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeFilter>
      get serializer =>
          _$gArticleTabsDataAppArticleTabsAsArticleTabFiltersAsDateRangeFilterSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeFilter
          .serializer,
      this) as Map<String, dynamic>);
  static GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeFilter?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeFilter
              .serializer,
          json);
}

abstract class GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeSelectorFilter
    implements
        Built<
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeSelectorFilter,
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeSelectorFilterBuilder>,
        GArticleTabsData_appArticleTabs__asArticleTab_filters {
  GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeSelectorFilter._();

  factory GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeSelectorFilter(
          [Function(
                  GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeSelectorFilterBuilder
                      b)
              updates]) =
      _$GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeSelectorFilter;

  static void _initializeBuilder(
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeSelectorFilterBuilder
              b) =>
      b..G__typename = 'DateRangeSelectorFilter';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get name;
  BuiltList<
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeSelectorFilter_options>?
      get options;
  _i4.GDatePrecise? get precise;
  int? get min;
  int? get max;
  static Serializer<
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeSelectorFilter>
      get serializer =>
          _$gArticleTabsDataAppArticleTabsAsArticleTabFiltersAsDateRangeSelectorFilterSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeSelectorFilter
          .serializer,
      this) as Map<String, dynamic>);
  static GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeSelectorFilter?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeSelectorFilter
              .serializer,
          json);
}

abstract class GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeSelectorFilter_options
    implements
        Built<
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeSelectorFilter_options,
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeSelectorFilter_optionsBuilder> {
  GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeSelectorFilter_options._();

  factory GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeSelectorFilter_options(
          [Function(
                  GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeSelectorFilter_optionsBuilder
                      b)
              updates]) =
      _$GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeSelectorFilter_options;

  static void _initializeBuilder(
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeSelectorFilter_optionsBuilder
              b) =>
      b..G__typename = 'FilterOption';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get key;
  String get value;
  static Serializer<
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeSelectorFilter_options>
      get serializer =>
          _$gArticleTabsDataAppArticleTabsAsArticleTabFiltersAsDateRangeSelectorFilterOptionsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeSelectorFilter_options
          .serializer,
      this) as Map<String, dynamic>);
  static GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeSelectorFilter_options?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asDateRangeSelectorFilter_options
              .serializer,
          json);
}

abstract class GArticleTabsData_appArticleTabs__asArticleTab_filters__asSuggestionFilter
    implements
        Built<
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asSuggestionFilter,
            GArticleTabsData_appArticleTabs__asArticleTab_filters__asSuggestionFilterBuilder>,
        GArticleTabsData_appArticleTabs__asArticleTab_filters {
  GArticleTabsData_appArticleTabs__asArticleTab_filters__asSuggestionFilter._();

  factory GArticleTabsData_appArticleTabs__asArticleTab_filters__asSuggestionFilter(
          [Function(
                  GArticleTabsData_appArticleTabs__asArticleTab_filters__asSuggestionFilterBuilder
                      b)
              updates]) =
      _$GArticleTabsData_appArticleTabs__asArticleTab_filters__asSuggestionFilter;

  static void _initializeBuilder(
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asSuggestionFilterBuilder
              b) =>
      b..G__typename = 'SuggestionFilter';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get name;
  String? get suggestionID;
  String? get placeholder;
  static Serializer<
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asSuggestionFilter>
      get serializer =>
          _$gArticleTabsDataAppArticleTabsAsArticleTabFiltersAsSuggestionFilterSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GArticleTabsData_appArticleTabs__asArticleTab_filters__asSuggestionFilter
          .serializer,
      this) as Map<String, dynamic>);
  static GArticleTabsData_appArticleTabs__asArticleTab_filters__asSuggestionFilter?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asSuggestionFilter
              .serializer,
          json);
}

abstract class GArticleTabsData_appArticleTabs__asArticleTab_permissions {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GArticleTabsData_appArticleTabs__asArticleTab_permissions>
      get serializer => _i2.InlineFragmentSerializer<
                  GArticleTabsData_appArticleTabs__asArticleTab_permissions>(
              'GArticleTabsData_appArticleTabs__asArticleTab_permissions',
              GArticleTabsData_appArticleTabs__asArticleTab_permissions__base, [
            GArticleTabsData_appArticleTabs__asArticleTab_permissions__asLockPermission,
            GArticleTabsData_appArticleTabs__asArticleTab_permissions__asFrequencyPermission,
            GArticleTabsData_appArticleTabs__asArticleTab_permissions__asPaginationPermission
          ]);
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GArticleTabsData_appArticleTabs__asArticleTab_permissions.serializer,
      this) as Map<String, dynamic>);
  static GArticleTabsData_appArticleTabs__asArticleTab_permissions? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GArticleTabsData_appArticleTabs__asArticleTab_permissions.serializer,
          json);
}

abstract class GArticleTabsData_appArticleTabs__asArticleTab_permissions__base
    implements
        Built<GArticleTabsData_appArticleTabs__asArticleTab_permissions__base,
            GArticleTabsData_appArticleTabs__asArticleTab_permissions__baseBuilder>,
        GArticleTabsData_appArticleTabs__asArticleTab_permissions {
  GArticleTabsData_appArticleTabs__asArticleTab_permissions__base._();

  factory GArticleTabsData_appArticleTabs__asArticleTab_permissions__base(
          [Function(
                  GArticleTabsData_appArticleTabs__asArticleTab_permissions__baseBuilder
                      b)
              updates]) =
      _$GArticleTabsData_appArticleTabs__asArticleTab_permissions__base;

  static void _initializeBuilder(
          GArticleTabsData_appArticleTabs__asArticleTab_permissions__baseBuilder
              b) =>
      b..G__typename = 'Permission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<
          GArticleTabsData_appArticleTabs__asArticleTab_permissions__base>
      get serializer =>
          _$gArticleTabsDataAppArticleTabsAsArticleTabPermissionsBaseSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GArticleTabsData_appArticleTabs__asArticleTab_permissions__base
          .serializer,
      this) as Map<String, dynamic>);
  static GArticleTabsData_appArticleTabs__asArticleTab_permissions__base?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GArticleTabsData_appArticleTabs__asArticleTab_permissions__base
              .serializer,
          json);
}

abstract class GArticleTabsData_appArticleTabs__asArticleTab_permissions__asLockPermission
    implements
        Built<
            GArticleTabsData_appArticleTabs__asArticleTab_permissions__asLockPermission,
            GArticleTabsData_appArticleTabs__asArticleTab_permissions__asLockPermissionBuilder>,
        GArticleTabsData_appArticleTabs__asArticleTab_permissions,
        _i3.GLockPermissionFields {
  GArticleTabsData_appArticleTabs__asArticleTab_permissions__asLockPermission._();

  factory GArticleTabsData_appArticleTabs__asArticleTab_permissions__asLockPermission(
          [Function(
                  GArticleTabsData_appArticleTabs__asArticleTab_permissions__asLockPermissionBuilder
                      b)
              updates]) =
      _$GArticleTabsData_appArticleTabs__asArticleTab_permissions__asLockPermission;

  static void _initializeBuilder(
          GArticleTabsData_appArticleTabs__asArticleTab_permissions__asLockPermissionBuilder
              b) =>
      b..G__typename = 'LockPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get locked;
  static Serializer<
          GArticleTabsData_appArticleTabs__asArticleTab_permissions__asLockPermission>
      get serializer =>
          _$gArticleTabsDataAppArticleTabsAsArticleTabPermissionsAsLockPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GArticleTabsData_appArticleTabs__asArticleTab_permissions__asLockPermission
          .serializer,
      this) as Map<String, dynamic>);
  static GArticleTabsData_appArticleTabs__asArticleTab_permissions__asLockPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GArticleTabsData_appArticleTabs__asArticleTab_permissions__asLockPermission
              .serializer,
          json);
}

abstract class GArticleTabsData_appArticleTabs__asArticleTab_permissions__asFrequencyPermission
    implements
        Built<
            GArticleTabsData_appArticleTabs__asArticleTab_permissions__asFrequencyPermission,
            GArticleTabsData_appArticleTabs__asArticleTab_permissions__asFrequencyPermissionBuilder>,
        GArticleTabsData_appArticleTabs__asArticleTab_permissions,
        _i3.GFrequencyPermissionFields {
  GArticleTabsData_appArticleTabs__asArticleTab_permissions__asFrequencyPermission._();

  factory GArticleTabsData_appArticleTabs__asArticleTab_permissions__asFrequencyPermission(
          [Function(
                  GArticleTabsData_appArticleTabs__asArticleTab_permissions__asFrequencyPermissionBuilder
                      b)
              updates]) =
      _$GArticleTabsData_appArticleTabs__asArticleTab_permissions__asFrequencyPermission;

  static void _initializeBuilder(
          GArticleTabsData_appArticleTabs__asArticleTab_permissions__asFrequencyPermissionBuilder
              b) =>
      b..G__typename = 'FrequencyPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get used;
  int get total;
  int get remaining;
  static Serializer<
          GArticleTabsData_appArticleTabs__asArticleTab_permissions__asFrequencyPermission>
      get serializer =>
          _$gArticleTabsDataAppArticleTabsAsArticleTabPermissionsAsFrequencyPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GArticleTabsData_appArticleTabs__asArticleTab_permissions__asFrequencyPermission
          .serializer,
      this) as Map<String, dynamic>);
  static GArticleTabsData_appArticleTabs__asArticleTab_permissions__asFrequencyPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GArticleTabsData_appArticleTabs__asArticleTab_permissions__asFrequencyPermission
              .serializer,
          json);
}

abstract class GArticleTabsData_appArticleTabs__asArticleTab_permissions__asPaginationPermission
    implements
        Built<
            GArticleTabsData_appArticleTabs__asArticleTab_permissions__asPaginationPermission,
            GArticleTabsData_appArticleTabs__asArticleTab_permissions__asPaginationPermissionBuilder>,
        GArticleTabsData_appArticleTabs__asArticleTab_permissions,
        _i3.GPaginationPermissionFields {
  GArticleTabsData_appArticleTabs__asArticleTab_permissions__asPaginationPermission._();

  factory GArticleTabsData_appArticleTabs__asArticleTab_permissions__asPaginationPermission(
          [Function(
                  GArticleTabsData_appArticleTabs__asArticleTab_permissions__asPaginationPermissionBuilder
                      b)
              updates]) =
      _$GArticleTabsData_appArticleTabs__asArticleTab_permissions__asPaginationPermission;

  static void _initializeBuilder(
          GArticleTabsData_appArticleTabs__asArticleTab_permissions__asPaginationPermissionBuilder
              b) =>
      b..G__typename = 'PaginationPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get rowLimit;
  bool get lockNextPage;
  bool get lockPreviousPage;
  static Serializer<
          GArticleTabsData_appArticleTabs__asArticleTab_permissions__asPaginationPermission>
      get serializer =>
          _$gArticleTabsDataAppArticleTabsAsArticleTabPermissionsAsPaginationPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GArticleTabsData_appArticleTabs__asArticleTab_permissions__asPaginationPermission
          .serializer,
      this) as Map<String, dynamic>);
  static GArticleTabsData_appArticleTabs__asArticleTab_permissions__asPaginationPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GArticleTabsData_appArticleTabs__asArticleTab_permissions__asPaginationPermission
              .serializer,
          json);
}
