// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GEntityFieldsData> _$gEntityFieldsDataSerializer =
    new _$GEntityFieldsDataSerializer();

class _$GEntityFieldsDataSerializer
    implements StructuredSerializer<GEntityFieldsData> {
  @override
  final Iterable<Type> types = const [GEntityFieldsData, _$GEntityFieldsData];
  @override
  final String wireName = 'GEntityFieldsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GEntityFieldsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'entityType',
      serializers.serialize(object.entityType,
          specifiedType: const FullType(_i1.GEntityType)),
      'entityName',
      serializers.serialize(object.entityName,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.entityId;
    if (value != null) {
      result
        ..add('entityId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.portraitURL;
    if (value != null) {
      result
        ..add('portraitURL')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GEntityFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GEntityFieldsDataBuilder();

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
        case 'entityId':
          result.entityId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'entityType':
          result.entityType = serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GEntityType))
              as _i1.GEntityType;
          break;
        case 'entityName':
          result.entityName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'portraitURL':
          result.portraitURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GEntityFieldsData extends GEntityFieldsData {
  @override
  final String G__typename;
  @override
  final String? entityId;
  @override
  final _i1.GEntityType entityType;
  @override
  final String entityName;
  @override
  final String? portraitURL;

  factory _$GEntityFieldsData(
          [void Function(GEntityFieldsDataBuilder)? updates]) =>
      (new GEntityFieldsDataBuilder()..update(updates)).build();

  _$GEntityFieldsData._(
      {required this.G__typename,
      this.entityId,
      required this.entityType,
      required this.entityName,
      this.portraitURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GEntityFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        entityType, 'GEntityFieldsData', 'entityType');
    BuiltValueNullFieldError.checkNotNull(
        entityName, 'GEntityFieldsData', 'entityName');
  }

  @override
  GEntityFieldsData rebuild(void Function(GEntityFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GEntityFieldsDataBuilder toBuilder() =>
      new GEntityFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GEntityFieldsData &&
        G__typename == other.G__typename &&
        entityId == other.entityId &&
        entityType == other.entityType &&
        entityName == other.entityName &&
        portraitURL == other.portraitURL;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, G__typename.hashCode), entityId.hashCode),
                entityType.hashCode),
            entityName.hashCode),
        portraitURL.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GEntityFieldsData')
          ..add('G__typename', G__typename)
          ..add('entityId', entityId)
          ..add('entityType', entityType)
          ..add('entityName', entityName)
          ..add('portraitURL', portraitURL))
        .toString();
  }
}

class GEntityFieldsDataBuilder
    implements Builder<GEntityFieldsData, GEntityFieldsDataBuilder> {
  _$GEntityFieldsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _entityId;
  String? get entityId => _$this._entityId;
  set entityId(String? entityId) => _$this._entityId = entityId;

  _i1.GEntityType? _entityType;
  _i1.GEntityType? get entityType => _$this._entityType;
  set entityType(_i1.GEntityType? entityType) =>
      _$this._entityType = entityType;

  String? _entityName;
  String? get entityName => _$this._entityName;
  set entityName(String? entityName) => _$this._entityName = entityName;

  String? _portraitURL;
  String? get portraitURL => _$this._portraitURL;
  set portraitURL(String? portraitURL) => _$this._portraitURL = portraitURL;

  GEntityFieldsDataBuilder() {
    GEntityFieldsData._initializeBuilder(this);
  }

  GEntityFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _entityId = $v.entityId;
      _entityType = $v.entityType;
      _entityName = $v.entityName;
      _portraitURL = $v.portraitURL;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GEntityFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GEntityFieldsData;
  }

  @override
  void update(void Function(GEntityFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GEntityFieldsData build() {
    final _$result = _$v ??
        new _$GEntityFieldsData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GEntityFieldsData', 'G__typename'),
            entityId: entityId,
            entityType: BuiltValueNullFieldError.checkNotNull(
                entityType, 'GEntityFieldsData', 'entityType'),
            entityName: BuiltValueNullFieldError.checkNotNull(
                entityName, 'GEntityFieldsData', 'entityName'),
            portraitURL: portraitURL);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
