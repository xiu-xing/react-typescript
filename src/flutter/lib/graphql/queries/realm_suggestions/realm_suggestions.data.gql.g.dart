// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm_suggestions.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GRealmSuggestionsData> _$gRealmSuggestionsDataSerializer =
    new _$GRealmSuggestionsDataSerializer();
Serializer<GRealmSuggestionsData_appRealmSuggestions>
    _$gRealmSuggestionsDataAppRealmSuggestionsSerializer =
    new _$GRealmSuggestionsData_appRealmSuggestionsSerializer();
Serializer<GRealmSuggestionsData_appRealmSuggestions_nodes>
    _$gRealmSuggestionsDataAppRealmSuggestionsNodesSerializer =
    new _$GRealmSuggestionsData_appRealmSuggestions_nodesSerializer();
Serializer<GRealmSuggestionsData_appRealmSuggestions_pageInfo>
    _$gRealmSuggestionsDataAppRealmSuggestionsPageInfoSerializer =
    new _$GRealmSuggestionsData_appRealmSuggestions_pageInfoSerializer();
Serializer<GRealmSuggestionsData_appRealmSuggestions_permissions__base>
    _$gRealmSuggestionsDataAppRealmSuggestionsPermissionsBaseSerializer =
    new _$GRealmSuggestionsData_appRealmSuggestions_permissions__baseSerializer();
Serializer<
        GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission>
    _$gRealmSuggestionsDataAppRealmSuggestionsPermissionsAsLockPermissionSerializer =
    new _$GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermissionSerializer();
Serializer<
        GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission>
    _$gRealmSuggestionsDataAppRealmSuggestionsPermissionsAsPaginationPermissionSerializer =
    new _$GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermissionSerializer();
Serializer<
        GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission>
    _$gRealmSuggestionsDataAppRealmSuggestionsPermissionsAsFrequencyPermissionSerializer =
    new _$GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermissionSerializer();

class _$GRealmSuggestionsDataSerializer
    implements StructuredSerializer<GRealmSuggestionsData> {
  @override
  final Iterable<Type> types = const [
    GRealmSuggestionsData,
    _$GRealmSuggestionsData
  ];
  @override
  final String wireName = 'GRealmSuggestionsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GRealmSuggestionsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'appRealmSuggestions',
      serializers.serialize(object.appRealmSuggestions,
          specifiedType:
              const FullType(GRealmSuggestionsData_appRealmSuggestions)),
    ];

    return result;
  }

  @override
  GRealmSuggestionsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GRealmSuggestionsDataBuilder();

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
        case 'appRealmSuggestions':
          result.appRealmSuggestions.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GRealmSuggestionsData_appRealmSuggestions))!
              as GRealmSuggestionsData_appRealmSuggestions);
          break;
      }
    }

    return result.build();
  }
}

