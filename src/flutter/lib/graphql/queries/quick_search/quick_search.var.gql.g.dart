// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quick_search.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GQuickSearchTrendingVars> _$gQuickSearchTrendingVarsSerializer =
    new _$GQuickSearchTrendingVarsSerializer();
Serializer<GQuickSearchLatestViewVars> _$gQuickSearchLatestViewVarsSerializer =
    new _$GQuickSearchLatestViewVarsSerializer();
Serializer<GQuickSearchTabsVars> _$gQuickSearchTabsVarsSerializer =
    new _$GQuickSearchTabsVarsSerializer();
Serializer<GQuickSearchVars> _$gQuickSearchVarsSerializer =
    new _$GQuickSearchVarsSerializer();
Serializer<GIncrementEntityClickThroughVars>
    _$gIncrementEntityClickThroughVarsSerializer =
    new _$GIncrementEntityClickThroughVarsSerializer();

class _$GQuickSearchTrendingVarsSerializer
    implements StructuredSerializer<GQuickSearchTrendingVars> {
  @override
  final Iterable<Type> types = const [
    GQuickSearchTrendingVars,
    _$GQuickSearchTrendingVars
  ];
  @override
  final String wireName = 'GQuickSearchTrendingVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GQuickSearchTrendingVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
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
  GQuickSearchTrendingVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQuickSearchTrendingVarsBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GQuickSearchLatestViewVarsSerializer
    implements StructuredSerializer<GQuickSearchLatestViewVars> {
  @override
  final Iterable<Type> types = const [
    GQuickSearchLatestViewVars,
    _$GQuickSearchLatestViewVars
  ];
  @override
  final String wireName = 'GQuickSearchLatestViewVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GQuickSearchLatestViewVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
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
  GQuickSearchLatestViewVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQuickSearchLatestViewVarsBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GQuickSearchTabsVarsSerializer
    implements StructuredSerializer<GQuickSearchTabsVars> {
  @override
  final Iterable<Type> types = const [
    GQuickSearchTabsVars,
    _$GQuickSearchTabsVars
  ];
  @override
  final String wireName = 'GQuickSearchTabsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GQuickSearchTabsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GQuickSearchTabsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GQuickSearchTabsVarsBuilder().build();
  }
}

class _$GQuickSearchVarsSerializer
    implements StructuredSerializer<GQuickSearchVars> {
  @override
  final Iterable<Type> types = const [GQuickSearchVars, _$GQuickSearchVars];
  @override
  final String wireName = 'GQuickSearchVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GQuickSearchVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'query',
      serializers.serialize(object.query,
          specifiedType: const FullType(String)),
      'searchType',
      serializers.serialize(object.searchType,
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
  GQuickSearchVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQuickSearchVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'query':
          result.query = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'searchType':
          result.searchType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
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
      }
    }

    return result.build();
  }
}

class _$GIncrementEntityClickThroughVarsSerializer
    implements StructuredSerializer<GIncrementEntityClickThroughVars> {
  @override
  final Iterable<Type> types = const [
    GIncrementEntityClickThroughVars,
    _$GIncrementEntityClickThroughVars
  ];
  @override
  final String wireName = 'GIncrementEntityClickThroughVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GIncrementEntityClickThroughVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'nodeId',
      serializers.serialize(object.nodeId,
          specifiedType: const FullType(String)),
      'searchType',
      serializers.serialize(object.searchType,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GIncrementEntityClickThroughVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GIncrementEntityClickThroughVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'nodeId':
          result.nodeId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'searchType':
          result.searchType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GQuickSearchTrendingVars extends GQuickSearchTrendingVars {
  @override
  final int? first;
  @override
  final int? last;
  @override
  final String? after;
  @override
  final String? before;

  factory _$GQuickSearchTrendingVars(
          [void Function(GQuickSearchTrendingVarsBuilder)? updates]) =>
      (new GQuickSearchTrendingVarsBuilder()..update(updates)).build();

  _$GQuickSearchTrendingVars._({this.first, this.last, this.after, this.before})
      : super._();

  @override
  GQuickSearchTrendingVars rebuild(
          void Function(GQuickSearchTrendingVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQuickSearchTrendingVarsBuilder toBuilder() =>
      new GQuickSearchTrendingVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQuickSearchTrendingVars &&
        first == other.first &&
        last == other.last &&
        after == other.after &&
        before == other.before;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, first.hashCode), last.hashCode), after.hashCode),
        before.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GQuickSearchTrendingVars')
          ..add('first', first)
          ..add('last', last)
          ..add('after', after)
          ..add('before', before))
        .toString();
  }
}

