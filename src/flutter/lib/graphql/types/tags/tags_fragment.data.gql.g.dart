// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tags_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GTextTagFieldsData> _$gTextTagFieldsDataSerializer =
    new _$GTextTagFieldsDataSerializer();
Serializer<GTextTagFieldsData_action> _$gTextTagFieldsDataActionSerializer =
    new _$GTextTagFieldsData_actionSerializer();
Serializer<GRiskTagFieldsData> _$gRiskTagFieldsDataSerializer =
    new _$GRiskTagFieldsDataSerializer();
Serializer<GQuickSearchTagFieldsData> _$gQuickSearchTagFieldsDataSerializer =
    new _$GQuickSearchTagFieldsDataSerializer();

class _$GTextTagFieldsDataSerializer
    implements StructuredSerializer<GTextTagFieldsData> {
  @override
  final Iterable<Type> types = const [GTextTagFieldsData, _$GTextTagFieldsData];
  @override
  final String wireName = 'GTextTagFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GTextTagFieldsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.action;
    if (value != null) {
      result
        ..add('action')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GTextTagFieldsData_action)));
    }
    return result;
  }

  @override
  GTextTagFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTextTagFieldsDataBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'action':
          result.action.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GTextTagFieldsData_action))!
              as GTextTagFieldsData_action);
          break;
      }
    }

    return result.build();
  }
}

