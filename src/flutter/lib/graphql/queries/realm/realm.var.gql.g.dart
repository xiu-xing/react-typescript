// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAppRealmVars> _$gAppRealmVarsSerializer =
    new _$GAppRealmVarsSerializer();
Serializer<GAppRealmSearchResultVars> _$gAppRealmSearchResultVarsSerializer =
    new _$GAppRealmSearchResultVarsSerializer();

class _$GAppRealmVarsSerializer implements StructuredSerializer<GAppRealmVars> {
  @override
  final Iterable<Type> types = const [GAppRealmVars, _$GAppRealmVars];
  @override
  final String wireName = 'GAppRealmVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GAppRealmVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GAppRealmVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GAppRealmVarsBuilder().build();
  }
}

class _$GAppRealmSearchResultVarsSerializer
    implements StructuredSerializer<GAppRealmSearchResultVars> {
  @override
  final Iterable<Type> types = const [
    GAppRealmSearchResultVars,
    _$GAppRealmSearchResultVars
  ];
  @override
  final String wireName = 'GAppRealmSearchResultVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAppRealmSearchResultVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'realmID',
      serializers.serialize(object.realmID,
          specifiedType: const FullType(String)),
      'conditions',
      serializers.serialize(object.conditions,
          specifiedType: const FullType(BuiltList,
              const [const FullType(_i2.GNextSearchConditionInput)])),
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
    value = object.orderColumns;
    if (value != null) {
      result
        ..add('orderColumns')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(_i2.GOrderColumn)])));
    }
    return result;
  }

  @override
  GAppRealmSearchResultVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAppRealmSearchResultVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'realmID':
          result.realmID = serializers.deserialize(value,
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
        case 'conditions':
          result.conditions.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(_i2.GNextSearchConditionInput)
              ]))! as BuiltList<Object?>);
          break;
        case 'orderColumns':
          result.orderColumns.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(_i2.GOrderColumn)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GAppRealmVars extends GAppRealmVars {
  factory _$GAppRealmVars([void Function(GAppRealmVarsBuilder)? updates]) =>
      (new GAppRealmVarsBuilder()..update(updates)).build();

  _$GAppRealmVars._() : super._();

  @override
  GAppRealmVars rebuild(void Function(GAppRealmVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAppRealmVarsBuilder toBuilder() => new GAppRealmVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAppRealmVars;
  }

  @override
  int get hashCode {
    return 404936721;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GAppRealmVars').toString();
  }
}

class GAppRealmVarsBuilder
    implements Builder<GAppRealmVars, GAppRealmVarsBuilder> {
  _$GAppRealmVars? _$v;

  GAppRealmVarsBuilder();

  @override
  void replace(GAppRealmVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAppRealmVars;
  }

  @override
  void update(void Function(GAppRealmVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAppRealmVars build() {
    final _$result = _$v ?? new _$GAppRealmVars._();
    replace(_$result);
    return _$result;
  }
}

class _$GAppRealmSearchResultVars extends GAppRealmSearchResultVars {
  @override
  final String realmID;
  @override
  final int? first;
  @override
  final String? after;
  @override
  final int? last;
  @override
  final String? before;
  @override
  final BuiltList<_i2.GNextSearchConditionInput> conditions;
  @override
  final BuiltList<_i2.GOrderColumn>? orderColumns;

  factory _$GAppRealmSearchResultVars(
          [void Function(GAppRealmSearchResultVarsBuilder)? updates]) =>
      (new GAppRealmSearchResultVarsBuilder()..update(updates)).build();

  _$GAppRealmSearchResultVars._(
      {required this.realmID,
      this.first,
      this.after,
      this.last,
      this.before,
      required this.conditions,
      this.orderColumns})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        realmID, 'GAppRealmSearchResultVars', 'realmID');
    BuiltValueNullFieldError.checkNotNull(
        conditions, 'GAppRealmSearchResultVars', 'conditions');
  }

  @override
  GAppRealmSearchResultVars rebuild(
          void Function(GAppRealmSearchResultVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAppRealmSearchResultVarsBuilder toBuilder() =>
      new GAppRealmSearchResultVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAppRealmSearchResultVars &&
        realmID == other.realmID &&
        first == other.first &&
        after == other.after &&
        last == other.last &&
        before == other.before &&
        conditions == other.conditions &&
        orderColumns == other.orderColumns;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, realmID.hashCode), first.hashCode),
                        after.hashCode),
                    last.hashCode),
                before.hashCode),
            conditions.hashCode),
        orderColumns.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GAppRealmSearchResultVars')
          ..add('realmID', realmID)
          ..add('first', first)
          ..add('after', after)
          ..add('last', last)
          ..add('before', before)
          ..add('conditions', conditions)
          ..add('orderColumns', orderColumns))
        .toString();
  }
}

class GAppRealmSearchResultVarsBuilder
    implements
        Builder<GAppRealmSearchResultVars, GAppRealmSearchResultVarsBuilder> {
  _$GAppRealmSearchResultVars? _$v;

  String? _realmID;
  String? get realmID => _$this._realmID;
  set realmID(String? realmID) => _$this._realmID = realmID;

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

  ListBuilder<_i2.GNextSearchConditionInput>? _conditions;
  ListBuilder<_i2.GNextSearchConditionInput> get conditions =>
      _$this._conditions ??= new ListBuilder<_i2.GNextSearchConditionInput>();
  set conditions(ListBuilder<_i2.GNextSearchConditionInput>? conditions) =>
      _$this._conditions = conditions;

  ListBuilder<_i2.GOrderColumn>? _orderColumns;
  ListBuilder<_i2.GOrderColumn> get orderColumns =>
      _$this._orderColumns ??= new ListBuilder<_i2.GOrderColumn>();
  set orderColumns(ListBuilder<_i2.GOrderColumn>? orderColumns) =>
      _$this._orderColumns = orderColumns;

  GAppRealmSearchResultVarsBuilder();

  GAppRealmSearchResultVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _realmID = $v.realmID;
      _first = $v.first;
      _after = $v.after;
      _last = $v.last;
      _before = $v.before;
      _conditions = $v.conditions.toBuilder();
      _orderColumns = $v.orderColumns?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAppRealmSearchResultVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAppRealmSearchResultVars;
  }

  @override
  void update(void Function(GAppRealmSearchResultVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAppRealmSearchResultVars build() {
    _$GAppRealmSearchResultVars _$result;
    try {
      _$result = _$v ??
          new _$GAppRealmSearchResultVars._(
              realmID: BuiltValueNullFieldError.checkNotNull(
                  realmID, 'GAppRealmSearchResultVars', 'realmID'),
              first: first,
              after: after,
              last: last,
              before: before,
              conditions: conditions.build(),
              orderColumns: _orderColumns?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'conditions';
        conditions.build();
        _$failedField = 'orderColumns';
        _orderColumns?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GAppRealmSearchResultVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
