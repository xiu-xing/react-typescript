// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GTeamsData> _$gTeamsDataSerializer = new _$GTeamsDataSerializer();
Serializer<GTeamsData_teams> _$gTeamsDataTeamsSerializer =
    new _$GTeamsData_teamsSerializer();
Serializer<GIsEmailBindingRequiredData>
    _$gIsEmailBindingRequiredDataSerializer =
    new _$GIsEmailBindingRequiredDataSerializer();
Serializer<GIsEmailBindingRequiredData_isEmailBindingRequired>
    _$gIsEmailBindingRequiredDataIsEmailBindingRequiredSerializer =
    new _$GIsEmailBindingRequiredData_isEmailBindingRequiredSerializer();

class _$GTeamsDataSerializer implements StructuredSerializer<GTeamsData> {
  @override
  final Iterable<Type> types = const [GTeamsData, _$GTeamsData];
  @override
  final String wireName = 'GTeamsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GTeamsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'teams',
      serializers.serialize(object.teams,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GTeamsData_teams)])),
    ];

    return result;
  }

  @override
  GTeamsData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTeamsDataBuilder();

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
        case 'teams':
          result.teams.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GTeamsData_teams)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GTeamsData_teamsSerializer
    implements StructuredSerializer<GTeamsData_teams> {
  @override
  final Iterable<Type> types = const [GTeamsData_teams, _$GTeamsData_teams];
  @override
  final String wireName = 'GTeamsData_teams';

  @override
  Iterable<Object?> serialize(Serializers serializers, GTeamsData_teams object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.entityId;
    if (value != null) {
      result
        ..add('entityId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.entityType;
    if (value != null) {
      result
        ..add('entityType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i2.GEntityType)));
    }
    value = object.portraitUri;
    if (value != null) {
      result
        ..add('portraitUri')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GTeamsData_teams deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTeamsData_teamsBuilder();

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
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'entityId':
          result.entityId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'entityType':
          result.entityType = serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GEntityType))
              as _i2.GEntityType?;
          break;
        case 'portraitUri':
          result.portraitUri = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GIsEmailBindingRequiredDataSerializer
    implements StructuredSerializer<GIsEmailBindingRequiredData> {
  @override
  final Iterable<Type> types = const [
    GIsEmailBindingRequiredData,
    _$GIsEmailBindingRequiredData
  ];
  @override
  final String wireName = 'GIsEmailBindingRequiredData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GIsEmailBindingRequiredData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'isEmailBindingRequired',
      serializers.serialize(object.isEmailBindingRequired,
          specifiedType: const FullType(
              GIsEmailBindingRequiredData_isEmailBindingRequired)),
    ];

    return result;
  }

  @override
  GIsEmailBindingRequiredData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GIsEmailBindingRequiredDataBuilder();

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
        case 'isEmailBindingRequired':
          result.isEmailBindingRequired.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GIsEmailBindingRequiredData_isEmailBindingRequired))!
              as GIsEmailBindingRequiredData_isEmailBindingRequired);
          break;
      }
    }

    return result.build();
  }
}

class _$GIsEmailBindingRequiredData_isEmailBindingRequiredSerializer
    implements
        StructuredSerializer<
            GIsEmailBindingRequiredData_isEmailBindingRequired> {
  @override
  final Iterable<Type> types = const [
    GIsEmailBindingRequiredData_isEmailBindingRequired,
    _$GIsEmailBindingRequiredData_isEmailBindingRequired
  ];
  @override
  final String wireName = 'GIsEmailBindingRequiredData_isEmailBindingRequired';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GIsEmailBindingRequiredData_isEmailBindingRequired object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'isBindingRequired',
      serializers.serialize(object.isBindingRequired,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.domain;
    if (value != null) {
      result
        ..add('domain')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  GIsEmailBindingRequiredData_isEmailBindingRequired deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GIsEmailBindingRequiredData_isEmailBindingRequiredBuilder();

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
        case 'domain':
          result.domain.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'isBindingRequired':
          result.isBindingRequired = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GTeamsData extends GTeamsData {
  @override
  final String G__typename;
  @override
  final BuiltList<GTeamsData_teams> teams;

  factory _$GTeamsData([void Function(GTeamsDataBuilder)? updates]) =>
      (new GTeamsDataBuilder()..update(updates)).build();

  _$GTeamsData._({required this.G__typename, required this.teams}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GTeamsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(teams, 'GTeamsData', 'teams');
  }

  @override
  GTeamsData rebuild(void Function(GTeamsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTeamsDataBuilder toBuilder() => new GTeamsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTeamsData &&
        G__typename == other.G__typename &&
        teams == other.teams;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), teams.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GTeamsData')
          ..add('G__typename', G__typename)
          ..add('teams', teams))
        .toString();
  }
}

class GTeamsDataBuilder implements Builder<GTeamsData, GTeamsDataBuilder> {
  _$GTeamsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GTeamsData_teams>? _teams;
  ListBuilder<GTeamsData_teams> get teams =>
      _$this._teams ??= new ListBuilder<GTeamsData_teams>();
  set teams(ListBuilder<GTeamsData_teams>? teams) => _$this._teams = teams;

  GTeamsDataBuilder() {
    GTeamsData._initializeBuilder(this);
  }

  GTeamsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _teams = $v.teams.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTeamsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTeamsData;
  }

  @override
  void update(void Function(GTeamsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GTeamsData build() {
    _$GTeamsData _$result;
    try {
      _$result = _$v ??
          new _$GTeamsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GTeamsData', 'G__typename'),
              teams: teams.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'teams';
        teams.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GTeamsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GTeamsData_teams extends GTeamsData_teams {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String? entityId;
  @override
  final _i2.GEntityType? entityType;
  @override
  final String? portraitUri;

  factory _$GTeamsData_teams(
          [void Function(GTeamsData_teamsBuilder)? updates]) =>
      (new GTeamsData_teamsBuilder()..update(updates)).build();

  _$GTeamsData_teams._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.entityId,
      this.entityType,
      this.portraitUri})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GTeamsData_teams', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, 'GTeamsData_teams', 'id');
    BuiltValueNullFieldError.checkNotNull(name, 'GTeamsData_teams', 'name');
  }

  @override
  GTeamsData_teams rebuild(void Function(GTeamsData_teamsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTeamsData_teamsBuilder toBuilder() =>
      new GTeamsData_teamsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTeamsData_teams &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        entityId == other.entityId &&
        entityType == other.entityType &&
        portraitUri == other.portraitUri;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, G__typename.hashCode), id.hashCode),
                    name.hashCode),
                entityId.hashCode),
            entityType.hashCode),
        portraitUri.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GTeamsData_teams')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('entityId', entityId)
          ..add('entityType', entityType)
          ..add('portraitUri', portraitUri))
        .toString();
  }
}

