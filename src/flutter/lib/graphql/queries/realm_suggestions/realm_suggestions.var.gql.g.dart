// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm_suggestions.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GRealmSuggestionsVars> _$gRealmSuggestionsVarsSerializer =
    new _$GRealmSuggestionsVarsSerializer();

class _$GRealmSuggestionsVarsSerializer
    implements StructuredSerializer<GRealmSuggestionsVars> {
  @override
  final Iterable<Type> types = const [
    GRealmSuggestionsVars,
    _$GRealmSuggestionsVars
  ];
  @override
  final String wireName = 'GRealmSuggestionsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GRealmSuggestionsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'suggestionId',
      serializers.serialize(object.suggestionId,
          specifiedType: const FullType(String)),
      'query',
      serializers.serialize(object.query,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.first;
    if (value != null) {
      result
        ..add('first')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.last;
    if (value != null) {
      result
        ..add('last')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.after;
    if (value != null) {
      result
        ..add('after')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.before;
    if (value != null) {
      result
        ..add('before')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GRealmSuggestionsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GRealmSuggestionsVarsBuilder();

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
        case 'last':
          result.last = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'after':
          result.after = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'before':
          result.before = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'suggestionId':
          result.suggestionId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'query':
          result.query = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GRealmSuggestionsVars extends GRealmSuggestionsVars {
  @override
  final int? first;
  @override
  final int? last;
  @override
  final String? after;
  @override
  final String? before;
  @override
  final String suggestionId;
  @override
  final String query;

  factory _$GRealmSuggestionsVars(
          [void Function(GRealmSuggestionsVarsBuilder)? updates]) =>
      (new GRealmSuggestionsVarsBuilder()..update(updates)).build();

  _$GRealmSuggestionsVars._(
      {this.first,
      this.last,
      this.after,
      this.before,
      required this.suggestionId,
      required this.query})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        suggestionId, 'GRealmSuggestionsVars', 'suggestionId');
    BuiltValueNullFieldError.checkNotNull(
        query, 'GRealmSuggestionsVars', 'query');
  }

  @override
  GRealmSuggestionsVars rebuild(
          void Function(GRealmSuggestionsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GRealmSuggestionsVarsBuilder toBuilder() =>
      new GRealmSuggestionsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GRealmSuggestionsVars &&
        first == other.first &&
        last == other.last &&
        after == other.after &&
        before == other.before &&
        suggestionId == other.suggestionId &&
        query == other.query;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, first.hashCode), last.hashCode), after.hashCode),
                before.hashCode),
            suggestionId.hashCode),
        query.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GRealmSuggestionsVars')
          ..add('first', first)
          ..add('last', last)
          ..add('after', after)
          ..add('before', before)
          ..add('suggestionId', suggestionId)
          ..add('query', query))
        .toString();
  }
}

class GRealmSuggestionsVarsBuilder
    implements Builder<GRealmSuggestionsVars, GRealmSuggestionsVarsBuilder> {
  _$GRealmSuggestionsVars? _$v;

  int? _first;
  int? get first => _$this._first;
  set first(int? first) => _$this._first = first;

  int? _last;
  int? get last => _$this._last;
  set last(int? last) => _$this._last = last;

  String? _after;
  String? get after => _$this._after;
  set after(String? after) => _$this._after = after;

  String? _before;
  String? get before => _$this._before;
  set before(String? before) => _$this._before = before;

  String? _suggestionId;
  String? get suggestionId => _$this._suggestionId;
  set suggestionId(String? suggestionId) => _$this._suggestionId = suggestionId;

  String? _query;
  String? get query => _$this._query;
  set query(String? query) => _$this._query = query;

  GRealmSuggestionsVarsBuilder();

  GRealmSuggestionsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _first = $v.first;
      _last = $v.last;
      _after = $v.after;
      _before = $v.before;
      _suggestionId = $v.suggestionId;
      _query = $v.query;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GRealmSuggestionsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GRealmSuggestionsVars;
  }

  @override
  void update(void Function(GRealmSuggestionsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GRealmSuggestionsVars build() {
    final _$result = _$v ??
        new _$GRealmSuggestionsVars._(
            first: first,
            last: last,
            after: after,
            before: before,
            suggestionId: BuiltValueNullFieldError.checkNotNull(
                suggestionId, 'GRealmSuggestionsVars', 'suggestionId'),
            query: BuiltValueNullFieldError.checkNotNull(
                query, 'GRealmSuggestionsVars', 'query'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
