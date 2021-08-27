// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAppRealmData> _$gAppRealmDataSerializer =
    new _$GAppRealmDataSerializer();
Serializer<GAppRealmData_appRealms> _$gAppRealmDataAppRealmsSerializer =
    new _$GAppRealmData_appRealmsSerializer();
Serializer<GAppRealmData_appRealms_orderColumns>
    _$gAppRealmDataAppRealmsOrderColumnsSerializer =
    new _$GAppRealmData_appRealms_orderColumnsSerializer();
Serializer<GAppRealmData_appRealms_permissions__base>
    _$gAppRealmDataAppRealmsPermissionsBaseSerializer =
    new _$GAppRealmData_appRealms_permissions__baseSerializer();
Serializer<GAppRealmData_appRealms_permissions__asLockPermission>
    _$gAppRealmDataAppRealmsPermissionsAsLockPermissionSerializer =
    new _$GAppRealmData_appRealms_permissions__asLockPermissionSerializer();
Serializer<GAppRealmData_appRealms_permissions__asFrequencyPermission>
    _$gAppRealmDataAppRealmsPermissionsAsFrequencyPermissionSerializer =
    new _$GAppRealmData_appRealms_permissions__asFrequencyPermissionSerializer();
Serializer<GAppRealmData_appRealms_permissions__asPaginationPermission>
    _$gAppRealmDataAppRealmsPermissionsAsPaginationPermissionSerializer =
    new _$GAppRealmData_appRealms_permissions__asPaginationPermissionSerializer();
Serializer<GAppRealmSearchResultData> _$gAppRealmSearchResultDataSerializer =
    new _$GAppRealmSearchResultDataSerializer();
Serializer<GAppRealmSearchResultData_appRealmSearchResult>
    _$gAppRealmSearchResultDataAppRealmSearchResultSerializer =
    new _$GAppRealmSearchResultData_appRealmSearchResultSerializer();
Serializer<GAppRealmSearchResultData_appRealmSearchResult_nodes>
    _$gAppRealmSearchResultDataAppRealmSearchResultNodesSerializer =
    new _$GAppRealmSearchResultData_appRealmSearchResult_nodesSerializer();
Serializer<GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base>
    _$gAppRealmSearchResultDataAppRealmSearchResultNodesTagsBaseSerializer =
    new _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__baseSerializer();
Serializer<GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag>
    _$gAppRealmSearchResultDataAppRealmSearchResultNodesTagsAsTextTagSerializer =
    new _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTagSerializer();
Serializer<
        GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action>
    _$gAppRealmSearchResultDataAppRealmSearchResultNodesTagsAsTextTagActionSerializer =
    new _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_actionSerializer();
Serializer<GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag>
    _$gAppRealmSearchResultDataAppRealmSearchResultNodesTagsAsRiskTagSerializer =
    new _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTagSerializer();
Serializer<
        GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag>
    _$gAppRealmSearchResultDataAppRealmSearchResultNodesTagsAsQuickSearchTagSerializer =
    new _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTagSerializer();
Serializer<GAppRealmSearchResultData_appRealmSearchResult_pageInfo>
    _$gAppRealmSearchResultDataAppRealmSearchResultPageInfoSerializer =
    new _$GAppRealmSearchResultData_appRealmSearchResult_pageInfoSerializer();
Serializer<GAppRealmSearchResultData_appRealmSearchResult_permissions__base>
    _$gAppRealmSearchResultDataAppRealmSearchResultPermissionsBaseSerializer =
    new _$GAppRealmSearchResultData_appRealmSearchResult_permissions__baseSerializer();
Serializer<
        GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission>
    _$gAppRealmSearchResultDataAppRealmSearchResultPermissionsAsLockPermissionSerializer =
    new _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermissionSerializer();
Serializer<
        GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission>
    _$gAppRealmSearchResultDataAppRealmSearchResultPermissionsAsFrequencyPermissionSerializer =
    new _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermissionSerializer();
Serializer<
        GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission>
    _$gAppRealmSearchResultDataAppRealmSearchResultPermissionsAsPaginationPermissionSerializer =
    new _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermissionSerializer();

class _$GAppRealmDataSerializer implements StructuredSerializer<GAppRealmData> {
  @override
  final Iterable<Type> types = const [GAppRealmData, _$GAppRealmData];
  @override
  final String wireName = 'GAppRealmData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GAppRealmData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'appRealms',
      serializers.serialize(object.appRealms,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GAppRealmData_appRealms)])),
    ];

    return result;
  }

  @override
  GAppRealmData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAppRealmDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'appRealms':
          result.appRealms.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GAppRealmData_appRealms)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GAppRealmData_appRealmsSerializer
    implements StructuredSerializer<GAppRealmData_appRealms> {
  @override
  final Iterable<Type> types = const [
    GAppRealmData_appRealms,
    _$GAppRealmData_appRealms
  ];
  @override
  final String wireName = 'GAppRealmData_appRealms';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAppRealmData_appRealms object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.orderColumns;
    if (value != null) {
      result
        ..add('orderColumns')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList,
                const [const FullType(GAppRealmData_appRealms_orderColumns)])));
    }
    value = object.permissions;
    if (value != null) {
      result
        ..add('permissions')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList,
                const [const FullType(GAppRealmData_appRealms_permissions)])));
    }
    return result;
  }

  @override
  GAppRealmData_appRealms deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAppRealmData_appRealmsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'orderColumns':
          result.orderColumns.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GAppRealmData_appRealms_orderColumns)
              ]))! as BuiltList<Object?>);
          break;
        case 'permissions':
          result.permissions.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GAppRealmData_appRealms_permissions)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GAppRealmData_appRealms_orderColumnsSerializer
    implements StructuredSerializer<GAppRealmData_appRealms_orderColumns> {
  @override
  final Iterable<Type> types = const [
    GAppRealmData_appRealms_orderColumns,
    _$GAppRealmData_appRealms_orderColumns
  ];
  @override
  final String wireName = 'GAppRealmData_appRealms_orderColumns';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAppRealmData_appRealms_orderColumns object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GAppRealmData_appRealms_orderColumns deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAppRealmData_appRealms_orderColumnsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GAppRealmData_appRealms_permissions__baseSerializer
    implements StructuredSerializer<GAppRealmData_appRealms_permissions__base> {
  @override
  final Iterable<Type> types = const [
    GAppRealmData_appRealms_permissions__base,
    _$GAppRealmData_appRealms_permissions__base
  ];
  @override
  final String wireName = 'GAppRealmData_appRealms_permissions__base';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAppRealmData_appRealms_permissions__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GAppRealmData_appRealms_permissions__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAppRealmData_appRealms_permissions__baseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GAppRealmData_appRealms_permissions__asLockPermissionSerializer
    implements
        StructuredSerializer<
            GAppRealmData_appRealms_permissions__asLockPermission> {
  @override
  final Iterable<Type> types = const [
    GAppRealmData_appRealms_permissions__asLockPermission,
    _$GAppRealmData_appRealms_permissions__asLockPermission
  ];
  @override
  final String wireName =
      'GAppRealmData_appRealms_permissions__asLockPermission';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GAppRealmData_appRealms_permissions__asLockPermission object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'locked',
      serializers.serialize(object.locked, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GAppRealmData_appRealms_permissions__asLockPermission deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GAppRealmData_appRealms_permissions__asLockPermissionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'locked':
          result.locked = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GAppRealmData_appRealms_permissions__asFrequencyPermissionSerializer
    implements
        StructuredSerializer<
            GAppRealmData_appRealms_permissions__asFrequencyPermission> {
  @override
  final Iterable<Type> types = const [
    GAppRealmData_appRealms_permissions__asFrequencyPermission,
    _$GAppRealmData_appRealms_permissions__asFrequencyPermission
  ];
  @override
  final String wireName =
      'GAppRealmData_appRealms_permissions__asFrequencyPermission';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GAppRealmData_appRealms_permissions__asFrequencyPermission object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'used',
      serializers.serialize(object.used, specifiedType: const FullType(int)),
      'total',
      serializers.serialize(object.total, specifiedType: const FullType(int)),
      'remaining',
      serializers.serialize(object.remaining,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GAppRealmData_appRealms_permissions__asFrequencyPermission deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GAppRealmData_appRealms_permissions__asFrequencyPermissionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'used':
          result.used = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'remaining':
          result.remaining = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GAppRealmData_appRealms_permissions__asPaginationPermissionSerializer
    implements
        StructuredSerializer<
            GAppRealmData_appRealms_permissions__asPaginationPermission> {
  @override
  final Iterable<Type> types = const [
    GAppRealmData_appRealms_permissions__asPaginationPermission,
    _$GAppRealmData_appRealms_permissions__asPaginationPermission
  ];
  @override
  final String wireName =
      'GAppRealmData_appRealms_permissions__asPaginationPermission';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GAppRealmData_appRealms_permissions__asPaginationPermission object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'rowLimit',
      serializers.serialize(object.rowLimit,
          specifiedType: const FullType(int)),
      'lockNextPage',
      serializers.serialize(object.lockNextPage,
          specifiedType: const FullType(bool)),
      'lockPreviousPage',
      serializers.serialize(object.lockPreviousPage,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GAppRealmData_appRealms_permissions__asPaginationPermission deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GAppRealmData_appRealms_permissions__asPaginationPermissionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'rowLimit':
          result.rowLimit = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'lockNextPage':
          result.lockNextPage = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'lockPreviousPage':
          result.lockPreviousPage = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GAppRealmSearchResultDataSerializer
    implements StructuredSerializer<GAppRealmSearchResultData> {
  @override
  final Iterable<Type> types = const [
    GAppRealmSearchResultData,
    _$GAppRealmSearchResultData
  ];
  @override
  final String wireName = 'GAppRealmSearchResultData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAppRealmSearchResultData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.appRealmSearchResult;
    if (value != null) {
      result
        ..add('appRealmSearchResult')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GAppRealmSearchResultData_appRealmSearchResult)));
    }
    return result;
  }

  @override
  GAppRealmSearchResultData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAppRealmSearchResultDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'appRealmSearchResult':
          result.appRealmSearchResult.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GAppRealmSearchResultData_appRealmSearchResult))!
              as GAppRealmSearchResultData_appRealmSearchResult);
          break;
      }
    }

    return result.build();
  }
}

