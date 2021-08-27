// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_list.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GNewsListVars> _$gNewsListVarsSerializer =
    new _$GNewsListVarsSerializer();

class _$GNewsListVarsSerializer implements StructuredSerializer<GNewsListVars> {
  @override
  final Iterable<Type> types = const [GNewsListVars, _$GNewsListVars];
  @override
  final String wireName = 'GNewsListVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GNewsListVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'entities',
      serializers.serialize(object.entities,
          specifiedType: const FullType(
              BuiltList, const [const FullType(_i1.GEntityInput)])),
    ];
    Object? value;
    value = object.first;
    if (value != null) {
      result
        ..add('first')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.after;
    if (value != null) {
      result
        ..add('after')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.keywords;
    if (value != null) {
      result
        ..add('keywords')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.startTime;
    if (value != null) {
      result
        ..add('startTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.endTime;
    if (value != null) {
      result
        ..add('endTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GNewsListVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GNewsListVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'first':
          result.first = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'after':
          result.after = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'keywords':
          result.keywords.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'entities':
          result.entities.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(_i1.GEntityInput)]))!
              as BuiltList<Object?>);
          break;
        case 'startTime':
          result.startTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'endTime':
          result.endTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GNewsListVars extends GNewsListVars {
  @override
  final int? first;
  @override
  final String? after;
  @override
  final BuiltList<String>? keywords;
  @override
  final BuiltList<_i1.GEntityInput> entities;
  @override
  final String? startTime;
  @override
  final String? endTime;

  factory _$GNewsListVars([void Function(GNewsListVarsBuilder)? updates]) =>
      (new GNewsListVarsBuilder()..update(updates)).build();

  _$GNewsListVars._(
      {this.first,
      this.after,
      this.keywords,
      required this.entities,
      this.startTime,
      this.endTime})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        entities, 'GNewsListVars', 'entities');
  }

  @override
  GNewsListVars rebuild(void Function(GNewsListVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GNewsListVarsBuilder toBuilder() => new GNewsListVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GNewsListVars &&
        first == other.first &&
        after == other.after &&
        keywords == other.keywords &&
        entities == other.entities &&
        startTime == other.startTime &&
        endTime == other.endTime;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, first.hashCode), after.hashCode),
                    keywords.hashCode),
                entities.hashCode),
            startTime.hashCode),
        endTime.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GNewsListVars')
          ..add('first', first)
          ..add('after', after)
          ..add('keywords', keywords)
          ..add('entities', entities)
          ..add('startTime', startTime)
          ..add('endTime', endTime))
        .toString();
  }
}

class GNewsListVarsBuilder
    implements Builder<GNewsListVars, GNewsListVarsBuilder> {
  _$GNewsListVars? _$v;

  int? _first;
  int? get first => _$this._first;
  set first(int? first) => _$this._first = first;

  String? _after;
  String? get after => _$this._after;
  set after(String? after) => _$this._after = after;

  ListBuilder<String>? _keywords;
  ListBuilder<String> get keywords =>
      _$this._keywords ??= new ListBuilder<String>();
  set keywords(ListBuilder<String>? keywords) => _$this._keywords = keywords;

  ListBuilder<_i1.GEntityInput>? _entities;
  ListBuilder<_i1.GEntityInput> get entities =>
      _$this._entities ??= new ListBuilder<_i1.GEntityInput>();
  set entities(ListBuilder<_i1.GEntityInput>? entities) =>
      _$this._entities = entities;

  String? _startTime;
  String? get startTime => _$this._startTime;
  set startTime(String? startTime) => _$this._startTime = startTime;

  String? _endTime;
  String? get endTime => _$this._endTime;
  set endTime(String? endTime) => _$this._endTime = endTime;

  GNewsListVarsBuilder();

  GNewsListVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _first = $v.first;
      _after = $v.after;
      _keywords = $v.keywords?.toBuilder();
      _entities = $v.entities.toBuilder();
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GNewsListVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GNewsListVars;
  }

  @override
  void update(void Function(GNewsListVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GNewsListVars build() {
    _$GNewsListVars _$result;
    try {
      _$result = _$v ??
          new _$GNewsListVars._(
              first: first,
              after: after,
              keywords: _keywords?.build(),
              entities: entities.build(),
              startTime: startTime,
              endTime: endTime);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'keywords';
        _keywords?.build();
        _$failedField = 'entities';
        entities.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GNewsListVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
