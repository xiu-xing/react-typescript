// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'research.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GArticleDetailVars> _$gArticleDetailVarsSerializer =
    new _$GArticleDetailVarsSerializer();
Serializer<GArticleUriVars> _$gArticleUriVarsSerializer =
    new _$GArticleUriVarsSerializer();
Serializer<GArticleListVars> _$gArticleListVarsSerializer =
    new _$GArticleListVarsSerializer();
Serializer<GArticleTabsVars> _$gArticleTabsVarsSerializer =
    new _$GArticleTabsVarsSerializer();

class _$GArticleDetailVarsSerializer
    implements StructuredSerializer<GArticleDetailVars> {
  @override
  final Iterable<Type> types = const [GArticleDetailVars, _$GArticleDetailVars];
  @override
  final String wireName = 'GArticleDetailVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GArticleDetailVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'articleModuleID',
      serializers.serialize(object.articleModuleID,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GArticleDetailVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GArticleDetailVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'articleModuleID':
          result.articleModuleID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GArticleUriVarsSerializer
    implements StructuredSerializer<GArticleUriVars> {
  @override
  final Iterable<Type> types = const [GArticleUriVars, _$GArticleUriVars];
  @override
  final String wireName = 'GArticleUriVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GArticleUriVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'articleType',
      serializers.serialize(object.articleType,
          specifiedType: const FullType(_i2.GArticleType)),
      'articleModuleID',
      serializers.serialize(object.articleModuleID,
          specifiedType: const FullType(String)),
      'fetchType',
      serializers.serialize(object.fetchType,
          specifiedType: const FullType(_i2.GFetchType)),
    ];

    return result;
  }

  @override
  GArticleUriVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GArticleUriVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'articleType':
          result.articleType = serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GArticleType))
              as _i2.GArticleType;
          break;
        case 'articleModuleID':
          result.articleModuleID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'fetchType':
          result.fetchType = serializers.deserialize(value,
              specifiedType: const FullType(_i2.GFetchType)) as _i2.GFetchType;
          break;
      }
    }

    return result.build();
  }
}

class _$GArticleListVarsSerializer
    implements StructuredSerializer<GArticleListVars> {
  @override
  final Iterable<Type> types = const [GArticleListVars, _$GArticleListVars];
  @override
  final String wireName = 'GArticleListVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GArticleListVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'articleListID',
      serializers.serialize(object.articleListID,
          specifiedType: const FullType(String)),
      'articleModuleID',
      serializers.serialize(object.articleModuleID,
          specifiedType: const FullType(String)),
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
    value = object.last;
    if (value != null) {
      result
        ..add('last')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.before;
    if (value != null) {
      result
        ..add('before')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.filters;
    if (value != null) {
      result
        ..add('filters')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i2.GFilterInputs)));
    }
    return result;
  }

  @override
  GArticleListVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GArticleListVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'articleListID':
          result.articleListID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'first':
          result.first = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'after':
          result.after = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'last':
          result.last = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'before':
          result.before = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'filters':
          result.filters.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GFilterInputs))!
              as _i2.GFilterInputs);
          break;
        case 'articleModuleID':
          result.articleModuleID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GArticleTabsVarsSerializer
    implements StructuredSerializer<GArticleTabsVars> {
  @override
  final Iterable<Type> types = const [GArticleTabsVars, _$GArticleTabsVars];
  @override
  final String wireName = 'GArticleTabsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GArticleTabsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'articleModuleID',
      serializers.serialize(object.articleModuleID,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GArticleTabsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GArticleTabsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'articleModuleID':
          result.articleModuleID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GArticleDetailVars extends GArticleDetailVars {
  @override
  final String id;
  @override
  final String articleModuleID;

  factory _$GArticleDetailVars(
          [void Function(GArticleDetailVarsBuilder)? updates]) =>
      (new GArticleDetailVarsBuilder()..update(updates)).build();

  _$GArticleDetailVars._({required this.id, required this.articleModuleID})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'GArticleDetailVars', 'id');
    BuiltValueNullFieldError.checkNotNull(
        articleModuleID, 'GArticleDetailVars', 'articleModuleID');
  }

  @override
  GArticleDetailVars rebuild(
          void Function(GArticleDetailVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GArticleDetailVarsBuilder toBuilder() =>
      new GArticleDetailVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GArticleDetailVars &&
        id == other.id &&
        articleModuleID == other.articleModuleID;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), articleModuleID.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GArticleDetailVars')
          ..add('id', id)
          ..add('articleModuleID', articleModuleID))
        .toString();
  }
}