class _$GAppRealmSearchResultData_appRealmSearchResultSerializer
    implements
        StructuredSerializer<GAppRealmSearchResultData_appRealmSearchResult> {
  @override
  final Iterable<Type> types = const [
    GAppRealmSearchResultData_appRealmSearchResult,
    _$GAppRealmSearchResultData_appRealmSearchResult
  ];
  @override
  final String wireName = 'GAppRealmSearchResultData_appRealmSearchResult';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GAppRealmSearchResultData_appRealmSearchResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'pageInfo',
      serializers.serialize(object.pageInfo,
          specifiedType: const FullType(
              GAppRealmSearchResultData_appRealmSearchResult_pageInfo)),
    ];
    Object? value;
    value = object.totalCount;
    if (value != null) {
      result
        ..add('totalCount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.nodes;
    if (value != null) {
      result
        ..add('nodes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  GAppRealmSearchResultData_appRealmSearchResult_nodes)
            ])));
    }
    value = object.permissions;
    if (value != null) {
      result
        ..add('permissions')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  GAppRealmSearchResultData_appRealmSearchResult_permissions)
            ])));
    }
    return result;
  }

  @override
  GAppRealmSearchResultData_appRealmSearchResult deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAppRealmSearchResultData_appRealmSearchResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'totalCount':
          result.totalCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'nodes':
          result.nodes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    GAppRealmSearchResultData_appRealmSearchResult_nodes)
              ]))! as BuiltList<Object?>);
          break;
        case 'pageInfo':
          result.pageInfo.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GAppRealmSearchResultData_appRealmSearchResult_pageInfo))!
              as GAppRealmSearchResultData_appRealmSearchResult_pageInfo);
          break;
        case 'permissions':
          result.permissions.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    GAppRealmSearchResultData_appRealmSearchResult_permissions)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GAppRealmSearchResultData_appRealmSearchResult_nodesSerializer
    implements
        StructuredSerializer<
            GAppRealmSearchResultData_appRealmSearchResult_nodes> {
  @override
  final Iterable<Type> types = const [
    GAppRealmSearchResultData_appRealmSearchResult_nodes,
    _$GAppRealmSearchResultData_appRealmSearchResult_nodes
  ];
  @override
  final String wireName =
      'GAppRealmSearchResultData_appRealmSearchResult_nodes';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GAppRealmSearchResultData_appRealmSearchResult_nodes object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.entityID;
    if (value != null) {
      result
        ..add('entityID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.entityType;
    if (value != null) {
      result
        ..add('entityType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i4.GEntityType)));
    }
    value = object.logoURI;
    if (value != null) {
      result
        ..add('logoURI')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.primaryName;
    if (value != null) {
      result
        ..add('primaryName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.label;
    if (value != null) {
      result
        ..add('label')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tags;
    if (value != null) {
      result
        ..add('tags')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags)
            ])));
    }
    return result;
  }

  @override
  GAppRealmSearchResultData_appRealmSearchResult_nodes deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GAppRealmSearchResultData_appRealmSearchResult_nodesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'entityID':
          result.entityID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'entityType':
          result.entityType = serializers.deserialize(value,
                  specifiedType: const FullType(_i4.GEntityType))
              as _i4.GEntityType?;
          break;
        case 'logoURI':
          result.logoURI = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'primaryName':
          result.primaryName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'label':
          result.label = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tags':
          result.tags.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    GAppRealmSearchResultData_appRealmSearchResult_nodes_tags)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__baseSerializer
    implements
        StructuredSerializer<
            GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base> {
  @override
  final Iterable<Type> types = const [
    GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base,
    _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base
  ];
  @override
  final String wireName =
      'GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__baseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTagSerializer
    implements
        StructuredSerializer<
            GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag> {
  @override
  final Iterable<Type> types = const [
    GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag,
    _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag
  ];
  @override
  final String wireName =
      'GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.action;
    if (value != null) {
      result
        ..add('action')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action)));
    }
    return result;
  }

  @override
  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTagBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'action':
          result.action.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action))!
              as GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action);
          break;
      }
    }

    return result.build();
  }
}