class GTeamsData_teamsBuilder
    implements Builder<GTeamsData_teams, GTeamsData_teamsBuilder> {
  _$GTeamsData_teams? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _entityId;
  String? get entityId => _$this._entityId;
  set entityId(String? entityId) => _$this._entityId = entityId;

  _i2.GEntityType? _entityType;
  _i2.GEntityType? get entityType => _$this._entityType;
  set entityType(_i2.GEntityType? entityType) =>
      _$this._entityType = entityType;

  String? _portraitUri;
  String? get portraitUri => _$this._portraitUri;
  set portraitUri(String? portraitUri) => _$this._portraitUri = portraitUri;

  GTeamsData_teamsBuilder() {
    GTeamsData_teams._initializeBuilder(this);
  }

  GTeamsData_teamsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _entityId = $v.entityId;
      _entityType = $v.entityType;
      _portraitUri = $v.portraitUri;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTeamsData_teams other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTeamsData_teams;
  }

  @override
  void update(void Function(GTeamsData_teamsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GTeamsData_teams build() {
    final _$result = _$v ??
        new _$GTeamsData_teams._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GTeamsData_teams', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, 'GTeamsData_teams', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'GTeamsData_teams', 'name'),
            entityId: entityId,
            entityType: entityType,
            portraitUri: portraitUri);
    replace(_$result);
    return _$result;
  }
}

class _$GIsEmailBindingRequiredData extends GIsEmailBindingRequiredData {
  @override
  final String G__typename;
  @override
  final GIsEmailBindingRequiredData_isEmailBindingRequired
      isEmailBindingRequired;

  factory _$GIsEmailBindingRequiredData(
          [void Function(GIsEmailBindingRequiredDataBuilder)? updates]) =>
      (new GIsEmailBindingRequiredDataBuilder()..update(updates)).build();

  _$GIsEmailBindingRequiredData._(
      {required this.G__typename, required this.isEmailBindingRequired})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GIsEmailBindingRequiredData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(isEmailBindingRequired,
        'GIsEmailBindingRequiredData', 'isEmailBindingRequired');
  }

  @override
  GIsEmailBindingRequiredData rebuild(
          void Function(GIsEmailBindingRequiredDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GIsEmailBindingRequiredDataBuilder toBuilder() =>
      new GIsEmailBindingRequiredDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GIsEmailBindingRequiredData &&
        G__typename == other.G__typename &&
        isEmailBindingRequired == other.isEmailBindingRequired;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, G__typename.hashCode), isEmailBindingRequired.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GIsEmailBindingRequiredData')
          ..add('G__typename', G__typename)
          ..add('isEmailBindingRequired', isEmailBindingRequired))
        .toString();
  }
}