class GArticleDetailVarsBuilder
    implements Builder<GArticleDetailVars, GArticleDetailVarsBuilder> {
  _$GArticleDetailVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _articleModuleID;
  String? get articleModuleID => _$this._articleModuleID;
  set articleModuleID(String? articleModuleID) =>
      _$this._articleModuleID = articleModuleID;

  GArticleDetailVarsBuilder();

  GArticleDetailVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _articleModuleID = $v.articleModuleID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GArticleDetailVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GArticleDetailVars;
  }

  @override
  void update(void Function(GArticleDetailVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GArticleDetailVars build() {
    final _$result = _$v ??
        new _$GArticleDetailVars._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, 'GArticleDetailVars', 'id'),
            articleModuleID: BuiltValueNullFieldError.checkNotNull(
                articleModuleID, 'GArticleDetailVars', 'articleModuleID'));
    replace(_$result);
    return _$result;
  }
}

class _$GArticleUriVars extends GArticleUriVars {
  @override
  final String id;
  @override
  final _i2.GArticleType articleType;
  @override
  final String articleModuleID;
  @override
  final _i2.GFetchType fetchType;

  factory _$GArticleUriVars([void Function(GArticleUriVarsBuilder)? updates]) =>
      (new GArticleUriVarsBuilder()..update(updates)).build();

  _$GArticleUriVars._(
      {required this.id,
      required this.articleType,
      required this.articleModuleID,
      required this.fetchType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'GArticleUriVars', 'id');
    BuiltValueNullFieldError.checkNotNull(
        articleType, 'GArticleUriVars', 'articleType');
    BuiltValueNullFieldError.checkNotNull(
        articleModuleID, 'GArticleUriVars', 'articleModuleID');
    BuiltValueNullFieldError.checkNotNull(
        fetchType, 'GArticleUriVars', 'fetchType');
  }

  @override
  GArticleUriVars rebuild(void Function(GArticleUriVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GArticleUriVarsBuilder toBuilder() =>
      new GArticleUriVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GArticleUriVars &&
        id == other.id &&
        articleType == other.articleType &&
        articleModuleID == other.articleModuleID &&
        fetchType == other.fetchType;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), articleType.hashCode),
            articleModuleID.hashCode),
        fetchType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GArticleUriVars')
          ..add('id', id)
          ..add('articleType', articleType)
          ..add('articleModuleID', articleModuleID)
          ..add('fetchType', fetchType))
        .toString();
  }
}

class GArticleUriVarsBuilder
    implements Builder<GArticleUriVars, GArticleUriVarsBuilder> {
  _$GArticleUriVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  _i2.GArticleType? _articleType;
  _i2.GArticleType? get articleType => _$this._articleType;
  set articleType(_i2.GArticleType? articleType) =>
      _$this._articleType = articleType;

  String? _articleModuleID;
  String? get articleModuleID => _$this._articleModuleID;
  set articleModuleID(String? articleModuleID) =>
      _$this._articleModuleID = articleModuleID;

  _i2.GFetchType? _fetchType;
  _i2.GFetchType? get fetchType => _$this._fetchType;
  set fetchType(_i2.GFetchType? fetchType) => _$this._fetchType = fetchType;

  GArticleUriVarsBuilder();

  GArticleUriVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _articleType = $v.articleType;
      _articleModuleID = $v.articleModuleID;
      _fetchType = $v.fetchType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GArticleUriVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GArticleUriVars;
  }

  @override
  void update(void Function(GArticleUriVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GArticleUriVars build() {
    final _$result = _$v ??
        new _$GArticleUriVars._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, 'GArticleUriVars', 'id'),
            articleType: BuiltValueNullFieldError.checkNotNull(
                articleType, 'GArticleUriVars', 'articleType'),
            articleModuleID: BuiltValueNullFieldError.checkNotNull(
                articleModuleID, 'GArticleUriVars', 'articleModuleID'),
            fetchType: BuiltValueNullFieldError.checkNotNull(
                fetchType, 'GArticleUriVars', 'fetchType'));
    replace(_$result);
    return _$result;
  }
}

class _$GArticleListVars extends GArticleListVars {
  @override
  final String articleListID;
  @override
  final int? first;
  @override
  final String? after;
  @override
  final int? last;
  @override
  final String? before;
  @override
  final _i2.GFilterInputs? filters;
  @override
  final String articleModuleID;

  factory _$GArticleListVars(
          [void Function(GArticleListVarsBuilder)? updates]) =>
      (new GArticleListVarsBuilder()..update(updates)).build();