class _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_actionSerializer
    implements
        StructuredSerializer<
            GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action> {
  @override
  final Iterable<Type> types = const [
    GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action,
    _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action
  ];
  @override
  final String wireName =
      'GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(_i4.GActionType)),
    ];
    Object? value;
    value = object.args;
    if (value != null) {
      result
        ..add('args')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                Map, const [const FullType(String), const FullType(dynamic)])));
    }
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_actionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
                  specifiedType: const FullType(_i4.GActionType))
              as _i4.GActionType;
          break;
        case 'args':
          result.args = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ])) as Map<String, dynamic>?;
          break;
        case 'data':
          result.data = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTagSerializer
    implements
        StructuredSerializer<
            GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag> {
  @override
  final Iterable<Type> types = const [
    GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag,
    _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag
  ];
  @override
  final String wireName =
      'GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.level;
    if (value != null) {
      result
        ..add('level')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTagBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'level':
          result.level = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTagSerializer
    implements
        StructuredSerializer<
            GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag> {
  @override
  final Iterable<Type> types = const [
    GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag,
    _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag
  ];
  @override
  final String wireName =
      'GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.icon;
    if (value != null) {
      result
        ..add('icon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nameType;
    if (value != null) {
      result
        ..add('nameType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.matchedName;
    if (value != null) {
      result
        ..add('matchedName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTagBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'icon':
          result.icon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nameType':
          result.nameType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'matchedName':
          result.matchedName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GAppRealmSearchResultData_appRealmSearchResult_pageInfoSerializer
    implements
        StructuredSerializer<
            GAppRealmSearchResultData_appRealmSearchResult_pageInfo> {
  @override
  final Iterable<Type> types = const [
    GAppRealmSearchResultData_appRealmSearchResult_pageInfo,
    _$GAppRealmSearchResultData_appRealmSearchResult_pageInfo
  ];
  @override
  final String wireName =
      'GAppRealmSearchResultData_appRealmSearchResult_pageInfo';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GAppRealmSearchResultData_appRealmSearchResult_pageInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'hasPreviousPage',
      serializers.serialize(object.hasPreviousPage,
          specifiedType: const FullType(bool)),
      'hasNextPage',
      serializers.serialize(object.hasNextPage,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.startCursor;
    if (value != null) {
      result
        ..add('startCursor')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.endCursor;
    if (value != null) {
      result
        ..add('endCursor')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GAppRealmSearchResultData_appRealmSearchResult_pageInfo deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GAppRealmSearchResultData_appRealmSearchResult_pageInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'hasPreviousPage':
          result.hasPreviousPage = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'hasNextPage':
          result.hasNextPage = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'startCursor':
          result.startCursor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'endCursor':
          result.endCursor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GAppRealmSearchResultData_appRealmSearchResult_permissions__baseSerializer
    implements
        StructuredSerializer<
            GAppRealmSearchResultData_appRealmSearchResult_permissions__base> {
  @override
  final Iterable<Type> types = const [
    GAppRealmSearchResultData_appRealmSearchResult_permissions__base,
    _$GAppRealmSearchResultData_appRealmSearchResult_permissions__base
  ];
  @override
  final String wireName =
      'GAppRealmSearchResultData_appRealmSearchResult_permissions__base';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GAppRealmSearchResultData_appRealmSearchResult_permissions__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GAppRealmSearchResultData_appRealmSearchResult_permissions__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GAppRealmSearchResultData_appRealmSearchResult_permissions__baseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermissionSerializer
    implements
        StructuredSerializer<
            GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission> {
  @override
  final Iterable<Type> types = const [
    GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission,
    _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission
  ];
  @override
  final String wireName =
      'GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'locked',
      serializers.serialize(object.locked, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermissionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'locked':
          result.locked = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermissionSerializer
    implements
        StructuredSerializer<
            GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission> {
  @override
  final Iterable<Type> types = const [
    GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission,
    _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission
  ];
  @override
  final String wireName =
      'GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'used',
      serializers.serialize(object.used, specifiedType: const FullType(int)),
      'total',
      serializers.serialize(object.total, specifiedType: const FullType(int)),
      'remaining',
      serializers.serialize(object.remaining,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermissionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'used':
          result.used = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'remaining':
          result.remaining = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermissionSerializer
    implements
        StructuredSerializer<
            GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission> {
  @override
  final Iterable<Type> types = const [
    GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission,
    _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission
  ];
  @override
  final String wireName =
      'GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'rowLimit',
      serializers.serialize(object.rowLimit,
          specifiedType: const FullType(int)),
      'lockNextPage',
      serializers.serialize(object.lockNextPage,
          specifiedType: const FullType(bool)),
      'lockPreviousPage',
      serializers.serialize(object.lockPreviousPage,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermissionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'rowLimit':
          result.rowLimit = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'lockNextPage':
          result.lockNextPage = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'lockPreviousPage':
          result.lockPreviousPage = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GAppRealmData extends GAppRealmData {
  @override
  final String G__typename;
  @override
  final BuiltList<GAppRealmData_appRealms> appRealms;

  factory _$GAppRealmData([void Function(GAppRealmDataBuilder)? updates]) =>
      (new GAppRealmDataBuilder()..update(updates)).build();

  _$GAppRealmData._({required this.G__typename, required this.appRealms})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GAppRealmData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        appRealms, 'GAppRealmData', 'appRealms');
  }

  @override
  GAppRealmData rebuild(void Function(GAppRealmDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAppRealmDataBuilder toBuilder() => new GAppRealmDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAppRealmData &&
        G__typename == other.G__typename &&
        appRealms == other.appRealms;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), appRealms.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GAppRealmData')
          ..add('G__typename', G__typename)
          ..add('appRealms', appRealms))
        .toString();
  }
}

class GAppRealmDataBuilder
    implements Builder<GAppRealmData, GAppRealmDataBuilder> {
  _$GAppRealmData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GAppRealmData_appRealms>? _appRealms;
  ListBuilder<GAppRealmData_appRealms> get appRealms =>
      _$this._appRealms ??= new ListBuilder<GAppRealmData_appRealms>();
  set appRealms(ListBuilder<GAppRealmData_appRealms>? appRealms) =>
      _$this._appRealms = appRealms;

  GAppRealmDataBuilder() {
    GAppRealmData._initializeBuilder(this);
  }

  GAppRealmDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _appRealms = $v.appRealms.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAppRealmData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAppRealmData;
  }

  @override
  void update(void Function(GAppRealmDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAppRealmData build() {
    _$GAppRealmData _$result;
    try {
      _$result = _$v ??
          new _$GAppRealmData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GAppRealmData', 'G__typename'),
              appRealms: appRealms.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'appRealms';
        appRealms.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GAppRealmData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAppRealmData_appRealms extends GAppRealmData_appRealms {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final BuiltList<GAppRealmData_appRealms_orderColumns>? orderColumns;
  @override
  final BuiltList<GAppRealmData_appRealms_permissions>? permissions;

  factory _$GAppRealmData_appRealms(
          [void Function(GAppRealmData_appRealmsBuilder)? updates]) =>
      (new GAppRealmData_appRealmsBuilder()..update(updates)).build();

  _$GAppRealmData_appRealms._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.orderColumns,
      this.permissions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GAppRealmData_appRealms', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, 'GAppRealmData_appRealms', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, 'GAppRealmData_appRealms', 'name');
  }

  @override
  GAppRealmData_appRealms rebuild(
          void Function(GAppRealmData_appRealmsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAppRealmData_appRealmsBuilder toBuilder() =>
      new GAppRealmData_appRealmsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAppRealmData_appRealms &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        orderColumns == other.orderColumns &&
        permissions == other.permissions;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, G__typename.hashCode), id.hashCode), name.hashCode),
            orderColumns.hashCode),
        permissions.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GAppRealmData_appRealms')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('orderColumns', orderColumns)
          ..add('permissions', permissions))
        .toString();
  }
}

class GAppRealmData_appRealmsBuilder
    implements
        Builder<GAppRealmData_appRealms, GAppRealmData_appRealmsBuilder> {
  _$GAppRealmData_appRealms? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<GAppRealmData_appRealms_orderColumns>? _orderColumns;
  ListBuilder<GAppRealmData_appRealms_orderColumns> get orderColumns =>
      _$this._orderColumns ??=
          new ListBuilder<GAppRealmData_appRealms_orderColumns>();
  set orderColumns(
          ListBuilder<GAppRealmData_appRealms_orderColumns>? orderColumns) =>
      _$this._orderColumns = orderColumns;

  ListBuilder<GAppRealmData_appRealms_permissions>? _permissions;
  ListBuilder<GAppRealmData_appRealms_permissions> get permissions =>
      _$this._permissions ??=
          new ListBuilder<GAppRealmData_appRealms_permissions>();
  set permissions(
          ListBuilder<GAppRealmData_appRealms_permissions>? permissions) =>
      _$this._permissions = permissions;

  GAppRealmData_appRealmsBuilder() {
    GAppRealmData_appRealms._initializeBuilder(this);
  }

  GAppRealmData_appRealmsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _orderColumns = $v.orderColumns?.toBuilder();
      _permissions = $v.permissions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAppRealmData_appRealms other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAppRealmData_appRealms;
  }

  @override
  void update(void Function(GAppRealmData_appRealmsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAppRealmData_appRealms build() {
    _$GAppRealmData_appRealms _$result;
    try {
      _$result = _$v ??
          new _$GAppRealmData_appRealms._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GAppRealmData_appRealms', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, 'GAppRealmData_appRealms', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, 'GAppRealmData_appRealms', 'name'),
              orderColumns: _orderColumns?.build(),
              permissions: _permissions?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'orderColumns';
        _orderColumns?.build();
        _$failedField = 'permissions';
        _permissions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GAppRealmData_appRealms', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAppRealmData_appRealms_orderColumns
    extends GAppRealmData_appRealms_orderColumns {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GAppRealmData_appRealms_orderColumns(
          [void Function(GAppRealmData_appRealms_orderColumnsBuilder)?
              updates]) =>
      (new GAppRealmData_appRealms_orderColumnsBuilder()..update(updates))
          .build();

  _$GAppRealmData_appRealms_orderColumns._(
      {required this.G__typename, required this.id, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GAppRealmData_appRealms_orderColumns', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, 'GAppRealmData_appRealms_orderColumns', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, 'GAppRealmData_appRealms_orderColumns', 'name');
  }

  @override
  GAppRealmData_appRealms_orderColumns rebuild(
          void Function(GAppRealmData_appRealms_orderColumnsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAppRealmData_appRealms_orderColumnsBuilder toBuilder() =>
      new GAppRealmData_appRealms_orderColumnsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAppRealmData_appRealms_orderColumns &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, G__typename.hashCode), id.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GAppRealmData_appRealms_orderColumns')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GAppRealmData_appRealms_orderColumnsBuilder
    implements
        Builder<GAppRealmData_appRealms_orderColumns,
            GAppRealmData_appRealms_orderColumnsBuilder> {
  _$GAppRealmData_appRealms_orderColumns? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GAppRealmData_appRealms_orderColumnsBuilder() {
    GAppRealmData_appRealms_orderColumns._initializeBuilder(this);
  }

  GAppRealmData_appRealms_orderColumnsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAppRealmData_appRealms_orderColumns other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAppRealmData_appRealms_orderColumns;
  }

  @override
  void update(
      void Function(GAppRealmData_appRealms_orderColumnsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAppRealmData_appRealms_orderColumns build() {
    final _$result = _$v ??
        new _$GAppRealmData_appRealms_orderColumns._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                'GAppRealmData_appRealms_orderColumns', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, 'GAppRealmData_appRealms_orderColumns', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'GAppRealmData_appRealms_orderColumns', 'name'));
    replace(_$result);
    return _$result;
  }
}

class _$GAppRealmData_appRealms_permissions__base
    extends GAppRealmData_appRealms_permissions__base {
  @override
  final String G__typename;

  factory _$GAppRealmData_appRealms_permissions__base(
          [void Function(GAppRealmData_appRealms_permissions__baseBuilder)?
              updates]) =>
      (new GAppRealmData_appRealms_permissions__baseBuilder()..update(updates))
          .build();

  _$GAppRealmData_appRealms_permissions__base._({required this.G__typename})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GAppRealmData_appRealms_permissions__base', 'G__typename');
  }

  @override
  GAppRealmData_appRealms_permissions__base rebuild(
          void Function(GAppRealmData_appRealms_permissions__baseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAppRealmData_appRealms_permissions__baseBuilder toBuilder() =>
      new GAppRealmData_appRealms_permissions__baseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAppRealmData_appRealms_permissions__base &&
        G__typename == other.G__typename;
  }

  @override
  int get hashCode {
    return $jf($jc(0, G__typename.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GAppRealmData_appRealms_permissions__base')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GAppRealmData_appRealms_permissions__baseBuilder
    implements
        Builder<GAppRealmData_appRealms_permissions__base,
            GAppRealmData_appRealms_permissions__baseBuilder> {
  _$GAppRealmData_appRealms_permissions__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GAppRealmData_appRealms_permissions__baseBuilder() {
    GAppRealmData_appRealms_permissions__base._initializeBuilder(this);
  }

  GAppRealmData_appRealms_permissions__baseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAppRealmData_appRealms_permissions__base other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAppRealmData_appRealms_permissions__base;
  }

  @override
  void update(
      void Function(GAppRealmData_appRealms_permissions__baseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAppRealmData_appRealms_permissions__base build() {
    final _$result = _$v ??
        new _$GAppRealmData_appRealms_permissions__base._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                'GAppRealmData_appRealms_permissions__base', 'G__typename'));
    replace(_$result);
    return _$result;
  }
}

class _$GAppRealmData_appRealms_permissions__asLockPermission
    extends GAppRealmData_appRealms_permissions__asLockPermission {
  @override
  final String G__typename;
  @override
  final bool locked;

  factory _$GAppRealmData_appRealms_permissions__asLockPermission(
          [void Function(
                  GAppRealmData_appRealms_permissions__asLockPermissionBuilder)?
              updates]) =>
      (new GAppRealmData_appRealms_permissions__asLockPermissionBuilder()
            ..update(updates))
          .build();

  _$GAppRealmData_appRealms_permissions__asLockPermission._(
      {required this.G__typename, required this.locked})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GAppRealmData_appRealms_permissions__asLockPermission', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(locked,
        'GAppRealmData_appRealms_permissions__asLockPermission', 'locked');
  }

  @override
  GAppRealmData_appRealms_permissions__asLockPermission rebuild(
          void Function(
                  GAppRealmData_appRealms_permissions__asLockPermissionBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAppRealmData_appRealms_permissions__asLockPermissionBuilder toBuilder() =>
      new GAppRealmData_appRealms_permissions__asLockPermissionBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAppRealmData_appRealms_permissions__asLockPermission &&
        G__typename == other.G__typename &&
        locked == other.locked;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), locked.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GAppRealmData_appRealms_permissions__asLockPermission')
          ..add('G__typename', G__typename)
          ..add('locked', locked))
        .toString();
  }
}

class GAppRealmData_appRealms_permissions__asLockPermissionBuilder
    implements
        Builder<GAppRealmData_appRealms_permissions__asLockPermission,
            GAppRealmData_appRealms_permissions__asLockPermissionBuilder> {
  _$GAppRealmData_appRealms_permissions__asLockPermission? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _locked;
  bool? get locked => _$this._locked;
  set locked(bool? locked) => _$this._locked = locked;

  GAppRealmData_appRealms_permissions__asLockPermissionBuilder() {
    GAppRealmData_appRealms_permissions__asLockPermission._initializeBuilder(
        this);
  }

  GAppRealmData_appRealms_permissions__asLockPermissionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _locked = $v.locked;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAppRealmData_appRealms_permissions__asLockPermission other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAppRealmData_appRealms_permissions__asLockPermission;
  }

  @override
  void update(
      void Function(
              GAppRealmData_appRealms_permissions__asLockPermissionBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAppRealmData_appRealms_permissions__asLockPermission build() {
    final _$result = _$v ??
        new _$GAppRealmData_appRealms_permissions__asLockPermission._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GAppRealmData_appRealms_permissions__asLockPermission',
                'G__typename'),
            locked: BuiltValueNullFieldError.checkNotNull(
                locked,
                'GAppRealmData_appRealms_permissions__asLockPermission',
                'locked'));
    replace(_$result);
    return _$result;
  }
}

class _$GAppRealmData_appRealms_permissions__asFrequencyPermission
    extends GAppRealmData_appRealms_permissions__asFrequencyPermission {
  @override
  final String G__typename;
  @override
  final int used;
  @override
  final int total;
  @override
  final int remaining;

  factory _$GAppRealmData_appRealms_permissions__asFrequencyPermission(
          [void Function(
                  GAppRealmData_appRealms_permissions__asFrequencyPermissionBuilder)?
              updates]) =>
      (new GAppRealmData_appRealms_permissions__asFrequencyPermissionBuilder()
            ..update(updates))
          .build();

  _$GAppRealmData_appRealms_permissions__asFrequencyPermission._(
      {required this.G__typename,
      required this.used,
      required this.total,
      required this.remaining})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        'GAppRealmData_appRealms_permissions__asFrequencyPermission',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(used,
        'GAppRealmData_appRealms_permissions__asFrequencyPermission', 'used');
    BuiltValueNullFieldError.checkNotNull(total,
        'GAppRealmData_appRealms_permissions__asFrequencyPermission', 'total');
    BuiltValueNullFieldError.checkNotNull(
        remaining,
        'GAppRealmData_appRealms_permissions__asFrequencyPermission',
        'remaining');
  }

  @override
  GAppRealmData_appRealms_permissions__asFrequencyPermission rebuild(
          void Function(
                  GAppRealmData_appRealms_permissions__asFrequencyPermissionBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAppRealmData_appRealms_permissions__asFrequencyPermissionBuilder
      toBuilder() =>
          new GAppRealmData_appRealms_permissions__asFrequencyPermissionBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GAppRealmData_appRealms_permissions__asFrequencyPermission &&
        G__typename == other.G__typename &&
        used == other.used &&
        total == other.total &&
        remaining == other.remaining;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, G__typename.hashCode), used.hashCode), total.hashCode),
        remaining.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GAppRealmData_appRealms_permissions__asFrequencyPermission')
          ..add('G__typename', G__typename)
          ..add('used', used)
          ..add('total', total)
          ..add('remaining', remaining))
        .toString();
  }
}

class GAppRealmData_appRealms_permissions__asFrequencyPermissionBuilder
    implements
        Builder<GAppRealmData_appRealms_permissions__asFrequencyPermission,
            GAppRealmData_appRealms_permissions__asFrequencyPermissionBuilder> {
  _$GAppRealmData_appRealms_permissions__asFrequencyPermission? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _used;
  int? get used => _$this._used;
  set used(int? used) => _$this._used = used;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  int? _remaining;
  int? get remaining => _$this._remaining;
  set remaining(int? remaining) => _$this._remaining = remaining;

  GAppRealmData_appRealms_permissions__asFrequencyPermissionBuilder() {
    GAppRealmData_appRealms_permissions__asFrequencyPermission
        ._initializeBuilder(this);
  }

  GAppRealmData_appRealms_permissions__asFrequencyPermissionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _used = $v.used;
      _total = $v.total;
      _remaining = $v.remaining;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GAppRealmData_appRealms_permissions__asFrequencyPermission other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAppRealmData_appRealms_permissions__asFrequencyPermission;
  }

  @override
  void update(
      void Function(
              GAppRealmData_appRealms_permissions__asFrequencyPermissionBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAppRealmData_appRealms_permissions__asFrequencyPermission build() {
    final _$result = _$v ??
        new _$GAppRealmData_appRealms_permissions__asFrequencyPermission._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GAppRealmData_appRealms_permissions__asFrequencyPermission',
                'G__typename'),
            used: BuiltValueNullFieldError.checkNotNull(
                used,
                'GAppRealmData_appRealms_permissions__asFrequencyPermission',
                'used'),
            total: BuiltValueNullFieldError.checkNotNull(
                total,
                'GAppRealmData_appRealms_permissions__asFrequencyPermission',
                'total'),
            remaining: BuiltValueNullFieldError.checkNotNull(
                remaining,
                'GAppRealmData_appRealms_permissions__asFrequencyPermission',
                'remaining'));
    replace(_$result);
    return _$result;
  }
}

class _$GAppRealmData_appRealms_permissions__asPaginationPermission
    extends GAppRealmData_appRealms_permissions__asPaginationPermission {
  @override
  final String G__typename;
  @override
  final int rowLimit;
  @override
  final bool lockNextPage;
  @override
  final bool lockPreviousPage;

  factory _$GAppRealmData_appRealms_permissions__asPaginationPermission(
          [void Function(
                  GAppRealmData_appRealms_permissions__asPaginationPermissionBuilder)?
              updates]) =>
      (new GAppRealmData_appRealms_permissions__asPaginationPermissionBuilder()
            ..update(updates))
          .build();

  _$GAppRealmData_appRealms_permissions__asPaginationPermission._(
      {required this.G__typename,
      required this.rowLimit,
      required this.lockNextPage,
      required this.lockPreviousPage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        'GAppRealmData_appRealms_permissions__asPaginationPermission',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        rowLimit,
        'GAppRealmData_appRealms_permissions__asPaginationPermission',
        'rowLimit');
    BuiltValueNullFieldError.checkNotNull(
        lockNextPage,
        'GAppRealmData_appRealms_permissions__asPaginationPermission',
        'lockNextPage');
    BuiltValueNullFieldError.checkNotNull(
        lockPreviousPage,
        'GAppRealmData_appRealms_permissions__asPaginationPermission',
        'lockPreviousPage');
  }

  @override
  GAppRealmData_appRealms_permissions__asPaginationPermission rebuild(
          void Function(
                  GAppRealmData_appRealms_permissions__asPaginationPermissionBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAppRealmData_appRealms_permissions__asPaginationPermissionBuilder
      toBuilder() =>
          new GAppRealmData_appRealms_permissions__asPaginationPermissionBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GAppRealmData_appRealms_permissions__asPaginationPermission &&
        G__typename == other.G__typename &&
        rowLimit == other.rowLimit &&
        lockNextPage == other.lockNextPage &&
        lockPreviousPage == other.lockPreviousPage;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, G__typename.hashCode), rowLimit.hashCode),
            lockNextPage.hashCode),
        lockPreviousPage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GAppRealmData_appRealms_permissions__asPaginationPermission')
          ..add('G__typename', G__typename)
          ..add('rowLimit', rowLimit)
          ..add('lockNextPage', lockNextPage)
          ..add('lockPreviousPage', lockPreviousPage))
        .toString();
  }
}

class GAppRealmData_appRealms_permissions__asPaginationPermissionBuilder
    implements
        Builder<GAppRealmData_appRealms_permissions__asPaginationPermission,
            GAppRealmData_appRealms_permissions__asPaginationPermissionBuilder> {
  _$GAppRealmData_appRealms_permissions__asPaginationPermission? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _rowLimit;
  int? get rowLimit => _$this._rowLimit;
  set rowLimit(int? rowLimit) => _$this._rowLimit = rowLimit;

  bool? _lockNextPage;
  bool? get lockNextPage => _$this._lockNextPage;
  set lockNextPage(bool? lockNextPage) => _$this._lockNextPage = lockNextPage;

  bool? _lockPreviousPage;
  bool? get lockPreviousPage => _$this._lockPreviousPage;
  set lockPreviousPage(bool? lockPreviousPage) =>
      _$this._lockPreviousPage = lockPreviousPage;

  GAppRealmData_appRealms_permissions__asPaginationPermissionBuilder() {
    GAppRealmData_appRealms_permissions__asPaginationPermission
        ._initializeBuilder(this);
  }

  GAppRealmData_appRealms_permissions__asPaginationPermissionBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _rowLimit = $v.rowLimit;
      _lockNextPage = $v.lockNextPage;
      _lockPreviousPage = $v.lockPreviousPage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GAppRealmData_appRealms_permissions__asPaginationPermission other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v =
        other as _$GAppRealmData_appRealms_permissions__asPaginationPermission;
  }

  @override
  void update(
      void Function(
              GAppRealmData_appRealms_permissions__asPaginationPermissionBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAppRealmData_appRealms_permissions__asPaginationPermission build() {
    final _$result = _$v ??
        new _$GAppRealmData_appRealms_permissions__asPaginationPermission._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GAppRealmData_appRealms_permissions__asPaginationPermission',
                'G__typename'),
            rowLimit:
                BuiltValueNullFieldError.checkNotNull(
                    rowLimit,
                    'GAppRealmData_appRealms_permissions__asPaginationPermission',
                    'rowLimit'),
            lockNextPage: BuiltValueNullFieldError.checkNotNull(
                lockNextPage,
                'GAppRealmData_appRealms_permissions__asPaginationPermission',
                'lockNextPage'),
            lockPreviousPage: BuiltValueNullFieldError.checkNotNull(
                lockPreviousPage,
                'GAppRealmData_appRealms_permissions__asPaginationPermission',
                'lockPreviousPage'));
    replace(_$result);
    return _$result;
  }
}

class _$GAppRealmSearchResultData extends GAppRealmSearchResultData {
  @override
  final String G__typename;
  @override
  final GAppRealmSearchResultData_appRealmSearchResult? appRealmSearchResult;

  factory _$GAppRealmSearchResultData(
          [void Function(GAppRealmSearchResultDataBuilder)? updates]) =>
      (new GAppRealmSearchResultDataBuilder()..update(updates)).build();

  _$GAppRealmSearchResultData._(
      {required this.G__typename, this.appRealmSearchResult})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GAppRealmSearchResultData', 'G__typename');
  }

  @override
  GAppRealmSearchResultData rebuild(
          void Function(GAppRealmSearchResultDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAppRealmSearchResultDataBuilder toBuilder() =>
      new GAppRealmSearchResultDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAppRealmSearchResultData &&
        G__typename == other.G__typename &&
        appRealmSearchResult == other.appRealmSearchResult;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, G__typename.hashCode), appRealmSearchResult.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GAppRealmSearchResultData')
          ..add('G__typename', G__typename)
          ..add('appRealmSearchResult', appRealmSearchResult))
        .toString();
  }
}

class GAppRealmSearchResultDataBuilder
    implements
        Builder<GAppRealmSearchResultData, GAppRealmSearchResultDataBuilder> {
  _$GAppRealmSearchResultData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GAppRealmSearchResultData_appRealmSearchResultBuilder? _appRealmSearchResult;
  GAppRealmSearchResultData_appRealmSearchResultBuilder
      get appRealmSearchResult => _$this._appRealmSearchResult ??=
          new GAppRealmSearchResultData_appRealmSearchResultBuilder();
  set appRealmSearchResult(
          GAppRealmSearchResultData_appRealmSearchResultBuilder?
              appRealmSearchResult) =>
      _$this._appRealmSearchResult = appRealmSearchResult;

  GAppRealmSearchResultDataBuilder() {
    GAppRealmSearchResultData._initializeBuilder(this);
  }

  GAppRealmSearchResultDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _appRealmSearchResult = $v.appRealmSearchResult?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAppRealmSearchResultData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAppRealmSearchResultData;
  }

  @override
  void update(void Function(GAppRealmSearchResultDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAppRealmSearchResultData build() {
    _$GAppRealmSearchResultData _$result;
    try {
      _$result = _$v ??
          new _$GAppRealmSearchResultData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GAppRealmSearchResultData', 'G__typename'),
              appRealmSearchResult: _appRealmSearchResult?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'appRealmSearchResult';
        _appRealmSearchResult?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GAppRealmSearchResultData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAppRealmSearchResultData_appRealmSearchResult
    extends GAppRealmSearchResultData_appRealmSearchResult {
  @override
  final String G__typename;
  @override
  final int? totalCount;
  @override
  final BuiltList<GAppRealmSearchResultData_appRealmSearchResult_nodes>? nodes;
  @override
  final GAppRealmSearchResultData_appRealmSearchResult_pageInfo pageInfo;
  @override
  final BuiltList<GAppRealmSearchResultData_appRealmSearchResult_permissions>?
      permissions;

  factory _$GAppRealmSearchResultData_appRealmSearchResult(
          [void Function(GAppRealmSearchResultData_appRealmSearchResultBuilder)?
              updates]) =>
      (new GAppRealmSearchResultData_appRealmSearchResultBuilder()
            ..update(updates))
          .build();

  _$GAppRealmSearchResultData_appRealmSearchResult._(
      {required this.G__typename,
      this.totalCount,
      this.nodes,
      required this.pageInfo,
      this.permissions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GAppRealmSearchResultData_appRealmSearchResult', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        pageInfo, 'GAppRealmSearchResultData_appRealmSearchResult', 'pageInfo');
  }

  @override
  GAppRealmSearchResultData_appRealmSearchResult rebuild(
          void Function(GAppRealmSearchResultData_appRealmSearchResultBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAppRealmSearchResultData_appRealmSearchResultBuilder toBuilder() =>
      new GAppRealmSearchResultData_appRealmSearchResultBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAppRealmSearchResultData_appRealmSearchResult &&
        G__typename == other.G__typename &&
        totalCount == other.totalCount &&
        nodes == other.nodes &&
        pageInfo == other.pageInfo &&
        permissions == other.permissions;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, G__typename.hashCode), totalCount.hashCode),
                nodes.hashCode),
            pageInfo.hashCode),
        permissions.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GAppRealmSearchResultData_appRealmSearchResult')
          ..add('G__typename', G__typename)
          ..add('totalCount', totalCount)
          ..add('nodes', nodes)
          ..add('pageInfo', pageInfo)
          ..add('permissions', permissions))
        .toString();
  }
}

class GAppRealmSearchResultData_appRealmSearchResultBuilder
    implements
        Builder<GAppRealmSearchResultData_appRealmSearchResult,
            GAppRealmSearchResultData_appRealmSearchResultBuilder> {
  _$GAppRealmSearchResultData_appRealmSearchResult? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _totalCount;
  int? get totalCount => _$this._totalCount;
  set totalCount(int? totalCount) => _$this._totalCount = totalCount;

  ListBuilder<GAppRealmSearchResultData_appRealmSearchResult_nodes>? _nodes;
  ListBuilder<
      GAppRealmSearchResultData_appRealmSearchResult_nodes> get nodes => _$this
          ._nodes ??=
      new ListBuilder<GAppRealmSearchResultData_appRealmSearchResult_nodes>();
  set nodes(
          ListBuilder<GAppRealmSearchResultData_appRealmSearchResult_nodes>?
              nodes) =>
      _$this._nodes = nodes;

  GAppRealmSearchResultData_appRealmSearchResult_pageInfoBuilder? _pageInfo;
  GAppRealmSearchResultData_appRealmSearchResult_pageInfoBuilder get pageInfo =>
      _$this._pageInfo ??=
          new GAppRealmSearchResultData_appRealmSearchResult_pageInfoBuilder();
  set pageInfo(
          GAppRealmSearchResultData_appRealmSearchResult_pageInfoBuilder?
              pageInfo) =>
      _$this._pageInfo = pageInfo;

  ListBuilder<GAppRealmSearchResultData_appRealmSearchResult_permissions>?
      _permissions;
  ListBuilder<GAppRealmSearchResultData_appRealmSearchResult_permissions>
      get permissions => _$this._permissions ??= new ListBuilder<
          GAppRealmSearchResultData_appRealmSearchResult_permissions>();
  set permissions(
          ListBuilder<
                  GAppRealmSearchResultData_appRealmSearchResult_permissions>?
              permissions) =>
      _$this._permissions = permissions;

  GAppRealmSearchResultData_appRealmSearchResultBuilder() {
    GAppRealmSearchResultData_appRealmSearchResult._initializeBuilder(this);
  }

  GAppRealmSearchResultData_appRealmSearchResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _totalCount = $v.totalCount;
      _nodes = $v.nodes?.toBuilder();
      _pageInfo = $v.pageInfo.toBuilder();
      _permissions = $v.permissions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAppRealmSearchResultData_appRealmSearchResult other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAppRealmSearchResultData_appRealmSearchResult;
  }

  @override
  void update(
      void Function(GAppRealmSearchResultData_appRealmSearchResultBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAppRealmSearchResultData_appRealmSearchResult build() {
    _$GAppRealmSearchResultData_appRealmSearchResult _$result;
    try {
      _$result = _$v ??
          new _$GAppRealmSearchResultData_appRealmSearchResult._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  'GAppRealmSearchResultData_appRealmSearchResult',
                  'G__typename'),
              totalCount: totalCount,
              nodes: _nodes?.build(),
              pageInfo: pageInfo.build(),
              permissions: _permissions?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'nodes';
        _nodes?.build();
        _$failedField = 'pageInfo';
        pageInfo.build();
        _$failedField = 'permissions';
        _permissions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GAppRealmSearchResultData_appRealmSearchResult',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAppRealmSearchResultData_appRealmSearchResult_nodes
    extends GAppRealmSearchResultData_appRealmSearchResult_nodes {
  @override
  final String G__typename;
  @override
  final String? entityID;
  @override
  final _i4.GEntityType? entityType;
  @override
  final String? logoURI;
  @override
  final String? primaryName;
  @override
  final String? label;
  @override
  final String? description;
  @override
  final BuiltList<GAppRealmSearchResultData_appRealmSearchResult_nodes_tags>?
      tags;

  factory _$GAppRealmSearchResultData_appRealmSearchResult_nodes(
          [void Function(
                  GAppRealmSearchResultData_appRealmSearchResult_nodesBuilder)?
              updates]) =>
      (new GAppRealmSearchResultData_appRealmSearchResult_nodesBuilder()
            ..update(updates))
          .build();

  _$GAppRealmSearchResultData_appRealmSearchResult_nodes._(
      {required this.G__typename,
      this.entityID,
      this.entityType,
      this.logoURI,
      this.primaryName,
      this.label,
      this.description,
      this.tags})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GAppRealmSearchResultData_appRealmSearchResult_nodes', 'G__typename');
  }

  @override
  GAppRealmSearchResultData_appRealmSearchResult_nodes rebuild(
          void Function(
                  GAppRealmSearchResultData_appRealmSearchResult_nodesBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAppRealmSearchResultData_appRealmSearchResult_nodesBuilder toBuilder() =>
      new GAppRealmSearchResultData_appRealmSearchResult_nodesBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAppRealmSearchResultData_appRealmSearchResult_nodes &&
        G__typename == other.G__typename &&
        entityID == other.entityID &&
        entityType == other.entityType &&
        logoURI == other.logoURI &&
        primaryName == other.primaryName &&
        label == other.label &&
        description == other.description &&
        tags == other.tags;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc(0, G__typename.hashCode),
                                entityID.hashCode),
                            entityType.hashCode),
                        logoURI.hashCode),
                    primaryName.hashCode),
                label.hashCode),
            description.hashCode),
        tags.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GAppRealmSearchResultData_appRealmSearchResult_nodes')
          ..add('G__typename', G__typename)
          ..add('entityID', entityID)
          ..add('entityType', entityType)
          ..add('logoURI', logoURI)
          ..add('primaryName', primaryName)
          ..add('label', label)
          ..add('description', description)
          ..add('tags', tags))
        .toString();
  }
}

class GAppRealmSearchResultData_appRealmSearchResult_nodesBuilder
    implements
        Builder<GAppRealmSearchResultData_appRealmSearchResult_nodes,
            GAppRealmSearchResultData_appRealmSearchResult_nodesBuilder> {
  _$GAppRealmSearchResultData_appRealmSearchResult_nodes? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _entityID;
  String? get entityID => _$this._entityID;
  set entityID(String? entityID) => _$this._entityID = entityID;

  _i4.GEntityType? _entityType;
  _i4.GEntityType? get entityType => _$this._entityType;
  set entityType(_i4.GEntityType? entityType) =>
      _$this._entityType = entityType;

  String? _logoURI;
  String? get logoURI => _$this._logoURI;
  set logoURI(String? logoURI) => _$this._logoURI = logoURI;

  String? _primaryName;
  String? get primaryName => _$this._primaryName;
  set primaryName(String? primaryName) => _$this._primaryName = primaryName;

  String? _label;
  String? get label => _$this._label;
  set label(String? label) => _$this._label = label;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ListBuilder<GAppRealmSearchResultData_appRealmSearchResult_nodes_tags>? _tags;
  ListBuilder<GAppRealmSearchResultData_appRealmSearchResult_nodes_tags>
      get tags => _$this._tags ??= new ListBuilder<
          GAppRealmSearchResultData_appRealmSearchResult_nodes_tags>();
  set tags(
          ListBuilder<
                  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags>?
              tags) =>
      _$this._tags = tags;

  GAppRealmSearchResultData_appRealmSearchResult_nodesBuilder() {
    GAppRealmSearchResultData_appRealmSearchResult_nodes._initializeBuilder(
        this);
  }

  GAppRealmSearchResultData_appRealmSearchResult_nodesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _entityID = $v.entityID;
      _entityType = $v.entityType;
      _logoURI = $v.logoURI;
      _primaryName = $v.primaryName;
      _label = $v.label;
      _description = $v.description;
      _tags = $v.tags?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAppRealmSearchResultData_appRealmSearchResult_nodes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAppRealmSearchResultData_appRealmSearchResult_nodes;
  }

  @override
  void update(
      void Function(
              GAppRealmSearchResultData_appRealmSearchResult_nodesBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAppRealmSearchResultData_appRealmSearchResult_nodes build() {
    _$GAppRealmSearchResultData_appRealmSearchResult_nodes _$result;
    try {
      _$result = _$v ??
          new _$GAppRealmSearchResultData_appRealmSearchResult_nodes._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  'GAppRealmSearchResultData_appRealmSearchResult_nodes',
                  'G__typename'),
              entityID: entityID,
              entityType: entityType,
              logoURI: logoURI,
              primaryName: primaryName,
              label: label,
              description: description,
              tags: _tags?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tags';
        _tags?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GAppRealmSearchResultData_appRealmSearchResult_nodes',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base
    extends GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base {
  @override
  final String G__typename;

  factory _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base(
          [void Function(
                  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__baseBuilder)?
              updates]) =>
      (new GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__baseBuilder()
            ..update(updates))
          .build();

  _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base._(
      {required this.G__typename})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        'GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base',
        'G__typename');
  }

  @override
  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base rebuild(
          void Function(
                  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__baseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__baseBuilder
      toBuilder() =>
          new GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__baseBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base &&
        G__typename == other.G__typename;
  }

  @override
  int get hashCode {
    return $jf($jc(0, G__typename.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__baseBuilder
    implements
        Builder<GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base,
            GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__baseBuilder> {
  _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__baseBuilder() {
    GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base
        ._initializeBuilder(this);
  }

  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__baseBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base;
  }

  @override
  void update(
      void Function(
              GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__baseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base build() {
    final _$result = _$v ??
        new _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base',
                'G__typename'));
    replace(_$result);
    return _$result;
  }
}

class _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag
    extends GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag {
  @override
  final String G__typename;
  @override
  final String? name;
  @override
  final GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action?
      action;

  factory _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag(
          [void Function(
                  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTagBuilder)?
              updates]) =>
      (new GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTagBuilder()
            ..update(updates))
          .build();

  _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag._(
      {required this.G__typename, this.name, this.action})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        'GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag',
        'G__typename');
  }

  @override
  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag rebuild(
          void Function(
                  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTagBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTagBuilder
      toBuilder() =>
          new GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTagBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag &&
        G__typename == other.G__typename &&
        name == other.name &&
        action == other.action;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, G__typename.hashCode), name.hashCode), action.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag')
          ..add('G__typename', G__typename)
          ..add('name', name)
          ..add('action', action))
        .toString();
  }
}

class GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTagBuilder
    implements
        Builder<
            GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag,
            GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTagBuilder> {
  _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_actionBuilder?
      _action;
  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_actionBuilder
      get action => _$this._action ??=
          new GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_actionBuilder();
  set action(
          GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_actionBuilder?
              action) =>
      _$this._action = action;

  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTagBuilder() {
    GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag
        ._initializeBuilder(this);
  }

  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTagBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _name = $v.name;
      _action = $v.action?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag;
  }

  @override
  void update(
      void Function(
              GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTagBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag
      build() {
    _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag
        _$result;
    try {
      _$result = _$v ??
          new _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag
                  ._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  'GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag',
                  'G__typename'),
              name: name,
              action: _action?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'action';
        _action?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action
    extends GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action {
  @override
  final String G__typename;
  @override
  final String name;
  @override
  final _i4.GActionType type;
  @override
  final Map<String, dynamic>? args;
  @override
  final String? data;

  factory _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action(
          [void Function(
                  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_actionBuilder)?
              updates]) =>
      (new GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_actionBuilder()
            ..update(updates))
          .build();

  _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action._(
      {required this.G__typename,
      required this.name,
      required this.type,
      this.args,
      this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        'GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        name,
        'GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action',
        'name');
    BuiltValueNullFieldError.checkNotNull(
        type,
        'GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action',
        'type');
  }

  @override
  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action
      rebuild(
              void Function(
                      GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_actionBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_actionBuilder
      toBuilder() =>
          new GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_actionBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action &&
        G__typename == other.G__typename &&
        name == other.name &&
        type == other.type &&
        args == other.args &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, G__typename.hashCode), name.hashCode),
                type.hashCode),
            args.hashCode),
        data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action')
          ..add('G__typename', G__typename)
          ..add('name', name)
          ..add('type', type)
          ..add('args', args)
          ..add('data', data))
        .toString();
  }
}

class GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_actionBuilder
    implements
        Builder<
            GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action,
            GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_actionBuilder> {
  _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action?
      _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  _i4.GActionType? _type;
  _i4.GActionType? get type => _$this._type;
  set type(_i4.GActionType? type) => _$this._type = type;

  Map<String, dynamic>? _args;
  Map<String, dynamic>? get args => _$this._args;
  set args(Map<String, dynamic>? args) => _$this._args = args;

  String? _data;
  String? get data => _$this._data;
  set data(String? data) => _$this._data = data;

  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_actionBuilder() {
    GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action
        ._initializeBuilder(this);
  }

  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_actionBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _name = $v.name;
      _type = $v.type;
      _args = $v.args;
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action;
  }

  @override
  void update(
      void Function(
              GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_actionBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action
      build() {
    final _$result = _$v ??
        new _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action
                ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action',
                'G__typename'),
            name: BuiltValueNullFieldError.checkNotNull(
                name,
                'GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action',
                'name'),
            type: BuiltValueNullFieldError.checkNotNull(
                type,
                'GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action',
                'type'),
            args: args,
            data: data);
    replace(_$result);
    return _$result;
  }
}

class _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag
    extends GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag {
  @override
  final String G__typename;
  @override
  final int? level;

  factory _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag(
          [void Function(
                  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTagBuilder)?
              updates]) =>
      (new GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTagBuilder()
            ..update(updates))
          .build();

  _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag._(
      {required this.G__typename, this.level})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        'GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag',
        'G__typename');
  }

  @override
  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag rebuild(
          void Function(
                  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTagBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTagBuilder
      toBuilder() =>
          new GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTagBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag &&
        G__typename == other.G__typename &&
        level == other.level;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), level.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag')
          ..add('G__typename', G__typename)
          ..add('level', level))
        .toString();
  }
}

class GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTagBuilder
    implements
        Builder<
            GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag,
            GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTagBuilder> {
  _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _level;
  int? get level => _$this._level;
  set level(int? level) => _$this._level = level;

  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTagBuilder() {
    GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag
        ._initializeBuilder(this);
  }

  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTagBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _level = $v.level;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag;
  }

  @override
  void update(
      void Function(
              GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTagBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag
      build() {
    final _$result = _$v ??
        new _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag
                ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag',
                'G__typename'),
            level: level);
    replace(_$result);
    return _$result;
  }
}

class _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag
    extends GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag {
  @override
  final String G__typename;
  @override
  final String? icon;
  @override
  final String? nameType;
  @override
  final String? matchedName;

  factory _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag(
          [void Function(
                  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTagBuilder)?
              updates]) =>
      (new GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTagBuilder()
            ..update(updates))
          .build();

  _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag._(
      {required this.G__typename, this.icon, this.nameType, this.matchedName})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        'GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag',
        'G__typename');
  }

  @override
  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag
      rebuild(
              void Function(
                      GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTagBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTagBuilder
      toBuilder() =>
          new GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTagBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag &&
        G__typename == other.G__typename &&
        icon == other.icon &&
        nameType == other.nameType &&
        matchedName == other.matchedName;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, G__typename.hashCode), icon.hashCode),
            nameType.hashCode),
        matchedName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag')
          ..add('G__typename', G__typename)
          ..add('icon', icon)
          ..add('nameType', nameType)
          ..add('matchedName', matchedName))
        .toString();
  }
}

class GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTagBuilder
    implements
        Builder<
            GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag,
            GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTagBuilder> {
  _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag?
      _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  String? _nameType;
  String? get nameType => _$this._nameType;
  set nameType(String? nameType) => _$this._nameType = nameType;

  String? _matchedName;
  String? get matchedName => _$this._matchedName;
  set matchedName(String? matchedName) => _$this._matchedName = matchedName;

  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTagBuilder() {
    GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag
        ._initializeBuilder(this);
  }

  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTagBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _icon = $v.icon;
      _nameType = $v.nameType;
      _matchedName = $v.matchedName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag;
  }

  @override
  void update(
      void Function(
              GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTagBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag
      build() {
    final _$result = _$v ??
        new _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag
                ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag',
                'G__typename'),
            icon: icon,
            nameType: nameType,
            matchedName: matchedName);
    replace(_$result);
    return _$result;
  }
}

class _$GAppRealmSearchResultData_appRealmSearchResult_pageInfo
    extends GAppRealmSearchResultData_appRealmSearchResult_pageInfo {
  @override
  final String G__typename;
  @override
  final bool hasPreviousPage;
  @override
  final bool hasNextPage;
  @override
  final String? startCursor;
  @override
  final String? endCursor;

  factory _$GAppRealmSearchResultData_appRealmSearchResult_pageInfo(
          [void Function(
                  GAppRealmSearchResultData_appRealmSearchResult_pageInfoBuilder)?
              updates]) =>
      (new GAppRealmSearchResultData_appRealmSearchResult_pageInfoBuilder()
            ..update(updates))
          .build();

  _$GAppRealmSearchResultData_appRealmSearchResult_pageInfo._(
      {required this.G__typename,
      required this.hasPreviousPage,
      required this.hasNextPage,
      this.startCursor,
      this.endCursor})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        'GAppRealmSearchResultData_appRealmSearchResult_pageInfo',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        hasPreviousPage,
        'GAppRealmSearchResultData_appRealmSearchResult_pageInfo',
        'hasPreviousPage');
    BuiltValueNullFieldError.checkNotNull(
        hasNextPage,
        'GAppRealmSearchResultData_appRealmSearchResult_pageInfo',
        'hasNextPage');
  }

  @override
  GAppRealmSearchResultData_appRealmSearchResult_pageInfo rebuild(
          void Function(
                  GAppRealmSearchResultData_appRealmSearchResult_pageInfoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAppRealmSearchResultData_appRealmSearchResult_pageInfoBuilder toBuilder() =>
      new GAppRealmSearchResultData_appRealmSearchResult_pageInfoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAppRealmSearchResultData_appRealmSearchResult_pageInfo &&
        G__typename == other.G__typename &&
        hasPreviousPage == other.hasPreviousPage &&
        hasNextPage == other.hasNextPage &&
        startCursor == other.startCursor &&
        endCursor == other.endCursor;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, G__typename.hashCode), hasPreviousPage.hashCode),
                hasNextPage.hashCode),
            startCursor.hashCode),
        endCursor.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GAppRealmSearchResultData_appRealmSearchResult_pageInfo')
          ..add('G__typename', G__typename)
          ..add('hasPreviousPage', hasPreviousPage)
          ..add('hasNextPage', hasNextPage)
          ..add('startCursor', startCursor)
          ..add('endCursor', endCursor))
        .toString();
  }
}

