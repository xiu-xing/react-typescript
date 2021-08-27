// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracker.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GTrackEntityData> _$gTrackEntityDataSerializer =
    new _$GTrackEntityDataSerializer();
Serializer<GUnTrackEntityByEntityIDData>
    _$gUnTrackEntityByEntityIDDataSerializer =
    new _$GUnTrackEntityByEntityIDDataSerializer();

class _$GTrackEntityDataSerializer
    implements StructuredSerializer<GTrackEntityData> {
  @override
  final Iterable<Type> types = const [GTrackEntityData, _$GTrackEntityData];
  @override
  final String wireName = 'GTrackEntityData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GTrackEntityData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'appTrackEntity',
      serializers.serialize(object.appTrackEntity,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GTrackEntityData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTrackEntityDataBuilder();

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
        case 'appTrackEntity':
          result.appTrackEntity = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GUnTrackEntityByEntityIDDataSerializer
    implements StructuredSerializer<GUnTrackEntityByEntityIDData> {
  @override
  final Iterable<Type> types = const [
    GUnTrackEntityByEntityIDData,
    _$GUnTrackEntityByEntityIDData
  ];
  @override
  final String wireName = 'GUnTrackEntityByEntityIDData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUnTrackEntityByEntityIDData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'appUnTrackEntityByEntityID',
      serializers.serialize(object.appUnTrackEntityByEntityID,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GUnTrackEntityByEntityIDData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUnTrackEntityByEntityIDDataBuilder();

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
        case 'appUnTrackEntityByEntityID':
          result.appUnTrackEntityByEntityID = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GTrackEntityData extends GTrackEntityData {
  @override
  final String G__typename;
  @override
  final bool appTrackEntity;

  factory _$GTrackEntityData(
          [void Function(GTrackEntityDataBuilder)? updates]) =>
      (new GTrackEntityDataBuilder()..update(updates)).build();

  _$GTrackEntityData._(
      {required this.G__typename, required this.appTrackEntity})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GTrackEntityData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        appTrackEntity, 'GTrackEntityData', 'appTrackEntity');
  }

  @override
  GTrackEntityData rebuild(void Function(GTrackEntityDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTrackEntityDataBuilder toBuilder() =>
      new GTrackEntityDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTrackEntityData &&
        G__typename == other.G__typename &&
        appTrackEntity == other.appTrackEntity;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), appTrackEntity.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GTrackEntityData')
          ..add('G__typename', G__typename)
          ..add('appTrackEntity', appTrackEntity))
        .toString();
  }
}

class GTrackEntityDataBuilder
    implements Builder<GTrackEntityData, GTrackEntityDataBuilder> {
  _$GTrackEntityData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _appTrackEntity;
  bool? get appTrackEntity => _$this._appTrackEntity;
  set appTrackEntity(bool? appTrackEntity) =>
      _$this._appTrackEntity = appTrackEntity;

  GTrackEntityDataBuilder() {
    GTrackEntityData._initializeBuilder(this);
  }

  GTrackEntityDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _appTrackEntity = $v.appTrackEntity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTrackEntityData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTrackEntityData;
  }

  @override
  void update(void Function(GTrackEntityDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GTrackEntityData build() {
    final _$result = _$v ??
        new _$GTrackEntityData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GTrackEntityData', 'G__typename'),
            appTrackEntity: BuiltValueNullFieldError.checkNotNull(
                appTrackEntity, 'GTrackEntityData', 'appTrackEntity'));
    replace(_$result);
    return _$result;
  }
}

class _$GUnTrackEntityByEntityIDData extends GUnTrackEntityByEntityIDData {
  @override
  final String G__typename;
  @override
  final bool appUnTrackEntityByEntityID;

  factory _$GUnTrackEntityByEntityIDData(
          [void Function(GUnTrackEntityByEntityIDDataBuilder)? updates]) =>
      (new GUnTrackEntityByEntityIDDataBuilder()..update(updates)).build();

  _$GUnTrackEntityByEntityIDData._(
      {required this.G__typename, required this.appUnTrackEntityByEntityID})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GUnTrackEntityByEntityIDData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(appUnTrackEntityByEntityID,
        'GUnTrackEntityByEntityIDData', 'appUnTrackEntityByEntityID');
  }

  @override
  GUnTrackEntityByEntityIDData rebuild(
          void Function(GUnTrackEntityByEntityIDDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUnTrackEntityByEntityIDDataBuilder toBuilder() =>
      new GUnTrackEntityByEntityIDDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUnTrackEntityByEntityIDData &&
        G__typename == other.G__typename &&
        appUnTrackEntityByEntityID == other.appUnTrackEntityByEntityID;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, G__typename.hashCode), appUnTrackEntityByEntityID.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUnTrackEntityByEntityIDData')
          ..add('G__typename', G__typename)
          ..add('appUnTrackEntityByEntityID', appUnTrackEntityByEntityID))
        .toString();
  }
}

class GUnTrackEntityByEntityIDDataBuilder
    implements
        Builder<GUnTrackEntityByEntityIDData,
            GUnTrackEntityByEntityIDDataBuilder> {
  _$GUnTrackEntityByEntityIDData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _appUnTrackEntityByEntityID;
  bool? get appUnTrackEntityByEntityID => _$this._appUnTrackEntityByEntityID;
  set appUnTrackEntityByEntityID(bool? appUnTrackEntityByEntityID) =>
      _$this._appUnTrackEntityByEntityID = appUnTrackEntityByEntityID;

  GUnTrackEntityByEntityIDDataBuilder() {
    GUnTrackEntityByEntityIDData._initializeBuilder(this);
  }

  GUnTrackEntityByEntityIDDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _appUnTrackEntityByEntityID = $v.appUnTrackEntityByEntityID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUnTrackEntityByEntityIDData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUnTrackEntityByEntityIDData;
  }

  @override
  void update(void Function(GUnTrackEntityByEntityIDDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUnTrackEntityByEntityIDData build() {
    final _$result = _$v ??
        new _$GUnTrackEntityByEntityIDData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GUnTrackEntityByEntityIDData', 'G__typename'),
            appUnTrackEntityByEntityID: BuiltValueNullFieldError.checkNotNull(
                appUnTrackEntityByEntityID,
                'GUnTrackEntityByEntityIDData',
                'appUnTrackEntityByEntityID'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