  _$GArticleListVars._(
      {required this.articleListID,
      this.first,
      this.after,
      this.last,
      this.before,
      this.filters,
      required this.articleModuleID})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        articleListID, 'GArticleListVars', 'articleListID');
    BuiltValueNullFieldError.checkNotNull(
        articleModuleID, 'GArticleListVars', 'articleModuleID');
  }

  @override
  GArticleListVars rebuild(void Function(GArticleListVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GArticleListVarsBuilder toBuilder() =>
      new GArticleListVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GArticleListVars &&
        articleListID == other.articleListID &&
        first == other.first &&
        after == other.after &&
        last == other.last &&
        before == other.before &&
        filters == other.filters &&
        articleModuleID == other.articleModuleID;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, articleListID.hashCode), first.hashCode),
                        after.hashCode),
                    last.hashCode),
                before.hashCode),
            filters.hashCode),
        articleModuleID.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GArticleListVars')
          ..add('articleListID', articleListID)
          ..add('first', first)
          ..add('after', after)
          ..add('last', last)
          ..add('before', before)
          ..add('filters', filters)
          ..add('articleModuleID', articleModuleID))
        .toString();
  }
}

class GArticleListVarsBuilder
    implements Builder<GArticleListVars, GArticleListVarsBuilder> {
  _$GArticleListVars? _$v;

  String? _articleListID;
  String? get articleListID => _$this._articleListID;
  set articleListID(String? articleListID) =>
      _$this._articleListID = articleListID;

  int? _first;
  int? get first => _$this._first;
  set first(int? first) => _$this._first = first;

  String? _after;
  String? get after => _$this._after;
  set after(String? after) => _$this._after = after;

  int? _last;
  int? get last => _$this._last;
  set last(int? last) => _$this._last = last;

  String? _before;
  String? get before => _$this._before;
  set before(String? before) => _$this._before = before;

  _i2.GFilterInputsBuilder? _filters;
  _i2.GFilterInputsBuilder get filters =>
      _$this._filters ??= new _i2.GFilterInputsBuilder();
  set filters(_i2.GFilterInputsBuilder? filters) => _$this._filters = filters;

  String? _articleModuleID;
  String? get articleModuleID => _$this._articleModuleID;
  set articleModuleID(String? articleModuleID) =>
      _$this._articleModuleID = articleModuleID;

  GArticleListVarsBuilder();

  GArticleListVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _articleListID = $v.articleListID;
      _first = $v.first;
      _after = $v.after;
      _last = $v.last;
      _before = $v.before;
      _filters = $v.filters?.toBuilder();
      _articleModuleID = $v.articleModuleID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GArticleListVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GArticleListVars;
  }

  @override
  void update(void Function(GArticleListVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GArticleListVars build() {
    _$GArticleListVars _$result;
    try {
      _$result = _$v ??
          new _$GArticleListVars._(
              articleListID: BuiltValueNullFieldError.checkNotNull(
                  articleListID, 'GArticleListVars', 'articleListID'),
              first: first,
              after: after,
              last: last,
              before: before,
              filters: _filters?.build(),
              articleModuleID: BuiltValueNullFieldError.checkNotNull(
                  articleModuleID, 'GArticleListVars', 'articleModuleID'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'filters';
        _filters?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GArticleListVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GArticleTabsVars extends GArticleTabsVars {
  @override
  final String articleModuleID;

  factory _$GArticleTabsVars(
          [void Function(GArticleTabsVarsBuilder)? updates]) =>
      (new GArticleTabsVarsBuilder()..update(updates)).build();

  _$GArticleTabsVars._({required this.articleModuleID}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        articleModuleID, 'GArticleTabsVars', 'articleModuleID');
  }

  @override
  GArticleTabsVars rebuild(void Function(GArticleTabsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GArticleTabsVarsBuilder toBuilder() =>
      new GArticleTabsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GArticleTabsVars &&
        articleModuleID == other.articleModuleID;
  }

  @override
  int get hashCode {
    return $jf($jc(0, articleModuleID.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GArticleTabsVars')
          ..add('articleModuleID', articleModuleID))
        .toString();
  }
}

class GArticleTabsVarsBuilder
    implements Builder<GArticleTabsVars, GArticleTabsVarsBuilder> {
  _$GArticleTabsVars? _$v;

  String? _articleModuleID;
  String? get articleModuleID => _$this._articleModuleID;
  set articleModuleID(String? articleModuleID) =>
      _$this._articleModuleID = articleModuleID;

  GArticleTabsVarsBuilder();

  GArticleTabsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _articleModuleID = $v.articleModuleID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GArticleTabsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GArticleTabsVars;
  }

  @override
  void update(void Function(GArticleTabsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GArticleTabsVars build() {
    final _$result = _$v ??
        new _$GArticleTabsVars._(
            articleModuleID: BuiltValueNullFieldError.checkNotNull(
                articleModuleID, 'GArticleTabsVars', 'articleModuleID'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