class GAppRealmSearchResultData_appRealmSearchResult_pageInfoBuilder
    implements
        Builder<GAppRealmSearchResultData_appRealmSearchResult_pageInfo,
            GAppRealmSearchResultData_appRealmSearchResult_pageInfoBuilder> {
  _$GAppRealmSearchResultData_appRealmSearchResult_pageInfo? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _hasPreviousPage;
  bool? get hasPreviousPage => _$this._hasPreviousPage;
  set hasPreviousPage(bool? hasPreviousPage) =>
      _$this._hasPreviousPage = hasPreviousPage;

  bool? _hasNextPage;
  bool? get hasNextPage => _$this._hasNextPage;
  set hasNextPage(bool? hasNextPage) => _$this._hasNextPage = hasNextPage;

  String? _startCursor;
  String? get startCursor => _$this._startCursor;
  set startCursor(String? startCursor) => _$this._startCursor = startCursor;

  String? _endCursor;
  String? get endCursor => _$this._endCursor;
  set endCursor(String? endCursor) => _$this._endCursor = endCursor;

  GAppRealmSearchResultData_appRealmSearchResult_pageInfoBuilder() {
    GAppRealmSearchResultData_appRealmSearchResult_pageInfo._initializeBuilder(
        this);
  }

  GAppRealmSearchResultData_appRealmSearchResult_pageInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _hasPreviousPage = $v.hasPreviousPage;
      _hasNextPage = $v.hasNextPage;
      _startCursor = $v.startCursor;
      _endCursor = $v.endCursor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAppRealmSearchResultData_appRealmSearchResult_pageInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAppRealmSearchResultData_appRealmSearchResult_pageInfo;
  }

  @override
  void update(
      void Function(
              GAppRealmSearchResultData_appRealmSearchResult_pageInfoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAppRealmSearchResultData_appRealmSearchResult_pageInfo build() {
    final _$result = _$v ??
        new _$GAppRealmSearchResultData_appRealmSearchResult_pageInfo._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GAppRealmSearchResultData_appRealmSearchResult_pageInfo',
                'G__typename'),
            hasPreviousPage: BuiltValueNullFieldError.checkNotNull(
                hasPreviousPage,
                'GAppRealmSearchResultData_appRealmSearchResult_pageInfo',
                'hasPreviousPage'),
            hasNextPage: BuiltValueNullFieldError.checkNotNull(
                hasNextPage,
                'GAppRealmSearchResultData_appRealmSearchResult_pageInfo',
                'hasNextPage'),
            startCursor: startCursor,
            endCursor: endCursor);
    replace(_$result);
    return _$result;
  }
}