class GIsEmailBindingRequiredDataBuilder
    implements
        Builder<GIsEmailBindingRequiredData,
            GIsEmailBindingRequiredDataBuilder> {
  _$GIsEmailBindingRequiredData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GIsEmailBindingRequiredData_isEmailBindingRequiredBuilder?
      _isEmailBindingRequired;
  GIsEmailBindingRequiredData_isEmailBindingRequiredBuilder
      get isEmailBindingRequired => _$this._isEmailBindingRequired ??=
          new GIsEmailBindingRequiredData_isEmailBindingRequiredBuilder();
  set isEmailBindingRequired(
          GIsEmailBindingRequiredData_isEmailBindingRequiredBuilder?
              isEmailBindingRequired) =>
      _$this._isEmailBindingRequired = isEmailBindingRequired;

  GIsEmailBindingRequiredDataBuilder() {
    GIsEmailBindingRequiredData._initializeBuilder(this);
  }

  GIsEmailBindingRequiredDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _isEmailBindingRequired = $v.isEmailBindingRequired.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GIsEmailBindingRequiredData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GIsEmailBindingRequiredData;
  }

  @override
  void update(void Function(GIsEmailBindingRequiredDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GIsEmailBindingRequiredData build() {
    _$GIsEmailBindingRequiredData _$result;
    try {
      _$result = _$v ??
          new _$GIsEmailBindingRequiredData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GIsEmailBindingRequiredData', 'G__typename'),
              isEmailBindingRequired: isEmailBindingRequired.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'isEmailBindingRequired';
        isEmailBindingRequired.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GIsEmailBindingRequiredData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GIsEmailBindingRequiredData_isEmailBindingRequired
    extends GIsEmailBindingRequiredData_isEmailBindingRequired {
  @override
  final String G__typename;
  @override
  final BuiltList<String>? domain;
  @override
  final bool isBindingRequired;

  factory _$GIsEmailBindingRequiredData_isEmailBindingRequired(
          [void Function(
                  GIsEmailBindingRequiredData_isEmailBindingRequiredBuilder)?
              updates]) =>
      (new GIsEmailBindingRequiredData_isEmailBindingRequiredBuilder()
            ..update(updates))
          .build();

  _$GIsEmailBindingRequiredData_isEmailBindingRequired._(
      {required this.G__typename, this.domain, required this.isBindingRequired})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GIsEmailBindingRequiredData_isEmailBindingRequired', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        isBindingRequired,
        'GIsEmailBindingRequiredData_isEmailBindingRequired',
        'isBindingRequired');
  }

  @override
  GIsEmailBindingRequiredData_isEmailBindingRequired rebuild(
          void Function(
                  GIsEmailBindingRequiredData_isEmailBindingRequiredBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GIsEmailBindingRequiredData_isEmailBindingRequiredBuilder toBuilder() =>
      new GIsEmailBindingRequiredData_isEmailBindingRequiredBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GIsEmailBindingRequiredData_isEmailBindingRequired &&
        G__typename == other.G__typename &&
        domain == other.domain &&
        isBindingRequired == other.isBindingRequired;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, G__typename.hashCode), domain.hashCode),
        isBindingRequired.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GIsEmailBindingRequiredData_isEmailBindingRequired')
          ..add('G__typename', G__typename)
          ..add('domain', domain)
          ..add('isBindingRequired', isBindingRequired))
        .toString();
  }
}

class GIsEmailBindingRequiredData_isEmailBindingRequiredBuilder
    implements
        Builder<GIsEmailBindingRequiredData_isEmailBindingRequired,
            GIsEmailBindingRequiredData_isEmailBindingRequiredBuilder> {
  _$GIsEmailBindingRequiredData_isEmailBindingRequired? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<String>? _domain;
  ListBuilder<String> get domain =>
      _$this._domain ??= new ListBuilder<String>();
  set domain(ListBuilder<String>? domain) => _$this._domain = domain;

  bool? _isBindingRequired;
  bool? get isBindingRequired => _$this._isBindingRequired;
  set isBindingRequired(bool? isBindingRequired) =>
      _$this._isBindingRequired = isBindingRequired;

  GIsEmailBindingRequiredData_isEmailBindingRequiredBuilder() {
    GIsEmailBindingRequiredData_isEmailBindingRequired._initializeBuilder(this);
  }

  GIsEmailBindingRequiredData_isEmailBindingRequiredBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _domain = $v.domain?.toBuilder();
      _isBindingRequired = $v.isBindingRequired;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GIsEmailBindingRequiredData_isEmailBindingRequired other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GIsEmailBindingRequiredData_isEmailBindingRequired;
  }

  @override
  void update(
      void Function(GIsEmailBindingRequiredData_isEmailBindingRequiredBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GIsEmailBindingRequiredData_isEmailBindingRequired build() {
    _$GIsEmailBindingRequiredData_isEmailBindingRequired _$result;
    try {
      _$result = _$v ??
          new _$GIsEmailBindingRequiredData_isEmailBindingRequired._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  'GIsEmailBindingRequiredData_isEmailBindingRequired',
                  'G__typename'),
              domain: _domain?.build(),
              isBindingRequired: BuiltValueNullFieldError.checkNotNull(
                  isBindingRequired,
                  'GIsEmailBindingRequiredData_isEmailBindingRequired',
                  'isBindingRequired'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'domain';
        _domain?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GIsEmailBindingRequiredData_isEmailBindingRequired',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