class GQuickSearchTrendingVarsBuilder
    implements
        Builder<GQuickSearchTrendingVars, GQuickSearchTrendingVarsBuilder> {
  _$GQuickSearchTrendingVars? _$v;

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

  GQuickSearchTrendingVarsBuilder();

  GQuickSearchTrendingVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _first = $v.first;
      _last = $v.last;
      _after = $v.after;
      _before = $v.before;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQuickSearchTrendingVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQuickSearchTrendingVars;
  }

  @override
  void update(void Function(GQuickSearchTrendingVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQuickSearchTrendingVars build() {
    final _$result = _$v ??
        new _$GQuickSearchTrendingVars._(
            first: first, last: last, after: after, before: before);
    replace(_$result);
    return _$result;
  }
}

class _$GQuickSearchLatestViewVars extends GQuickSearchLatestViewVars {
  @override
  final int? first;
  @override
  final int? last;
  @override
  final String? after;
  @override
  final String? before;

  factory _$GQuickSearchLatestViewVars(
          [void Function(GQuickSearchLatestViewVarsBuilder)? updates]) =>
      (new GQuickSearchLatestViewVarsBuilder()..update(updates)).build();

  _$GQuickSearchLatestViewVars._(
      {this.first, this.last, this.after, this.before})
      : super._();

  @override
  GQuickSearchLatestViewVars rebuild(
          void Function(GQuickSearchLatestViewVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQuickSearchLatestViewVarsBuilder toBuilder() =>
      new GQuickSearchLatestViewVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQuickSearchLatestViewVars &&
        first == other.first &&
        last == other.last &&
        after == other.after &&
        before == other.before;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, first.hashCode), last.hashCode), after.hashCode),
        before.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GQuickSearchLatestViewVars')
          ..add('first', first)
          ..add('last', last)
          ..add('after', after)
          ..add('before', before))
        .toString();
  }
}

class GQuickSearchLatestViewVarsBuilder
    implements
        Builder<GQuickSearchLatestViewVars, GQuickSearchLatestViewVarsBuilder> {
  _$GQuickSearchLatestViewVars? _$v;

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

  GQuickSearchLatestViewVarsBuilder();

  GQuickSearchLatestViewVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _first = $v.first;
      _last = $v.last;
      _after = $v.after;
      _before = $v.before;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQuickSearchLatestViewVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQuickSearchLatestViewVars;
  }

  @override
  void update(void Function(GQuickSearchLatestViewVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQuickSearchLatestViewVars build() {
    final _$result = _$v ??
        new _$GQuickSearchLatestViewVars._(
            first: first, last: last, after: after, before: before);
    replace(_$result);
    return _$result;
  }
}

class _$GQuickSearchTabsVars extends GQuickSearchTabsVars {
  factory _$GQuickSearchTabsVars(
          [void Function(GQuickSearchTabsVarsBuilder)? updates]) =>
      (new GQuickSearchTabsVarsBuilder()..update(updates)).build();

  _$GQuickSearchTabsVars._() : super._();

  @override
  GQuickSearchTabsVars rebuild(
          void Function(GQuickSearchTabsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQuickSearchTabsVarsBuilder toBuilder() =>
      new GQuickSearchTabsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQuickSearchTabsVars;
  }

  @override
  int get hashCode {
    return 13545802;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GQuickSearchTabsVars').toString();
  }
}

class GQuickSearchTabsVarsBuilder
    implements Builder<GQuickSearchTabsVars, GQuickSearchTabsVarsBuilder> {
  _$GQuickSearchTabsVars? _$v;

  GQuickSearchTabsVarsBuilder();

  @override
  void replace(GQuickSearchTabsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQuickSearchTabsVars;
  }

  @override
  void update(void Function(GQuickSearchTabsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQuickSearchTabsVars build() {
    final _$result = _$v ?? new _$GQuickSearchTabsVars._();
    replace(_$result);
    return _$result;
  }
}

class _$GQuickSearchVars extends GQuickSearchVars {
  @override
  final String query;
  @override
  final String searchType;
  @override
  final int? first;
  @override
  final int? last;
  @override
  final String? after;
  @override
  final String? before;

  factory _$GQuickSearchVars(
          [void Function(GQuickSearchVarsBuilder)? updates]) =>
      (new GQuickSearchVarsBuilder()..update(updates)).build();

  _$GQuickSearchVars._(
      {required this.query,
      required this.searchType,
      this.first,
      this.last,
      this.after,
      this.before})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(query, 'GQuickSearchVars', 'query');
    BuiltValueNullFieldError.checkNotNull(
        searchType, 'GQuickSearchVars', 'searchType');
  }

  @override
  GQuickSearchVars rebuild(void Function(GQuickSearchVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQuickSearchVarsBuilder toBuilder() =>
      new GQuickSearchVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQuickSearchVars &&
        query == other.query &&
        searchType == other.searchType &&
        first == other.first &&
        last == other.last &&
        after == other.after &&
        before == other.before;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, query.hashCode), searchType.hashCode),
                    first.hashCode),
                last.hashCode),
            after.hashCode),
        before.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GQuickSearchVars')
          ..add('query', query)
          ..add('searchType', searchType)
          ..add('first', first)
          ..add('last', last)
          ..add('after', after)
          ..add('before', before))
        .toString();
  }
}