class _$GAppRealmSearchResultData_appRealmSearchResult_permissions__base
    extends GAppRealmSearchResultData_appRealmSearchResult_permissions__base {
  @override
  final String G__typename;

  factory _$GAppRealmSearchResultData_appRealmSearchResult_permissions__base(
          [void Function(
                  GAppRealmSearchResultData_appRealmSearchResult_permissions__baseBuilder)?
              updates]) =>
      (new GAppRealmSearchResultData_appRealmSearchResult_permissions__baseBuilder()
            ..update(updates))
          .build();

  _$GAppRealmSearchResultData_appRealmSearchResult_permissions__base._(
      {required this.G__typename})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        'GAppRealmSearchResultData_appRealmSearchResult_permissions__base',
        'G__typename');
  }

  @override
  GAppRealmSearchResultData_appRealmSearchResult_permissions__base rebuild(
          void Function(
                  GAppRealmSearchResultData_appRealmSearchResult_permissions__baseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAppRealmSearchResultData_appRealmSearchResult_permissions__baseBuilder
      toBuilder() =>
          new GAppRealmSearchResultData_appRealmSearchResult_permissions__baseBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GAppRealmSearchResultData_appRealmSearchResult_permissions__base &&
        G__typename == other.G__typename;
  }

  @override
  int get hashCode {
    return $jf($jc(0, G__typename.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GAppRealmSearchResultData_appRealmSearchResult_permissions__base')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GAppRealmSearchResultData_appRealmSearchResult_permissions__baseBuilder
    implements
        Builder<
            GAppRealmSearchResultData_appRealmSearchResult_permissions__base,
            GAppRealmSearchResultData_appRealmSearchResult_permissions__baseBuilder> {
  _$GAppRealmSearchResultData_appRealmSearchResult_permissions__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GAppRealmSearchResultData_appRealmSearchResult_permissions__baseBuilder() {
    GAppRealmSearchResultData_appRealmSearchResult_permissions__base
        ._initializeBuilder(this);
  }

  GAppRealmSearchResultData_appRealmSearchResult_permissions__baseBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GAppRealmSearchResultData_appRealmSearchResult_permissions__base other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GAppRealmSearchResultData_appRealmSearchResult_permissions__base;
  }

  @override
  void update(
      void Function(
              GAppRealmSearchResultData_appRealmSearchResult_permissions__baseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAppRealmSearchResultData_appRealmSearchResult_permissions__base build() {
    final _$result = _$v ??
        new _$GAppRealmSearchResultData_appRealmSearchResult_permissions__base
                ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GAppRealmSearchResultData_appRealmSearchResult_permissions__base',
                'G__typename'));
    replace(_$result);
    return _$result;
  }
}

class _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission
    extends GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission {
  @override
  final String G__typename;
  @override
  final bool locked;

  factory _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission(
          [void Function(
                  GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermissionBuilder)?
              updates]) =>
      (new GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermissionBuilder()
            ..update(updates))
          .build();

  _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission._(
      {required this.G__typename, required this.locked})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        'GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        locked,
        'GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission',
        'locked');
  }

  @override
  GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission
      rebuild(
              void Function(
                      GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermissionBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermissionBuilder
      toBuilder() =>
          new GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermissionBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission &&
        G__typename == other.G__typename &&
        locked == other.locked;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), locked.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission')
          ..add('G__typename', G__typename)
          ..add('locked', locked))
        .toString();
  }
}

class GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermissionBuilder
    implements
        Builder<
            GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission,
            GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermissionBuilder> {
  _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission?
      _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _locked;
  bool? get locked => _$this._locked;
  set locked(bool? locked) => _$this._locked = locked;

  GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermissionBuilder() {
    GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission
        ._initializeBuilder(this);
  }

  GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermissionBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _locked = $v.locked;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission;
  }

  @override
  void update(
      void Function(
              GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermissionBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission
      build() {
    final _$result = _$v ??
        new _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission
                ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission',
                'G__typename'),
            locked: BuiltValueNullFieldError.checkNotNull(
                locked,
                'GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission',
                'locked'));
    replace(_$result);
    return _$result;
  }
}

class _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission
    extends GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission {
  @override
  final String G__typename;
  @override
  final int used;
  @override
  final int total;
  @override
  final int remaining;

  factory _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission(
          [void Function(
                  GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermissionBuilder)?
              updates]) =>
      (new GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermissionBuilder()
            ..update(updates))
          .build();

  _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission._(
      {required this.G__typename,
      required this.used,
      required this.total,
      required this.remaining})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        'GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        used,
        'GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission',
        'used');
    BuiltValueNullFieldError.checkNotNull(
        total,
        'GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission',
        'total');
    BuiltValueNullFieldError.checkNotNull(
        remaining,
        'GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission',
        'remaining');
  }

  @override
  GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission
      rebuild(
              void Function(
                      GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermissionBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermissionBuilder
      toBuilder() =>
          new GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermissionBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission &&
        G__typename == other.G__typename &&
        used == other.used &&
        total == other.total &&
        remaining == other.remaining;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, G__typename.hashCode), used.hashCode), total.hashCode),
        remaining.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission')
          ..add('G__typename', G__typename)
          ..add('used', used)
          ..add('total', total)
          ..add('remaining', remaining))
        .toString();
  }
}

class GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermissionBuilder
    implements
        Builder<
            GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission,
            GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermissionBuilder> {
  _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission?
      _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _used;
  int? get used => _$this._used;
  set used(int? used) => _$this._used = used;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  int? _remaining;
  int? get remaining => _$this._remaining;
  set remaining(int? remaining) => _$this._remaining = remaining;

  GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermissionBuilder() {
    GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission
        ._initializeBuilder(this);
  }

  GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermissionBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _used = $v.used;
      _total = $v.total;
      _remaining = $v.remaining;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission;
  }

  @override
  void update(
      void Function(
              GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermissionBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission
      build() {
    final _$result = _$v ??
        new _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission',
                'G__typename'),
            used: BuiltValueNullFieldError.checkNotNull(
                used,
                'GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission',
                'used'),
            total: BuiltValueNullFieldError.checkNotNull(
                total,
                'GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission',
                'total'),
            remaining: BuiltValueNullFieldError.checkNotNull(
                remaining,
                'GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission',
                'remaining'));
    replace(_$result);
    return _$result;
  }
}

class _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission
    extends GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission {
  @override
  final String G__typename;
  @override
  final int rowLimit;
  @override
  final bool lockNextPage;
  @override
  final bool lockPreviousPage;

  factory _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission(
          [void Function(
                  GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermissionBuilder)?
              updates]) =>
      (new GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermissionBuilder()
            ..update(updates))
          .build();

  _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission._(
      {required this.G__typename,
      required this.rowLimit,
      required this.lockNextPage,
      required this.lockPreviousPage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        'GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        rowLimit,
        'GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission',
        'rowLimit');
    BuiltValueNullFieldError.checkNotNull(
        lockNextPage,
        'GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission',
        'lockNextPage');
    BuiltValueNullFieldError.checkNotNull(
        lockPreviousPage,
        'GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission',
        'lockPreviousPage');
  }

  @override
  GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission
      rebuild(
              void Function(
                      GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermissionBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermissionBuilder
      toBuilder() =>
          new GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermissionBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission &&
        G__typename == other.G__typename &&
        rowLimit == other.rowLimit &&
        lockNextPage == other.lockNextPage &&
        lockPreviousPage == other.lockPreviousPage;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, G__typename.hashCode), rowLimit.hashCode),
            lockNextPage.hashCode),
        lockPreviousPage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission')
          ..add('G__typename', G__typename)
          ..add('rowLimit', rowLimit)
          ..add('lockNextPage', lockNextPage)
          ..add('lockPreviousPage', lockPreviousPage))
        .toString();
  }
}

class GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermissionBuilder
    implements
        Builder<
            GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission,
            GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermissionBuilder> {
  _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission?
      _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _rowLimit;
  int? get rowLimit => _$this._rowLimit;
  set rowLimit(int? rowLimit) => _$this._rowLimit = rowLimit;

  bool? _lockNextPage;
  bool? get lockNextPage => _$this._lockNextPage;
  set lockNextPage(bool? lockNextPage) => _$this._lockNextPage = lockNextPage;

  bool? _lockPreviousPage;
  bool? get lockPreviousPage => _$this._lockPreviousPage;
  set lockPreviousPage(bool? lockPreviousPage) =>
      _$this._lockPreviousPage = lockPreviousPage;

  GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermissionBuilder() {
    GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission
        ._initializeBuilder(this);
  }

  GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermissionBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _rowLimit = $v.rowLimit;
      _lockNextPage = $v.lockNextPage;
      _lockPreviousPage = $v.lockPreviousPage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission;
  }

  @override
  void update(
      void Function(
              GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermissionBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission
      build() {
    final _$result = _$v ??
        new _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission',
                'G__typename'),
            rowLimit: BuiltValueNullFieldError.checkNotNull(
                rowLimit,
                'GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission',
                'rowLimit'),
            lockNextPage: BuiltValueNullFieldError.checkNotNull(
                lockNextPage,
                'GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission',
                'lockNextPage'),
            lockPreviousPage: BuiltValueNullFieldError.checkNotNull(
                lockPreviousPage,
                'GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission',
                'lockPreviousPage'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
