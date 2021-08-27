// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracker.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GTrackEntityVars> _$gTrackEntityVarsSerializer =
    new _$GTrackEntityVarsSerializer();
Serializer<GUnTrackEntityByEntityIDVars>
    _$gUnTrackEntityByEntityIDVarsSerializer =
    new _$GUnTrackEntityByEntityIDVarsSerializer();

class _$GTrackEntityVarsSerializer
    implements StructuredSerializer<GTrackEntityVars> {
  @override
  final Iterable<Type> types = const [GTrackEntityVars, _$GTrackEntityVars];
  @override
  final String wireName = 'GTrackEntityVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GTrackEntityVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'trackerTheme',
      serializers.serialize(object.trackerTheme,
          specifiedType: const FullType(_i1.GTrackerTheme)),
      'entities',
      serializers.serialize(object.entities,
          specifiedType: const FullType(
              BuiltList, const [const FullType(_i1.GEntityInput)])),
    ];

    return result;
  }

  @override
  GTrackEntityVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTrackEntityVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'trackerTheme':
          result.trackerTheme = serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GTrackerTheme))
              as _i1.GTrackerTheme;
          break;
        case 'entities':
          result.entities.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(_i1.GEntityInput)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GUnTrackEntityByEntityIDVarsSerializer
    implements StructuredSerializer<GUnTrackEntityByEntityIDVars> {
  @override
  final Iterable<Type> types = const [
    GUnTrackEntityByEntityIDVars,
    _$GUnTrackEntityByEntityIDVars
  ];
  @override
  final String wireName = 'GUnTrackEntityByEntityIDVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUnTrackEntityByEntityIDVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'entity',
      serializers.serialize(object.entity,
          specifiedType: const FullType(_i1.GEntityInput)),
    ];

    return result;
  }

  @override
  GUnTrackEntityByEntityIDVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUnTrackEntityByEntityIDVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'entity':
          result.entity.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GEntityInput))!
              as _i1.GEntityInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GTrackEntityVars extends GTrackEntityVars {
  @override
  final _i1.GTrackerTheme trackerTheme;
  @override
  final BuiltList<_i1.GEntityInput> entities;

  factory _$GTrackEntityVars(
          [void Function(GTrackEntityVarsBuilder)? updates]) =>
      (new GTrackEntityVarsBuilder()..update(updates)).build();

  _$GTrackEntityVars._({required this.trackerTheme, required this.entities})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        trackerTheme, 'GTrackEntityVars', 'trackerTheme');
    BuiltValueNullFieldError.checkNotNull(
        entities, 'GTrackEntityVars', 'entities');
  }

  @override
  GTrackEntityVars rebuild(void Function(GTrackEntityVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTrackEntityVarsBuilder toBuilder() =>
      new GTrackEntityVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTrackEntityVars &&
        trackerTheme == other.trackerTheme &&
        entities == other.entities;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, trackerTheme.hashCode), entities.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GTrackEntityVars')
          ..add('trackerTheme', trackerTheme)
          ..add('entities', entities))
        .toString();
  }
}

class GTrackEntityVarsBuilder
    implements Builder<GTrackEntityVars, GTrackEntityVarsBuilder> {
  _$GTrackEntityVars? _$v;

  _i1.GTrackerTheme? _trackerTheme;
  _i1.GTrackerTheme? get trackerTheme => _$this._trackerTheme;
  set trackerTheme(_i1.GTrackerTheme? trackerTheme) =>
      _$this._trackerTheme = trackerTheme;

  ListBuilder<_i1.GEntityInput>? _entities;
  ListBuilder<_i1.GEntityInput> get entities =>
      _$this._entities ??= new ListBuilder<_i1.GEntityInput>();
  set entities(ListBuilder<_i1.GEntityInput>? entities) =>
      _$this._entities = entities;

  GTrackEntityVarsBuilder();

  GTrackEntityVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _trackerTheme = $v.trackerTheme;
      _entities = $v.entities.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTrackEntityVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTrackEntityVars;
  }

  @override
  void update(void Function(GTrackEntityVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GTrackEntityVars build() {
    _$GTrackEntityVars _$result;
    try {
      _$result = _$v ??
          new _$GTrackEntityVars._(
              trackerTheme: BuiltValueNullFieldError.checkNotNull(
                  trackerTheme, 'GTrackEntityVars', 'trackerTheme'),
              entities: entities.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'entities';
        entities.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GTrackEntityVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUnTrackEntityByEntityIDVars extends GUnTrackEntityByEntityIDVars {
  @override
  final _i1.GEntityInput entity;

  factory _$GUnTrackEntityByEntityIDVars(
          [void Function(GUnTrackEntityByEntityIDVarsBuilder)? updates]) =>
      (new GUnTrackEntityByEntityIDVarsBuilder()..update(updates)).build();

  _$GUnTrackEntityByEntityIDVars._({required this.entity}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        entity, 'GUnTrackEntityByEntityIDVars', 'entity');
  }

  @override
  GUnTrackEntityByEntityIDVars rebuild(
          void Function(GUnTrackEntityByEntityIDVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUnTrackEntityByEntityIDVarsBuilder toBuilder() =>
      new GUnTrackEntityByEntityIDVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUnTrackEntityByEntityIDVars && entity == other.entity;
  }

  @override
  int get hashCode {
    return $jf($jc(0, entity.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUnTrackEntityByEntityIDVars')
          ..add('entity', entity))
        .toString();
  }
}

class GUnTrackEntityByEntityIDVarsBuilder
    implements
        Builder<GUnTrackEntityByEntityIDVars,
            GUnTrackEntityByEntityIDVarsBuilder> {
  _$GUnTrackEntityByEntityIDVars? _$v;

  _i1.GEntityInputBuilder? _entity;
  _i1.GEntityInputBuilder get entity =>
      _$this._entity ??= new _i1.GEntityInputBuilder();
  set entity(_i1.GEntityInputBuilder? entity) => _$this._entity = entity;

  GUnTrackEntityByEntityIDVarsBuilder();

  GUnTrackEntityByEntityIDVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _entity = $v.entity.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUnTrackEntityByEntityIDVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUnTrackEntityByEntityIDVars;
  }

  @override
  void update(void Function(GUnTrackEntityByEntityIDVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUnTrackEntityByEntityIDVars build() {
    _$GUnTrackEntityByEntityIDVars _$result;
    try {
      _$result =
          _$v ?? new _$GUnTrackEntityByEntityIDVars._(entity: entity.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'entity';
        entity.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GUnTrackEntityByEntityIDVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