class GQuickSearchVarsBuilder
    implements Builder<GQuickSearchVars, GQuickSearchVarsBuilder> {
  _$GQuickSearchVars? _$v;

  String? _query;
  String? get query => _$this._query;
  set query(String? query) => _$this._query = query;

  String? _searchType;
  String? get searchType => _$this._searchType;
  set searchType(String? searchType) => _$this._searchType = searchType;

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

  GQuickSearchVarsBuilder();

  GQuickSearchVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _query = $v.query;
      _searchType = $v.searchType;
      _first = $v.first;
      _last = $v.last;
      _after = $v.after;
      _before = $v.before;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQuickSearchVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQuickSearchVars;
  }

  @override
  void update(void Function(GQuickSearchVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQuickSearchVars build() {
    final _$result = _$v ??
        new _$GQuickSearchVars._(
            query: BuiltValueNullFieldError.checkNotNull(
                query, 'GQuickSearchVars', 'query'),
            searchType: BuiltValueNullFieldError.checkNotNull(
                searchType, 'GQuickSearchVars', 'searchType'),
            first: first,
            last: last,
            after: after,
            before: before);
    replace(_$result);
    return _$result;
  }
}

class _$GIncrementEntityClickThroughVars
    extends GIncrementEntityClickThroughVars {
  @override
  final String nodeId;
  @override
  final String searchType;

  factory _$GIncrementEntityClickThroughVars(
          [void Function(GIncrementEntityClickThroughVarsBuilder)? updates]) =>
      (new GIncrementEntityClickThroughVarsBuilder()..update(updates)).build();

  _$GIncrementEntityClickThroughVars._(
      {required this.nodeId, required this.searchType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        nodeId, 'GIncrementEntityClickThroughVars', 'nodeId');
    BuiltValueNullFieldError.checkNotNull(
        searchType, 'GIncrementEntityClickThroughVars', 'searchType');
  }

  @override
  GIncrementEntityClickThroughVars rebuild(
          void Function(GIncrementEntityClickThroughVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GIncrementEntityClickThroughVarsBuilder toBuilder() =>
      new GIncrementEntityClickThroughVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GIncrementEntityClickThroughVars &&
        nodeId == other.nodeId &&
        searchType == other.searchType;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, nodeId.hashCode), searchType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GIncrementEntityClickThroughVars')
          ..add('nodeId', nodeId)
          ..add('searchType', searchType))
        .toString();
  }
}

class GIncrementEntityClickThroughVarsBuilder
    implements
        Builder<GIncrementEntityClickThroughVars,
            GIncrementEntityClickThroughVarsBuilder> {
  _$GIncrementEntityClickThroughVars? _$v;

  String? _nodeId;
  String? get nodeId => _$this._nodeId;
  set nodeId(String? nodeId) => _$this._nodeId = nodeId;

  String? _searchType;
  String? get searchType => _$this._searchType;
  set searchType(String? searchType) => _$this._searchType = searchType;

  GIncrementEntityClickThroughVarsBuilder();

  GIncrementEntityClickThroughVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nodeId = $v.nodeId;
      _searchType = $v.searchType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GIncrementEntityClickThroughVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GIncrementEntityClickThroughVars;
  }

  @override
  void update(void Function(GIncrementEntityClickThroughVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GIncrementEntityClickThroughVars build() {
    final _$result = _$v ??
        new _$GIncrementEntityClickThroughVars._(
            nodeId: BuiltValueNullFieldError.checkNotNull(
                nodeId, 'GIncrementEntityClickThroughVars', 'nodeId'),
            searchType: BuiltValueNullFieldError.checkNotNull(
                searchType, 'GIncrementEntityClickThroughVars', 'searchType'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