class _$GRealmSuggestionsData_appRealmSuggestionsSerializer
    implements StructuredSerializer<GRealmSuggestionsData_appRealmSuggestions> {
  @override
  final Iterable<Type> types = const [
    GRealmSuggestionsData_appRealmSuggestions,
    _$GRealmSuggestionsData_appRealmSuggestions
  ];
  @override
  final String wireName = 'GRealmSuggestionsData_appRealmSuggestions';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GRealmSuggestionsData_appRealmSuggestions object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'totalCount',
      serializers.serialize(object.totalCount,
          specifiedType: const FullType(int)),
      'pageInfo',
      serializers.serialize(object.pageInfo,
          specifiedType: const FullType(
              GRealmSuggestionsData_appRealmSuggestions_pageInfo)),
    ];
    Object? value;
    value = object.nodes;
    if (value != null) {
      result
        ..add('nodes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(GRealmSuggestionsData_appRealmSuggestions_nodes)
            ])));
    }
    value = object.permissions;
    if (value != null) {
      result
        ..add('permissions')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  GRealmSuggestionsData_appRealmSuggestions_permissions)
            ])));
    }
    return result;
  }

  @override
  GRealmSuggestionsData_appRealmSuggestions deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GRealmSuggestionsData_appRealmSuggestionsBuilder();

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
              specifiedType: const FullType(int)) as int;
          break;
        case 'nodes':
          result.nodes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GRealmSuggestionsData_appRealmSuggestions_nodes)
              ]))! as BuiltList<Object?>);
          break;
        case 'pageInfo':
          result.pageInfo.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GRealmSuggestionsData_appRealmSuggestions_pageInfo))!
              as GRealmSuggestionsData_appRealmSuggestions_pageInfo);
          break;
        case 'permissions':
          result.permissions.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    GRealmSuggestionsData_appRealmSuggestions_permissions)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GRealmSuggestionsData_appRealmSuggestions_nodesSerializer
    implements
        StructuredSerializer<GRealmSuggestionsData_appRealmSuggestions_nodes> {
  @override
  final Iterable<Type> types = const [
    GRealmSuggestionsData_appRealmSuggestions_nodes,
    _$GRealmSuggestionsData_appRealmSuggestions_nodes
  ];
  @override
  final String wireName = 'GRealmSuggestionsData_appRealmSuggestions_nodes';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GRealmSuggestionsData_appRealmSuggestions_nodes object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'primaryName',
      serializers.serialize(object.primaryName,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.logo;
    if (value != null) {
      result
        ..add('logo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GRealmSuggestionsData_appRealmSuggestions_nodes deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GRealmSuggestionsData_appRealmSuggestions_nodesBuilder();

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
        case 'primaryName':
          result.primaryName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'logo':
          result.logo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GRealmSuggestionsData_appRealmSuggestions_pageInfoSerializer
    implements
        StructuredSerializer<
            GRealmSuggestionsData_appRealmSuggestions_pageInfo> {
  @override
  final Iterable<Type> types = const [
    GRealmSuggestionsData_appRealmSuggestions_pageInfo,
    _$GRealmSuggestionsData_appRealmSuggestions_pageInfo
  ];
  @override
  final String wireName = 'GRealmSuggestionsData_appRealmSuggestions_pageInfo';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GRealmSuggestionsData_appRealmSuggestions_pageInfo object,
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
  GRealmSuggestionsData_appRealmSuggestions_pageInfo deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GRealmSuggestionsData_appRealmSuggestions_pageInfoBuilder();

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

class _$GRealmSuggestionsData_appRealmSuggestions_permissions__baseSerializer
    implements
        StructuredSerializer<
            GRealmSuggestionsData_appRealmSuggestions_permissions__base> {
  @override
  final Iterable<Type> types = const [
    GRealmSuggestionsData_appRealmSuggestions_permissions__base,
    _$GRealmSuggestionsData_appRealmSuggestions_permissions__base
  ];
  @override
  final String wireName =
      'GRealmSuggestionsData_appRealmSuggestions_permissions__base';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GRealmSuggestionsData_appRealmSuggestions_permissions__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GRealmSuggestionsData_appRealmSuggestions_permissions__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GRealmSuggestionsData_appRealmSuggestions_permissions__baseBuilder();

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

class _$GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermissionSerializer
    implements
        StructuredSerializer<
            GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission> {
  @override
  final Iterable<Type> types = const [
    GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission,
    _$GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission
  ];
  @override
  final String wireName =
      'GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission
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
  GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermissionBuilder();

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

class _$GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermissionSerializer
    implements
        StructuredSerializer<
            GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission> {
  @override
  final Iterable<Type> types = const [
    GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission,
    _$GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission
  ];
  @override
  final String wireName =
      'GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'lockNextPage',
      serializers.serialize(object.lockNextPage,
          specifiedType: const FullType(bool)),
      'lockPreviousPage',
      serializers.serialize(object.lockPreviousPage,
          specifiedType: const FullType(bool)),
      'rowLimit',
      serializers.serialize(object.rowLimit,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermissionBuilder();

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
        case 'lockNextPage':
          result.lockNextPage = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'lockPreviousPage':
          result.lockPreviousPage = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'rowLimit':
          result.rowLimit = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermissionSerializer
    implements
        StructuredSerializer<
            GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission> {
  @override
  final Iterable<Type> types = const [
    GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission,
    _$GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission
  ];
  @override
  final String wireName =
      'GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'remaining',
      serializers.serialize(object.remaining,
          specifiedType: const FullType(int)),
      'used',
      serializers.serialize(object.used, specifiedType: const FullType(int)),
      'total',
      serializers.serialize(object.total, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermissionBuilder();

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
        case 'remaining':
          result.remaining = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'used':
          result.used = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GRealmSuggestionsData extends GRealmSuggestionsData {
  @override
  final String G__typename;
  @override
  final GRealmSuggestionsData_appRealmSuggestions appRealmSuggestions;

  factory _$GRealmSuggestionsData(
          [void Function(GRealmSuggestionsDataBuilder)? updates]) =>
      (new GRealmSuggestionsDataBuilder()..update(updates)).build();

  _$GRealmSuggestionsData._(
      {required this.G__typename, required this.appRealmSuggestions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GRealmSuggestionsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        appRealmSuggestions, 'GRealmSuggestionsData', 'appRealmSuggestions');
  }

  @override
  GRealmSuggestionsData rebuild(
          void Function(GRealmSuggestionsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GRealmSuggestionsDataBuilder toBuilder() =>
      new GRealmSuggestionsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GRealmSuggestionsData &&
        G__typename == other.G__typename &&
        appRealmSuggestions == other.appRealmSuggestions;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), appRealmSuggestions.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GRealmSuggestionsData')
          ..add('G__typename', G__typename)
          ..add('appRealmSuggestions', appRealmSuggestions))
        .toString();
  }
}

class GRealmSuggestionsDataBuilder
    implements Builder<GRealmSuggestionsData, GRealmSuggestionsDataBuilder> {
  _$GRealmSuggestionsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GRealmSuggestionsData_appRealmSuggestionsBuilder? _appRealmSuggestions;
  GRealmSuggestionsData_appRealmSuggestionsBuilder get appRealmSuggestions =>
      _$this._appRealmSuggestions ??=
          new GRealmSuggestionsData_appRealmSuggestionsBuilder();
  set appRealmSuggestions(
          GRealmSuggestionsData_appRealmSuggestionsBuilder?
              appRealmSuggestions) =>
      _$this._appRealmSuggestions = appRealmSuggestions;

  GRealmSuggestionsDataBuilder() {
    GRealmSuggestionsData._initializeBuilder(this);
  }

  GRealmSuggestionsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _appRealmSuggestions = $v.appRealmSuggestions.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GRealmSuggestionsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GRealmSuggestionsData;
  }

  @override
  void update(void Function(GRealmSuggestionsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GRealmSuggestionsData build() {
    _$GRealmSuggestionsData _$result;
    try {
      _$result = _$v ??
          new _$GRealmSuggestionsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GRealmSuggestionsData', 'G__typename'),
              appRealmSuggestions: appRealmSuggestions.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'appRealmSuggestions';
        appRealmSuggestions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GRealmSuggestionsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GRealmSuggestionsData_appRealmSuggestions
    extends GRealmSuggestionsData_appRealmSuggestions {
  @override
  final String G__typename;
  @override
  final int totalCount;
  @override
  final BuiltList<GRealmSuggestionsData_appRealmSuggestions_nodes>? nodes;
  @override
  final GRealmSuggestionsData_appRealmSuggestions_pageInfo pageInfo;
  @override
  final BuiltList<GRealmSuggestionsData_appRealmSuggestions_permissions>?
      permissions;

  factory _$GRealmSuggestionsData_appRealmSuggestions(
          [void Function(GRealmSuggestionsData_appRealmSuggestionsBuilder)?
              updates]) =>
      (new GRealmSuggestionsData_appRealmSuggestionsBuilder()..update(updates))
          .build();

  _$GRealmSuggestionsData_appRealmSuggestions._(
      {required this.G__typename,
      required this.totalCount,
      this.nodes,
      required this.pageInfo,
      this.permissions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GRealmSuggestionsData_appRealmSuggestions', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        totalCount, 'GRealmSuggestionsData_appRealmSuggestions', 'totalCount');
    BuiltValueNullFieldError.checkNotNull(
        pageInfo, 'GRealmSuggestionsData_appRealmSuggestions', 'pageInfo');
  }

  @override
  GRealmSuggestionsData_appRealmSuggestions rebuild(
          void Function(GRealmSuggestionsData_appRealmSuggestionsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GRealmSuggestionsData_appRealmSuggestionsBuilder toBuilder() =>
      new GRealmSuggestionsData_appRealmSuggestionsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GRealmSuggestionsData_appRealmSuggestions &&
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
            'GRealmSuggestionsData_appRealmSuggestions')
          ..add('G__typename', G__typename)
          ..add('totalCount', totalCount)
          ..add('nodes', nodes)
          ..add('pageInfo', pageInfo)
          ..add('permissions', permissions))
        .toString();
  }
}

class GRealmSuggestionsData_appRealmSuggestionsBuilder
    implements
        Builder<GRealmSuggestionsData_appRealmSuggestions,
            GRealmSuggestionsData_appRealmSuggestionsBuilder> {
  _$GRealmSuggestionsData_appRealmSuggestions? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _totalCount;
  int? get totalCount => _$this._totalCount;
  set totalCount(int? totalCount) => _$this._totalCount = totalCount;

  ListBuilder<GRealmSuggestionsData_appRealmSuggestions_nodes>? _nodes;
  ListBuilder<GRealmSuggestionsData_appRealmSuggestions_nodes> get nodes =>
      _$this._nodes ??=
          new ListBuilder<GRealmSuggestionsData_appRealmSuggestions_nodes>();
  set nodes(
          ListBuilder<GRealmSuggestionsData_appRealmSuggestions_nodes>?
              nodes) =>
      _$this._nodes = nodes;

  GRealmSuggestionsData_appRealmSuggestions_pageInfoBuilder? _pageInfo;
  GRealmSuggestionsData_appRealmSuggestions_pageInfoBuilder get pageInfo =>
      _$this._pageInfo ??=
          new GRealmSuggestionsData_appRealmSuggestions_pageInfoBuilder();
  set pageInfo(
          GRealmSuggestionsData_appRealmSuggestions_pageInfoBuilder?
              pageInfo) =>
      _$this._pageInfo = pageInfo;

  ListBuilder<GRealmSuggestionsData_appRealmSuggestions_permissions>?
      _permissions;
  ListBuilder<GRealmSuggestionsData_appRealmSuggestions_permissions>
      get permissions => _$this._permissions ??= new ListBuilder<
          GRealmSuggestionsData_appRealmSuggestions_permissions>();
  set permissions(
          ListBuilder<GRealmSuggestionsData_appRealmSuggestions_permissions>?
              permissions) =>
      _$this._permissions = permissions;

  GRealmSuggestionsData_appRealmSuggestionsBuilder() {
    GRealmSuggestionsData_appRealmSuggestions._initializeBuilder(this);
  }

  GRealmSuggestionsData_appRealmSuggestionsBuilder get _$this {
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
  void replace(GRealmSuggestionsData_appRealmSuggestions other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GRealmSuggestionsData_appRealmSuggestions;
  }

  @override
  void update(
      void Function(GRealmSuggestionsData_appRealmSuggestionsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GRealmSuggestionsData_appRealmSuggestions build() {
    _$GRealmSuggestionsData_appRealmSuggestions _$result;
    try {
      _$result = _$v ??
          new _$GRealmSuggestionsData_appRealmSuggestions._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  'GRealmSuggestionsData_appRealmSuggestions', 'G__typename'),
              totalCount: BuiltValueNullFieldError.checkNotNull(totalCount,
                  'GRealmSuggestionsData_appRealmSuggestions', 'totalCount'),
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
            'GRealmSuggestionsData_appRealmSuggestions',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GRealmSuggestionsData_appRealmSuggestions_nodes
    extends GRealmSuggestionsData_appRealmSuggestions_nodes {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String primaryName;
  @override
  final String? description;
  @override
  final String? logo;

  factory _$GRealmSuggestionsData_appRealmSuggestions_nodes(
          [void Function(
                  GRealmSuggestionsData_appRealmSuggestions_nodesBuilder)?
              updates]) =>
      (new GRealmSuggestionsData_appRealmSuggestions_nodesBuilder()
            ..update(updates))
          .build();

  _$GRealmSuggestionsData_appRealmSuggestions_nodes._(
      {required this.G__typename,
      required this.id,
      required this.primaryName,
      this.description,
      this.logo})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GRealmSuggestionsData_appRealmSuggestions_nodes', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, 'GRealmSuggestionsData_appRealmSuggestions_nodes', 'id');
    BuiltValueNullFieldError.checkNotNull(primaryName,
        'GRealmSuggestionsData_appRealmSuggestions_nodes', 'primaryName');
  }

  @override
  GRealmSuggestionsData_appRealmSuggestions_nodes rebuild(
          void Function(GRealmSuggestionsData_appRealmSuggestions_nodesBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GRealmSuggestionsData_appRealmSuggestions_nodesBuilder toBuilder() =>
      new GRealmSuggestionsData_appRealmSuggestions_nodesBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GRealmSuggestionsData_appRealmSuggestions_nodes &&
        G__typename == other.G__typename &&
        id == other.id &&
        primaryName == other.primaryName &&
        description == other.description &&
        logo == other.logo;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, G__typename.hashCode), id.hashCode),
                primaryName.hashCode),
            description.hashCode),
        logo.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GRealmSuggestionsData_appRealmSuggestions_nodes')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('primaryName', primaryName)
          ..add('description', description)
          ..add('logo', logo))
        .toString();
  }
}

class GRealmSuggestionsData_appRealmSuggestions_nodesBuilder
    implements
        Builder<GRealmSuggestionsData_appRealmSuggestions_nodes,
            GRealmSuggestionsData_appRealmSuggestions_nodesBuilder> {
  _$GRealmSuggestionsData_appRealmSuggestions_nodes? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _primaryName;
  String? get primaryName => _$this._primaryName;
  set primaryName(String? primaryName) => _$this._primaryName = primaryName;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _logo;
  String? get logo => _$this._logo;
  set logo(String? logo) => _$this._logo = logo;

  GRealmSuggestionsData_appRealmSuggestions_nodesBuilder() {
    GRealmSuggestionsData_appRealmSuggestions_nodes._initializeBuilder(this);
  }

  GRealmSuggestionsData_appRealmSuggestions_nodesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _primaryName = $v.primaryName;
      _description = $v.description;
      _logo = $v.logo;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GRealmSuggestionsData_appRealmSuggestions_nodes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GRealmSuggestionsData_appRealmSuggestions_nodes;
  }

  @override
  void update(
      void Function(GRealmSuggestionsData_appRealmSuggestions_nodesBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GRealmSuggestionsData_appRealmSuggestions_nodes build() {
    final _$result = _$v ??
        new _$GRealmSuggestionsData_appRealmSuggestions_nodes._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GRealmSuggestionsData_appRealmSuggestions_nodes',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, 'GRealmSuggestionsData_appRealmSuggestions_nodes', 'id'),
            primaryName: BuiltValueNullFieldError.checkNotNull(
                primaryName,
                'GRealmSuggestionsData_appRealmSuggestions_nodes',
                'primaryName'),
            description: description,
            logo: logo);
    replace(_$result);
    return _$result;
  }
}

class _$GRealmSuggestionsData_appRealmSuggestions_pageInfo
    extends GRealmSuggestionsData_appRealmSuggestions_pageInfo {
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

  factory _$GRealmSuggestionsData_appRealmSuggestions_pageInfo(
          [void Function(
                  GRealmSuggestionsData_appRealmSuggestions_pageInfoBuilder)?
              updates]) =>
      (new GRealmSuggestionsData_appRealmSuggestions_pageInfoBuilder()
            ..update(updates))
          .build();

  _$GRealmSuggestionsData_appRealmSuggestions_pageInfo._(
      {required this.G__typename,
      required this.hasPreviousPage,
      required this.hasNextPage,
      this.startCursor,
      this.endCursor})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GRealmSuggestionsData_appRealmSuggestions_pageInfo', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        hasPreviousPage,
        'GRealmSuggestionsData_appRealmSuggestions_pageInfo',
        'hasPreviousPage');
    BuiltValueNullFieldError.checkNotNull(hasNextPage,
        'GRealmSuggestionsData_appRealmSuggestions_pageInfo', 'hasNextPage');
  }

  @override
  GRealmSuggestionsData_appRealmSuggestions_pageInfo rebuild(
          void Function(
                  GRealmSuggestionsData_appRealmSuggestions_pageInfoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GRealmSuggestionsData_appRealmSuggestions_pageInfoBuilder toBuilder() =>
      new GRealmSuggestionsData_appRealmSuggestions_pageInfoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GRealmSuggestionsData_appRealmSuggestions_pageInfo &&
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
            'GRealmSuggestionsData_appRealmSuggestions_pageInfo')
          ..add('G__typename', G__typename)
          ..add('hasPreviousPage', hasPreviousPage)
          ..add('hasNextPage', hasNextPage)
          ..add('startCursor', startCursor)
          ..add('endCursor', endCursor))
        .toString();
  }
}

class GRealmSuggestionsData_appRealmSuggestions_pageInfoBuilder
    implements
        Builder<GRealmSuggestionsData_appRealmSuggestions_pageInfo,
            GRealmSuggestionsData_appRealmSuggestions_pageInfoBuilder> {
  _$GRealmSuggestionsData_appRealmSuggestions_pageInfo? _$v;

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

  GRealmSuggestionsData_appRealmSuggestions_pageInfoBuilder() {
    GRealmSuggestionsData_appRealmSuggestions_pageInfo._initializeBuilder(this);
  }

  GRealmSuggestionsData_appRealmSuggestions_pageInfoBuilder get _$this {
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
  void replace(GRealmSuggestionsData_appRealmSuggestions_pageInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GRealmSuggestionsData_appRealmSuggestions_pageInfo;
  }

  @override
  void update(
      void Function(GRealmSuggestionsData_appRealmSuggestions_pageInfoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GRealmSuggestionsData_appRealmSuggestions_pageInfo build() {
    final _$result = _$v ??
        new _$GRealmSuggestionsData_appRealmSuggestions_pageInfo._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GRealmSuggestionsData_appRealmSuggestions_pageInfo',
                'G__typename'),
            hasPreviousPage: BuiltValueNullFieldError.checkNotNull(
                hasPreviousPage,
                'GRealmSuggestionsData_appRealmSuggestions_pageInfo',
                'hasPreviousPage'),
            hasNextPage: BuiltValueNullFieldError.checkNotNull(
                hasNextPage,
                'GRealmSuggestionsData_appRealmSuggestions_pageInfo',
                'hasNextPage'),
            startCursor: startCursor,
            endCursor: endCursor);
    replace(_$result);
    return _$result;
  }
}

class _$GRealmSuggestionsData_appRealmSuggestions_permissions__base
    extends GRealmSuggestionsData_appRealmSuggestions_permissions__base {
  @override
  final String G__typename;

  factory _$GRealmSuggestionsData_appRealmSuggestions_permissions__base(
          [void Function(
                  GRealmSuggestionsData_appRealmSuggestions_permissions__baseBuilder)?
              updates]) =>
      (new GRealmSuggestionsData_appRealmSuggestions_permissions__baseBuilder()
            ..update(updates))
          .build();

  _$GRealmSuggestionsData_appRealmSuggestions_permissions__base._(
      {required this.G__typename})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        'GRealmSuggestionsData_appRealmSuggestions_permissions__base',
        'G__typename');
  }

  @override
  GRealmSuggestionsData_appRealmSuggestions_permissions__base rebuild(
          void Function(
                  GRealmSuggestionsData_appRealmSuggestions_permissions__baseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GRealmSuggestionsData_appRealmSuggestions_permissions__baseBuilder
      toBuilder() =>
          new GRealmSuggestionsData_appRealmSuggestions_permissions__baseBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GRealmSuggestionsData_appRealmSuggestions_permissions__base &&
        G__typename == other.G__typename;
  }

  @override
  int get hashCode {
    return $jf($jc(0, G__typename.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GRealmSuggestionsData_appRealmSuggestions_permissions__base')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GRealmSuggestionsData_appRealmSuggestions_permissions__baseBuilder
    implements
        Builder<GRealmSuggestionsData_appRealmSuggestions_permissions__base,
            GRealmSuggestionsData_appRealmSuggestions_permissions__baseBuilder> {
  _$GRealmSuggestionsData_appRealmSuggestions_permissions__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GRealmSuggestionsData_appRealmSuggestions_permissions__baseBuilder() {
    GRealmSuggestionsData_appRealmSuggestions_permissions__base
        ._initializeBuilder(this);
  }

  GRealmSuggestionsData_appRealmSuggestions_permissions__baseBuilder
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
      GRealmSuggestionsData_appRealmSuggestions_permissions__base other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v =
        other as _$GRealmSuggestionsData_appRealmSuggestions_permissions__base;
  }

  @override
  void update(
      void Function(
              GRealmSuggestionsData_appRealmSuggestions_permissions__baseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GRealmSuggestionsData_appRealmSuggestions_permissions__base build() {
    final _$result = _$v ??
        new _$GRealmSuggestionsData_appRealmSuggestions_permissions__base._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GRealmSuggestionsData_appRealmSuggestions_permissions__base',
                'G__typename'));
    replace(_$result);
    return _$result;
  }
}

class _$GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission
    extends GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission {
  @override
  final String G__typename;
  @override
  final bool locked;

  factory _$GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission(
          [void Function(
                  GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermissionBuilder)?
              updates]) =>
      (new GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermissionBuilder()
            ..update(updates))
          .build();

  _$GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission._(
      {required this.G__typename, required this.locked})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        'GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        locked,
        'GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission',
        'locked');
  }

  @override
  GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission rebuild(
          void Function(
                  GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermissionBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermissionBuilder
      toBuilder() =>
          new GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermissionBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission &&
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
            'GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission')
          ..add('G__typename', G__typename)
          ..add('locked', locked))
        .toString();
  }
}

class GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermissionBuilder
    implements
        Builder<
            GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission,
            GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermissionBuilder> {
  _$GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission?
      _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _locked;
  bool? get locked => _$this._locked;
  set locked(bool? locked) => _$this._locked = locked;

  GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermissionBuilder() {
    GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission
        ._initializeBuilder(this);
  }

  GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermissionBuilder
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
      GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission;
  }

  @override
  void update(
      void Function(
              GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermissionBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission
      build() {
    final _$result = _$v ??
        new _$GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission
                ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission',
                'G__typename'),
            locked: BuiltValueNullFieldError.checkNotNull(
                locked,
                'GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission',
                'locked'));
    replace(_$result);
    return _$result;
  }
}

class _$GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission
    extends GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission {
  @override
  final String G__typename;
  @override
  final bool lockNextPage;
  @override
  final bool lockPreviousPage;
  @override
  final int rowLimit;

  factory _$GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission(
          [void Function(
                  GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermissionBuilder)?
              updates]) =>
      (new GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermissionBuilder()
            ..update(updates))
          .build();

  _$GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission._(
      {required this.G__typename,
      required this.lockNextPage,
      required this.lockPreviousPage,
      required this.rowLimit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        'GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        lockNextPage,
        'GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission',
        'lockNextPage');
    BuiltValueNullFieldError.checkNotNull(
        lockPreviousPage,
        'GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission',
        'lockPreviousPage');
    BuiltValueNullFieldError.checkNotNull(
        rowLimit,
        'GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission',
        'rowLimit');
  }

  @override
  GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission
      rebuild(
              void Function(
                      GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermissionBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermissionBuilder
      toBuilder() =>
          new GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermissionBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission &&
        G__typename == other.G__typename &&
        lockNextPage == other.lockNextPage &&
        lockPreviousPage == other.lockPreviousPage &&
        rowLimit == other.rowLimit;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, G__typename.hashCode), lockNextPage.hashCode),
            lockPreviousPage.hashCode),
        rowLimit.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission')
          ..add('G__typename', G__typename)
          ..add('lockNextPage', lockNextPage)
          ..add('lockPreviousPage', lockPreviousPage)
          ..add('rowLimit', rowLimit))
        .toString();
  }
}

class GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermissionBuilder
    implements
        Builder<
            GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission,
            GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermissionBuilder> {
  _$GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission?
      _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _lockNextPage;
  bool? get lockNextPage => _$this._lockNextPage;
  set lockNextPage(bool? lockNextPage) => _$this._lockNextPage = lockNextPage;

  bool? _lockPreviousPage;
  bool? get lockPreviousPage => _$this._lockPreviousPage;
  set lockPreviousPage(bool? lockPreviousPage) =>
      _$this._lockPreviousPage = lockPreviousPage;

  int? _rowLimit;
  int? get rowLimit => _$this._rowLimit;
  set rowLimit(int? rowLimit) => _$this._rowLimit = rowLimit;

  GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermissionBuilder() {
    GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission
        ._initializeBuilder(this);
  }

  GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermissionBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _lockNextPage = $v.lockNextPage;
      _lockPreviousPage = $v.lockPreviousPage;
      _rowLimit = $v.rowLimit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission;
  }

  @override
  void update(
      void Function(
              GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermissionBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission
      build() {
    final _$result = _$v ??
        new _$GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission',
                'G__typename'),
            lockNextPage: BuiltValueNullFieldError.checkNotNull(
                lockNextPage,
                'GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission',
                'lockNextPage'),
            lockPreviousPage: BuiltValueNullFieldError.checkNotNull(
                lockPreviousPage,
                'GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission',
                'lockPreviousPage'),
            rowLimit: BuiltValueNullFieldError.checkNotNull(
                rowLimit,
                'GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission',
                'rowLimit'));
    replace(_$result);
    return _$result;
  }
}

class _$GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission
    extends GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission {
  @override
  final String G__typename;
  @override
  final int remaining;
  @override
  final int used;
  @override
  final int total;

  factory _$GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission(
          [void Function(
                  GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermissionBuilder)?
              updates]) =>
      (new GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermissionBuilder()
            ..update(updates))
          .build();

  _$GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission._(
      {required this.G__typename,
      required this.remaining,
      required this.used,
      required this.total})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        'GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        remaining,
        'GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission',
        'remaining');
    BuiltValueNullFieldError.checkNotNull(
        used,
        'GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission',
        'used');
    BuiltValueNullFieldError.checkNotNull(
        total,
        'GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission',
        'total');
  }

  @override
  GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission
      rebuild(
              void Function(
                      GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermissionBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermissionBuilder
      toBuilder() =>
          new GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermissionBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission &&
        G__typename == other.G__typename &&
        remaining == other.remaining &&
        used == other.used &&
        total == other.total;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, G__typename.hashCode), remaining.hashCode),
            used.hashCode),
        total.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission')
          ..add('G__typename', G__typename)
          ..add('remaining', remaining)
          ..add('used', used)
          ..add('total', total))
        .toString();
  }
}

class GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermissionBuilder
    implements
        Builder<
            GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission,
            GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermissionBuilder> {
  _$GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission?
      _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _remaining;
  int? get remaining => _$this._remaining;
  set remaining(int? remaining) => _$this._remaining = remaining;

  int? _used;
  int? get used => _$this._used;
  set used(int? used) => _$this._used = used;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermissionBuilder() {
    GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission
        ._initializeBuilder(this);
  }

  GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermissionBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _remaining = $v.remaining;
      _used = $v.used;
      _total = $v.total;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission;
  }

  @override
  void update(
      void Function(
              GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermissionBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission
      build() {
    final _$result = _$v ??
        new _$GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission',
                'G__typename'),
            remaining: BuiltValueNullFieldError.checkNotNull(
                remaining,
                'GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission',
                'remaining'),
            used: BuiltValueNullFieldError.checkNotNull(
                used,
                'GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission',
                'used'),
            total: BuiltValueNullFieldError.checkNotNull(
                total,
                'GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission',
                'total'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