class _$GTextTagFieldsData_actionSerializer
    implements StructuredSerializer<GTextTagFieldsData_action> {
  @override
  final Iterable<Type> types = const [
    GTextTagFieldsData_action,
    _$GTextTagFieldsData_action
  ];
  @override
  final String wireName = 'GTextTagFieldsData_action';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GTextTagFieldsData_action object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(_i1.GActionType)),
    ];
    Object? value;
    value = object.args;
    if (value != null) {
      result
        ..add('args')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                Map, const [const FullType(String), const FullType(dynamic)])));
    }
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GTextTagFieldsData_action deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTextTagFieldsData_actionBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GActionType))
              as _i1.GActionType;
          break;
        case 'args':
          result.args = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ])) as Map<String, dynamic>?;
          break;
        case 'data':
          result.data = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GRiskTagFieldsDataSerializer
    implements StructuredSerializer<GRiskTagFieldsData> {
  @override
  final Iterable<Type> types = const [GRiskTagFieldsData, _$GRiskTagFieldsData];
  @override
  final String wireName = 'GRiskTagFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GRiskTagFieldsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.level;
    if (value != null) {
      result
        ..add('level')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GRiskTagFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GRiskTagFieldsDataBuilder();

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
        case 'level':
          result.level = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GQuickSearchTagFieldsDataSerializer
    implements StructuredSerializer<GQuickSearchTagFieldsData> {
  @override
  final Iterable<Type> types = const [
    GQuickSearchTagFieldsData,
    _$GQuickSearchTagFieldsData
  ];
  @override
  final String wireName = 'GQuickSearchTagFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GQuickSearchTagFieldsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.icon;
    if (value != null) {
      result
        ..add('icon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nameType;
    if (value != null) {
      result
        ..add('nameType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.matchedName;
    if (value != null) {
      result
        ..add('matchedName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GQuickSearchTagFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQuickSearchTagFieldsDataBuilder();

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
        case 'icon':
          result.icon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nameType':
          result.nameType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'matchedName':
          result.matchedName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GTextTagFieldsData extends GTextTagFieldsData {
  @override
  final String G__typename;
  @override
  final String? name;
  @override
  final GTextTagFieldsData_action? action;

  factory _$GTextTagFieldsData(
          [void Function(GTextTagFieldsDataBuilder)? updates]) =>
      (new GTextTagFieldsDataBuilder()..update(updates)).build();

  _$GTextTagFieldsData._({required this.G__typename, this.name, this.action})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GTextTagFieldsData', 'G__typename');
  }

  @override
  GTextTagFieldsData rebuild(
          void Function(GTextTagFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTextTagFieldsDataBuilder toBuilder() =>
      new GTextTagFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTextTagFieldsData &&
        G__typename == other.G__typename &&
        name == other.name &&
        action == other.action;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, G__typename.hashCode), name.hashCode), action.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GTextTagFieldsData')
          ..add('G__typename', G__typename)
          ..add('name', name)
          ..add('action', action))
        .toString();
  }
}

class GTextTagFieldsDataBuilder
    implements Builder<GTextTagFieldsData, GTextTagFieldsDataBuilder> {
  _$GTextTagFieldsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GTextTagFieldsData_actionBuilder? _action;
  GTextTagFieldsData_actionBuilder get action =>
      _$this._action ??= new GTextTagFieldsData_actionBuilder();
  set action(GTextTagFieldsData_actionBuilder? action) =>
      _$this._action = action;

  GTextTagFieldsDataBuilder() {
    GTextTagFieldsData._initializeBuilder(this);
  }

  GTextTagFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _name = $v.name;
      _action = $v.action?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTextTagFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTextTagFieldsData;
  }

  @override
  void update(void Function(GTextTagFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GTextTagFieldsData build() {
    _$GTextTagFieldsData _$result;
    try {
      _$result = _$v ??
          new _$GTextTagFieldsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GTextTagFieldsData', 'G__typename'),
              name: name,
              action: _action?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'action';
        _action?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GTextTagFieldsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GTextTagFieldsData_action extends GTextTagFieldsData_action {
  @override
  final String G__typename;
  @override
  final String name;
  @override
  final _i1.GActionType type;
  @override
  final Map<String, dynamic>? args;
  @override
  final String? data;

  factory _$GTextTagFieldsData_action(
          [void Function(GTextTagFieldsData_actionBuilder)? updates]) =>
      (new GTextTagFieldsData_actionBuilder()..update(updates)).build();

  _$GTextTagFieldsData_action._(
      {required this.G__typename,
      required this.name,
      required this.type,
      this.args,
      this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GTextTagFieldsData_action', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        name, 'GTextTagFieldsData_action', 'name');
    BuiltValueNullFieldError.checkNotNull(
        type, 'GTextTagFieldsData_action', 'type');
  }

  @override
  GTextTagFieldsData_action rebuild(
          void Function(GTextTagFieldsData_actionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTextTagFieldsData_actionBuilder toBuilder() =>
      new GTextTagFieldsData_actionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTextTagFieldsData_action &&
        G__typename == other.G__typename &&
        name == other.name &&
        type == other.type &&
        args == other.args &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, G__typename.hashCode), name.hashCode),
                type.hashCode),
            args.hashCode),
        data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GTextTagFieldsData_action')
          ..add('G__typename', G__typename)
          ..add('name', name)
          ..add('type', type)
          ..add('args', args)
          ..add('data', data))
        .toString();
  }
}

class GTextTagFieldsData_actionBuilder
    implements
        Builder<GTextTagFieldsData_action, GTextTagFieldsData_actionBuilder> {
  _$GTextTagFieldsData_action? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  _i1.GActionType? _type;
  _i1.GActionType? get type => _$this._type;
  set type(_i1.GActionType? type) => _$this._type = type;

  Map<String, dynamic>? _args;
  Map<String, dynamic>? get args => _$this._args;
  set args(Map<String, dynamic>? args) => _$this._args = args;

  String? _data;
  String? get data => _$this._data;
  set data(String? data) => _$this._data = data;

  GTextTagFieldsData_actionBuilder() {
    GTextTagFieldsData_action._initializeBuilder(this);
  }

  GTextTagFieldsData_actionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _name = $v.name;
      _type = $v.type;
      _args = $v.args;
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTextTagFieldsData_action other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTextTagFieldsData_action;
  }

  @override
  void update(void Function(GTextTagFieldsData_actionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GTextTagFieldsData_action build() {
    final _$result = _$v ??
        new _$GTextTagFieldsData_action._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GTextTagFieldsData_action', 'G__typename'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'GTextTagFieldsData_action', 'name'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, 'GTextTagFieldsData_action', 'type'),
            args: args,
            data: data);
    replace(_$result);
    return _$result;
  }
}

class _$GRiskTagFieldsData extends GRiskTagFieldsData {
  @override
  final String G__typename;
  @override
  final int? level;

  factory _$GRiskTagFieldsData(
          [void Function(GRiskTagFieldsDataBuilder)? updates]) =>
      (new GRiskTagFieldsDataBuilder()..update(updates)).build();

  _$GRiskTagFieldsData._({required this.G__typename, this.level}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GRiskTagFieldsData', 'G__typename');
  }

  @override
  GRiskTagFieldsData rebuild(
          void Function(GRiskTagFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GRiskTagFieldsDataBuilder toBuilder() =>
      new GRiskTagFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GRiskTagFieldsData &&
        G__typename == other.G__typename &&
        level == other.level;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), level.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GRiskTagFieldsData')
          ..add('G__typename', G__typename)
          ..add('level', level))
        .toString();
  }
}

class GRiskTagFieldsDataBuilder
    implements Builder<GRiskTagFieldsData, GRiskTagFieldsDataBuilder> {
  _$GRiskTagFieldsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _level;
  int? get level => _$this._level;
  set level(int? level) => _$this._level = level;

  GRiskTagFieldsDataBuilder() {
    GRiskTagFieldsData._initializeBuilder(this);
  }

  GRiskTagFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _level = $v.level;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GRiskTagFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GRiskTagFieldsData;
  }

  @override
  void update(void Function(GRiskTagFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GRiskTagFieldsData build() {
    final _$result = _$v ??
        new _$GRiskTagFieldsData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GRiskTagFieldsData', 'G__typename'),
            level: level);
    replace(_$result);
    return _$result;
  }
}

class _$GQuickSearchTagFieldsData extends GQuickSearchTagFieldsData {
  @override
  final String G__typename;
  @override
  final String? icon;
  @override
  final String? nameType;
  @override
  final String? matchedName;

  factory _$GQuickSearchTagFieldsData(
          [void Function(GQuickSearchTagFieldsDataBuilder)? updates]) =>
      (new GQuickSearchTagFieldsDataBuilder()..update(updates)).build();

  _$GQuickSearchTagFieldsData._(
      {required this.G__typename, this.icon, this.nameType, this.matchedName})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GQuickSearchTagFieldsData', 'G__typename');
  }

  @override
  GQuickSearchTagFieldsData rebuild(
          void Function(GQuickSearchTagFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQuickSearchTagFieldsDataBuilder toBuilder() =>
      new GQuickSearchTagFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQuickSearchTagFieldsData &&
        G__typename == other.G__typename &&
        icon == other.icon &&
        nameType == other.nameType &&
        matchedName == other.matchedName;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, G__typename.hashCode), icon.hashCode),
            nameType.hashCode),
        matchedName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GQuickSearchTagFieldsData')
          ..add('G__typename', G__typename)
          ..add('icon', icon)
          ..add('nameType', nameType)
          ..add('matchedName', matchedName))
        .toString();
  }
}

class GQuickSearchTagFieldsDataBuilder
    implements
        Builder<GQuickSearchTagFieldsData, GQuickSearchTagFieldsDataBuilder> {
  _$GQuickSearchTagFieldsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  String? _nameType;
  String? get nameType => _$this._nameType;
  set nameType(String? nameType) => _$this._nameType = nameType;

  String? _matchedName;
  String? get matchedName => _$this._matchedName;
  set matchedName(String? matchedName) => _$this._matchedName = matchedName;

  GQuickSearchTagFieldsDataBuilder() {
    GQuickSearchTagFieldsData._initializeBuilder(this);
  }

  GQuickSearchTagFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _icon = $v.icon;
      _nameType = $v.nameType;
      _matchedName = $v.matchedName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQuickSearchTagFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQuickSearchTagFieldsData;
  }

  @override
  void update(void Function(GQuickSearchTagFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQuickSearchTagFieldsData build() {
    final _$result = _$v ??
        new _$GQuickSearchTagFieldsData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GQuickSearchTagFieldsData', 'G__typename'),
            icon: icon,
            nameType: nameType,
            matchedName: matchedName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
