// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'key_value_map.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GKeyValueMapData> _$gKeyValueMapDataSerializer =
    new _$GKeyValueMapDataSerializer();
Serializer<GKeyValueMapData_keyValueMap>
    _$gKeyValueMapDataKeyValueMapSerializer =
    new _$GKeyValueMapData_keyValueMapSerializer();
Serializer<GKeyValueMapData_keyValueMap_permissions__base>
    _$gKeyValueMapDataKeyValueMapPermissionsBaseSerializer =
    new _$GKeyValueMapData_keyValueMap_permissions__baseSerializer();
Serializer<GKeyValueMapData_keyValueMap_permissions__asLockPermission>
    _$gKeyValueMapDataKeyValueMapPermissionsAsLockPermissionSerializer =
    new _$GKeyValueMapData_keyValueMap_permissions__asLockPermissionSerializer();
Serializer<GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission>
    _$gKeyValueMapDataKeyValueMapPermissionsAsFrequencyPermissionSerializer =
    new _$GKeyValueMapData_keyValueMap_permissions__asFrequencyPermissionSerializer();
Serializer<GKeyValueMapData_keyValueMap_permissions__asPaginationPermission>
    _$gKeyValueMapDataKeyValueMapPermissionsAsPaginationPermissionSerializer =
    new _$GKeyValueMapData_keyValueMap_permissions__asPaginationPermissionSerializer();

class _$GKeyValueMapDataSerializer
    implements StructuredSerializer<GKeyValueMapData> {
  @override
  final Iterable<Type> types = const [GKeyValueMapData, _$GKeyValueMapData];
  @override
  final String wireName = 'GKeyValueMapData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GKeyValueMapData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.keyValueMap;
    if (value != null) {
      result
        ..add('keyValueMap')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GKeyValueMapData_keyValueMap)));
    }
    return result;
  }

  @override
  GKeyValueMapData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GKeyValueMapDataBuilder();

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
        case 'keyValueMap':
          result.keyValueMap.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GKeyValueMapData_keyValueMap))!
              as GKeyValueMapData_keyValueMap);
          break;
      }
    }

    return result.build();
  }
}

class _$GKeyValueMapData_keyValueMapSerializer
    implements StructuredSerializer<GKeyValueMapData_keyValueMap> {
  @override
  final Iterable<Type> types = const [
    GKeyValueMapData_keyValueMap,
    _$GKeyValueMapData_keyValueMap
  ];
  @override
  final String wireName = 'GKeyValueMapData_keyValueMap';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GKeyValueMapData_keyValueMap object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.permissions;
    if (value != null) {
      result
        ..add('permissions')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(GKeyValueMapData_keyValueMap_permissions)
            ])));
    }
    return result;
  }

  @override
  GKeyValueMapData_keyValueMap deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GKeyValueMapData_keyValueMapBuilder();

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
        case 'data':
          result.data = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'permissions':
          result.permissions.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GKeyValueMapData_keyValueMap_permissions)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GKeyValueMapData_keyValueMap_permissions__baseSerializer
    implements
        StructuredSerializer<GKeyValueMapData_keyValueMap_permissions__base> {
  @override
  final Iterable<Type> types = const [
    GKeyValueMapData_keyValueMap_permissions__base,
    _$GKeyValueMapData_keyValueMap_permissions__base
  ];
  @override
  final String wireName = 'GKeyValueMapData_keyValueMap_permissions__base';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GKeyValueMapData_keyValueMap_permissions__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GKeyValueMapData_keyValueMap_permissions__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GKeyValueMapData_keyValueMap_permissions__baseBuilder();

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

class _$GKeyValueMapData_keyValueMap_permissions__asLockPermissionSerializer
    implements
        StructuredSerializer<
            GKeyValueMapData_keyValueMap_permissions__asLockPermission> {
  @override
  final Iterable<Type> types = const [
    GKeyValueMapData_keyValueMap_permissions__asLockPermission,
    _$GKeyValueMapData_keyValueMap_permissions__asLockPermission
  ];
  @override
  final String wireName =
      'GKeyValueMapData_keyValueMap_permissions__asLockPermission';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GKeyValueMapData_keyValueMap_permissions__asLockPermission object,
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
  GKeyValueMapData_keyValueMap_permissions__asLockPermission deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GKeyValueMapData_keyValueMap_permissions__asLockPermissionBuilder();

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

class _$GKeyValueMapData_keyValueMap_permissions__asFrequencyPermissionSerializer
    implements
        StructuredSerializer<
            GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission> {
  @override
  final Iterable<Type> types = const [
    GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission,
    _$GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission
  ];
  @override
  final String wireName =
      'GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission object,
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
  GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GKeyValueMapData_keyValueMap_permissions__asFrequencyPermissionBuilder();

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

class _$GKeyValueMapData_keyValueMap_permissions__asPaginationPermissionSerializer
    implements
        StructuredSerializer<
            GKeyValueMapData_keyValueMap_permissions__asPaginationPermission> {
  @override
  final Iterable<Type> types = const [
    GKeyValueMapData_keyValueMap_permissions__asPaginationPermission,
    _$GKeyValueMapData_keyValueMap_permissions__asPaginationPermission
  ];
  @override
  final String wireName =
      'GKeyValueMapData_keyValueMap_permissions__asPaginationPermission';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GKeyValueMapData_keyValueMap_permissions__asPaginationPermission object,
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
  GKeyValueMapData_keyValueMap_permissions__asPaginationPermission deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GKeyValueMapData_keyValueMap_permissions__asPaginationPermissionBuilder();

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

class _$GKeyValueMapData extends GKeyValueMapData {
  @override
  final String G__typename;
  @override
  final GKeyValueMapData_keyValueMap? keyValueMap;

  factory _$GKeyValueMapData(
          [void Function(GKeyValueMapDataBuilder)? updates]) =>
      (new GKeyValueMapDataBuilder()..update(updates)).build();

  _$GKeyValueMapData._({required this.G__typename, this.keyValueMap})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GKeyValueMapData', 'G__typename');
  }

  @override
  GKeyValueMapData rebuild(void Function(GKeyValueMapDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GKeyValueMapDataBuilder toBuilder() =>
      new GKeyValueMapDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GKeyValueMapData &&
        G__typename == other.G__typename &&
        keyValueMap == other.keyValueMap;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), keyValueMap.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GKeyValueMapData')
          ..add('G__typename', G__typename)
          ..add('keyValueMap', keyValueMap))
        .toString();
  }
}

class GKeyValueMapDataBuilder
    implements Builder<GKeyValueMapData, GKeyValueMapDataBuilder> {
  _$GKeyValueMapData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GKeyValueMapData_keyValueMapBuilder? _keyValueMap;
  GKeyValueMapData_keyValueMapBuilder get keyValueMap =>
      _$this._keyValueMap ??= new GKeyValueMapData_keyValueMapBuilder();
  set keyValueMap(GKeyValueMapData_keyValueMapBuilder? keyValueMap) =>
      _$this._keyValueMap = keyValueMap;

  GKeyValueMapDataBuilder() {
    GKeyValueMapData._initializeBuilder(this);
  }

  GKeyValueMapDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _keyValueMap = $v.keyValueMap?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GKeyValueMapData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GKeyValueMapData;
  }

  @override
  void update(void Function(GKeyValueMapDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GKeyValueMapData build() {
    _$GKeyValueMapData _$result;
    try {
      _$result = _$v ??
          new _$GKeyValueMapData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GKeyValueMapData', 'G__typename'),
              keyValueMap: _keyValueMap?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'keyValueMap';
        _keyValueMap?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GKeyValueMapData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GKeyValueMapData_keyValueMap extends GKeyValueMapData_keyValueMap {
  @override
  final String G__typename;
  @override
  final String? data;
  @override
  final BuiltList<GKeyValueMapData_keyValueMap_permissions>? permissions;

  factory _$GKeyValueMapData_keyValueMap(
          [void Function(GKeyValueMapData_keyValueMapBuilder)? updates]) =>
      (new GKeyValueMapData_keyValueMapBuilder()..update(updates)).build();

  _$GKeyValueMapData_keyValueMap._(
      {required this.G__typename, this.data, this.permissions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GKeyValueMapData_keyValueMap', 'G__typename');
  }

  @override
  GKeyValueMapData_keyValueMap rebuild(
          void Function(GKeyValueMapData_keyValueMapBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GKeyValueMapData_keyValueMapBuilder toBuilder() =>
      new GKeyValueMapData_keyValueMapBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GKeyValueMapData_keyValueMap &&
        G__typename == other.G__typename &&
        data == other.data &&
        permissions == other.permissions;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, G__typename.hashCode), data.hashCode),
        permissions.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GKeyValueMapData_keyValueMap')
          ..add('G__typename', G__typename)
          ..add('data', data)
          ..add('permissions', permissions))
        .toString();
  }
}

class GKeyValueMapData_keyValueMapBuilder
    implements
        Builder<GKeyValueMapData_keyValueMap,
            GKeyValueMapData_keyValueMapBuilder> {
  _$GKeyValueMapData_keyValueMap? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _data;
  String? get data => _$this._data;
  set data(String? data) => _$this._data = data;

  ListBuilder<GKeyValueMapData_keyValueMap_permissions>? _permissions;
  ListBuilder<GKeyValueMapData_keyValueMap_permissions> get permissions =>
      _$this._permissions ??=
          new ListBuilder<GKeyValueMapData_keyValueMap_permissions>();
  set permissions(
          ListBuilder<GKeyValueMapData_keyValueMap_permissions>? permissions) =>
      _$this._permissions = permissions;

  GKeyValueMapData_keyValueMapBuilder() {
    GKeyValueMapData_keyValueMap._initializeBuilder(this);
  }

  GKeyValueMapData_keyValueMapBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _data = $v.data;
      _permissions = $v.permissions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GKeyValueMapData_keyValueMap other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GKeyValueMapData_keyValueMap;
  }

  @override
  void update(void Function(GKeyValueMapData_keyValueMapBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GKeyValueMapData_keyValueMap build() {
    _$GKeyValueMapData_keyValueMap _$result;
    try {
      _$result = _$v ??
          new _$GKeyValueMapData_keyValueMap._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GKeyValueMapData_keyValueMap', 'G__typename'),
              data: data,
              permissions: _permissions?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'permissions';
        _permissions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GKeyValueMapData_keyValueMap', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GKeyValueMapData_keyValueMap_permissions__base
    extends GKeyValueMapData_keyValueMap_permissions__base {
  @override
  final String G__typename;

  factory _$GKeyValueMapData_keyValueMap_permissions__base(
          [void Function(GKeyValueMapData_keyValueMap_permissions__baseBuilder)?
              updates]) =>
      (new GKeyValueMapData_keyValueMap_permissions__baseBuilder()
            ..update(updates))
          .build();

  _$GKeyValueMapData_keyValueMap_permissions__base._(
      {required this.G__typename})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GKeyValueMapData_keyValueMap_permissions__base', 'G__typename');
  }

  @override
  GKeyValueMapData_keyValueMap_permissions__base rebuild(
          void Function(GKeyValueMapData_keyValueMap_permissions__baseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GKeyValueMapData_keyValueMap_permissions__baseBuilder toBuilder() =>
      new GKeyValueMapData_keyValueMap_permissions__baseBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GKeyValueMapData_keyValueMap_permissions__base &&
        G__typename == other.G__typename;
  }

  @override
  int get hashCode {
    return $jf($jc(0, G__typename.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GKeyValueMapData_keyValueMap_permissions__base')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GKeyValueMapData_keyValueMap_permissions__baseBuilder
    implements
        Builder<GKeyValueMapData_keyValueMap_permissions__base,
            GKeyValueMapData_keyValueMap_permissions__baseBuilder> {
  _$GKeyValueMapData_keyValueMap_permissions__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GKeyValueMapData_keyValueMap_permissions__baseBuilder() {
    GKeyValueMapData_keyValueMap_permissions__base._initializeBuilder(this);
  }

  GKeyValueMapData_keyValueMap_permissions__baseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GKeyValueMapData_keyValueMap_permissions__base other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GKeyValueMapData_keyValueMap_permissions__base;
  }

  @override
  void update(
      void Function(GKeyValueMapData_keyValueMap_permissions__baseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GKeyValueMapData_keyValueMap_permissions__base build() {
    final _$result = _$v ??
        new _$GKeyValueMapData_keyValueMap_permissions__base._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GKeyValueMapData_keyValueMap_permissions__base',
                'G__typename'));
    replace(_$result);
    return _$result;
  }
}

class _$GKeyValueMapData_keyValueMap_permissions__asLockPermission
    extends GKeyValueMapData_keyValueMap_permissions__asLockPermission {
  @override
  final String G__typename;
  @override
  final bool locked;

  factory _$GKeyValueMapData_keyValueMap_permissions__asLockPermission(
          [void Function(
                  GKeyValueMapData_keyValueMap_permissions__asLockPermissionBuilder)?
              updates]) =>
      (new GKeyValueMapData_keyValueMap_permissions__asLockPermissionBuilder()
            ..update(updates))
          .build();

  _$GKeyValueMapData_keyValueMap_permissions__asLockPermission._(
      {required this.G__typename, required this.locked})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        'GKeyValueMapData_keyValueMap_permissions__asLockPermission',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(locked,
        'GKeyValueMapData_keyValueMap_permissions__asLockPermission', 'locked');
  }

  @override
  GKeyValueMapData_keyValueMap_permissions__asLockPermission rebuild(
          void Function(
                  GKeyValueMapData_keyValueMap_permissions__asLockPermissionBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GKeyValueMapData_keyValueMap_permissions__asLockPermissionBuilder
      toBuilder() =>
          new GKeyValueMapData_keyValueMap_permissions__asLockPermissionBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GKeyValueMapData_keyValueMap_permissions__asLockPermission &&
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
            'GKeyValueMapData_keyValueMap_permissions__asLockPermission')
          ..add('G__typename', G__typename)
          ..add('locked', locked))
        .toString();
  }
}

class GKeyValueMapData_keyValueMap_permissions__asLockPermissionBuilder
    implements
        Builder<GKeyValueMapData_keyValueMap_permissions__asLockPermission,
            GKeyValueMapData_keyValueMap_permissions__asLockPermissionBuilder> {
  _$GKeyValueMapData_keyValueMap_permissions__asLockPermission? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _locked;
  bool? get locked => _$this._locked;
  set locked(bool? locked) => _$this._locked = locked;

  GKeyValueMapData_keyValueMap_permissions__asLockPermissionBuilder() {
    GKeyValueMapData_keyValueMap_permissions__asLockPermission
        ._initializeBuilder(this);
  }

  GKeyValueMapData_keyValueMap_permissions__asLockPermissionBuilder get _$this {
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
      GKeyValueMapData_keyValueMap_permissions__asLockPermission other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GKeyValueMapData_keyValueMap_permissions__asLockPermission;
  }

  @override
  void update(
      void Function(
              GKeyValueMapData_keyValueMap_permissions__asLockPermissionBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GKeyValueMapData_keyValueMap_permissions__asLockPermission build() {
    final _$result = _$v ??
        new _$GKeyValueMapData_keyValueMap_permissions__asLockPermission._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GKeyValueMapData_keyValueMap_permissions__asLockPermission',
                'G__typename'),
            locked: BuiltValueNullFieldError.checkNotNull(
                locked,
                'GKeyValueMapData_keyValueMap_permissions__asLockPermission',
                'locked'));
    replace(_$result);
    return _$result;
  }
}

class _$GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission
    extends GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission {
  @override
  final String G__typename;
  @override
  final int used;
  @override
  final int total;
  @override
  final int remaining;

  factory _$GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission(
          [void Function(
                  GKeyValueMapData_keyValueMap_permissions__asFrequencyPermissionBuilder)?
              updates]) =>
      (new GKeyValueMapData_keyValueMap_permissions__asFrequencyPermissionBuilder()
            ..update(updates))
          .build();

  _$GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission._(
      {required this.G__typename,
      required this.used,
      required this.total,
      required this.remaining})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        'GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        used,
        'GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission',
        'used');
    BuiltValueNullFieldError.checkNotNull(
        total,
        'GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission',
        'total');
    BuiltValueNullFieldError.checkNotNull(
        remaining,
        'GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission',
        'remaining');
  }

  @override
  GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission rebuild(
          void Function(
                  GKeyValueMapData_keyValueMap_permissions__asFrequencyPermissionBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GKeyValueMapData_keyValueMap_permissions__asFrequencyPermissionBuilder
      toBuilder() =>
          new GKeyValueMapData_keyValueMap_permissions__asFrequencyPermissionBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission &&
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
            'GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission')
          ..add('G__typename', G__typename)
          ..add('used', used)
          ..add('total', total)
          ..add('remaining', remaining))
        .toString();
  }
}

class GKeyValueMapData_keyValueMap_permissions__asFrequencyPermissionBuilder
    implements
        Builder<GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission,
            GKeyValueMapData_keyValueMap_permissions__asFrequencyPermissionBuilder> {
  _$GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission? _$v;

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

  GKeyValueMapData_keyValueMap_permissions__asFrequencyPermissionBuilder() {
    GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission
        ._initializeBuilder(this);
  }

  GKeyValueMapData_keyValueMap_permissions__asFrequencyPermissionBuilder
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
      GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission;
  }

  @override
  void update(
      void Function(
              GKeyValueMapData_keyValueMap_permissions__asFrequencyPermissionBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission build() {
    final _$result = _$v ??
        new _$GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission',
                'G__typename'),
            used: BuiltValueNullFieldError.checkNotNull(
                used,
                'GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission',
                'used'),
            total: BuiltValueNullFieldError.checkNotNull(
                total,
                'GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission',
                'total'),
            remaining: BuiltValueNullFieldError.checkNotNull(
                remaining,
                'GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission',
                'remaining'));
    replace(_$result);
    return _$result;
  }
}

class _$GKeyValueMapData_keyValueMap_permissions__asPaginationPermission
    extends GKeyValueMapData_keyValueMap_permissions__asPaginationPermission {
  @override
  final String G__typename;
  @override
  final int rowLimit;
  @override
  final bool lockNextPage;
  @override
  final bool lockPreviousPage;

  factory _$GKeyValueMapData_keyValueMap_permissions__asPaginationPermission(
          [void Function(
                  GKeyValueMapData_keyValueMap_permissions__asPaginationPermissionBuilder)?
              updates]) =>
      (new GKeyValueMapData_keyValueMap_permissions__asPaginationPermissionBuilder()
            ..update(updates))
          .build();

  _$GKeyValueMapData_keyValueMap_permissions__asPaginationPermission._(
      {required this.G__typename,
      required this.rowLimit,
      required this.lockNextPage,
      required this.lockPreviousPage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        'GKeyValueMapData_keyValueMap_permissions__asPaginationPermission',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        rowLimit,
        'GKeyValueMapData_keyValueMap_permissions__asPaginationPermission',
        'rowLimit');
    BuiltValueNullFieldError.checkNotNull(
        lockNextPage,
        'GKeyValueMapData_keyValueMap_permissions__asPaginationPermission',
        'lockNextPage');
    BuiltValueNullFieldError.checkNotNull(
        lockPreviousPage,
        'GKeyValueMapData_keyValueMap_permissions__asPaginationPermission',
        'lockPreviousPage');
  }

  @override
  GKeyValueMapData_keyValueMap_permissions__asPaginationPermission rebuild(
          void Function(
                  GKeyValueMapData_keyValueMap_permissions__asPaginationPermissionBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GKeyValueMapData_keyValueMap_permissions__asPaginationPermissionBuilder
      toBuilder() =>
          new GKeyValueMapData_keyValueMap_permissions__asPaginationPermissionBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GKeyValueMapData_keyValueMap_permissions__asPaginationPermission &&
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
            'GKeyValueMapData_keyValueMap_permissions__asPaginationPermission')
          ..add('G__typename', G__typename)
          ..add('rowLimit', rowLimit)
          ..add('lockNextPage', lockNextPage)
          ..add('lockPreviousPage', lockPreviousPage))
        .toString();
  }
}

class GKeyValueMapData_keyValueMap_permissions__asPaginationPermissionBuilder
    implements
        Builder<
            GKeyValueMapData_keyValueMap_permissions__asPaginationPermission,
            GKeyValueMapData_keyValueMap_permissions__asPaginationPermissionBuilder> {
  _$GKeyValueMapData_keyValueMap_permissions__asPaginationPermission? _$v;

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

  GKeyValueMapData_keyValueMap_permissions__asPaginationPermissionBuilder() {
    GKeyValueMapData_keyValueMap_permissions__asPaginationPermission
        ._initializeBuilder(this);
  }

  GKeyValueMapData_keyValueMap_permissions__asPaginationPermissionBuilder
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
      GKeyValueMapData_keyValueMap_permissions__asPaginationPermission other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GKeyValueMapData_keyValueMap_permissions__asPaginationPermission;
  }

  @override
  void update(
      void Function(
              GKeyValueMapData_keyValueMap_permissions__asPaginationPermissionBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GKeyValueMapData_keyValueMap_permissions__asPaginationPermission build() {
    final _$result = _$v ??
        new _$GKeyValueMapData_keyValueMap_permissions__asPaginationPermission._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GKeyValueMapData_keyValueMap_permissions__asPaginationPermission',
                'G__typename'),
            rowLimit: BuiltValueNullFieldError.checkNotNull(
                rowLimit,
                'GKeyValueMapData_keyValueMap_permissions__asPaginationPermission',
                'rowLimit'),
            lockNextPage: BuiltValueNullFieldError.checkNotNull(
                lockNextPage,
                'GKeyValueMapData_keyValueMap_permissions__asPaginationPermission',
                'lockNextPage'),
            lockPreviousPage: BuiltValueNullFieldError.checkNotNull(
                lockPreviousPage,
                'GKeyValueMapData_keyValueMap_permissions__asPaginationPermission',
                'lockPreviousPage'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
