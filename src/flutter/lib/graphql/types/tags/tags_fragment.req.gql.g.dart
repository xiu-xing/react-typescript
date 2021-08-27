// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tags_fragment.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GTextTagFieldsReq> _$gTextTagFieldsReqSerializer =
    new _$GTextTagFieldsReqSerializer();
Serializer<GRiskTagFieldsReq> _$gRiskTagFieldsReqSerializer =
    new _$GRiskTagFieldsReqSerializer();
Serializer<GQuickSearchTagFieldsReq> _$gQuickSearchTagFieldsReqSerializer =
    new _$GQuickSearchTagFieldsReqSerializer();

class _$GTextTagFieldsReqSerializer
    implements StructuredSerializer<GTextTagFieldsReq> {
  @override
  final Iterable<Type> types = const [GTextTagFieldsReq, _$GTextTagFieldsReq];
  @override
  final String wireName = 'GTextTagFieldsReq';

  @override
  Iterable<Object?> serialize(Serializers serializers, GTextTagFieldsReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GTextTagFieldsVars)),
      'document',
      serializers.serialize(object.document,
          specifiedType: const FullType(_i5.DocumentNode)),
      'idFields',
      serializers.serialize(object.idFields,
          specifiedType: const FullType(
              Map, const [const FullType(String), const FullType(dynamic)])),
    ];
    Object? value;
    value = object.fragmentName;
    if (value != null) {
      result
        ..add('fragmentName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GTextTagFieldsReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTextTagFieldsReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GTextTagFieldsVars))!
              as _i3.GTextTagFieldsVars);
          break;
        case 'document':
          result.document = serializers.deserialize(value,
                  specifiedType: const FullType(_i5.DocumentNode))
              as _i5.DocumentNode;
          break;
        case 'fragmentName':
          result.fragmentName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'idFields':
          result.idFields = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ])) as Map<String, dynamic>;
          break;
      }
    }

    return result.build();
  }
}

class _$GRiskTagFieldsReqSerializer
    implements StructuredSerializer<GRiskTagFieldsReq> {
  @override
  final Iterable<Type> types = const [GRiskTagFieldsReq, _$GRiskTagFieldsReq];
  @override
  final String wireName = 'GRiskTagFieldsReq';

  @override
  Iterable<Object?> serialize(Serializers serializers, GRiskTagFieldsReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GRiskTagFieldsVars)),
      'document',
      serializers.serialize(object.document,
          specifiedType: const FullType(_i5.DocumentNode)),
      'idFields',
      serializers.serialize(object.idFields,
          specifiedType: const FullType(
              Map, const [const FullType(String), const FullType(dynamic)])),
    ];
    Object? value;
    value = object.fragmentName;
    if (value != null) {
      result
        ..add('fragmentName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GRiskTagFieldsReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GRiskTagFieldsReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GRiskTagFieldsVars))!
              as _i3.GRiskTagFieldsVars);
          break;
        case 'document':
          result.document = serializers.deserialize(value,
                  specifiedType: const FullType(_i5.DocumentNode))
              as _i5.DocumentNode;
          break;
        case 'fragmentName':
          result.fragmentName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'idFields':
          result.idFields = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ])) as Map<String, dynamic>;
          break;
      }
    }

    return result.build();
  }
}

class _$GQuickSearchTagFieldsReqSerializer
    implements StructuredSerializer<GQuickSearchTagFieldsReq> {
  @override
  final Iterable<Type> types = const [
    GQuickSearchTagFieldsReq,
    _$GQuickSearchTagFieldsReq
  ];
  @override
  final String wireName = 'GQuickSearchTagFieldsReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GQuickSearchTagFieldsReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GQuickSearchTagFieldsVars)),
      'document',
      serializers.serialize(object.document,
          specifiedType: const FullType(_i5.DocumentNode)),
      'idFields',
      serializers.serialize(object.idFields,
          specifiedType: const FullType(
              Map, const [const FullType(String), const FullType(dynamic)])),
    ];
    Object? value;
    value = object.fragmentName;
    if (value != null) {
      result
        ..add('fragmentName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GQuickSearchTagFieldsReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQuickSearchTagFieldsReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GQuickSearchTagFieldsVars))!
              as _i3.GQuickSearchTagFieldsVars);
          break;
        case 'document':
          result.document = serializers.deserialize(value,
                  specifiedType: const FullType(_i5.DocumentNode))
              as _i5.DocumentNode;
          break;
        case 'fragmentName':
          result.fragmentName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'idFields':
          result.idFields = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ])) as Map<String, dynamic>;
          break;
      }
    }

    return result.build();
  }
}

class _$GTextTagFieldsReq extends GTextTagFieldsReq {
  @override
  final _i3.GTextTagFieldsVars vars;
  @override
  final _i5.DocumentNode document;
  @override
  final String? fragmentName;
  @override
  final Map<String, dynamic> idFields;

  factory _$GTextTagFieldsReq(
          [void Function(GTextTagFieldsReqBuilder)? updates]) =>
      (new GTextTagFieldsReqBuilder()..update(updates)).build();

  _$GTextTagFieldsReq._(
      {required this.vars,
      required this.document,
      this.fragmentName,
      required this.idFields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, 'GTextTagFieldsReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        document, 'GTextTagFieldsReq', 'document');
    BuiltValueNullFieldError.checkNotNull(
        idFields, 'GTextTagFieldsReq', 'idFields');
  }

  @override
  GTextTagFieldsReq rebuild(void Function(GTextTagFieldsReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTextTagFieldsReqBuilder toBuilder() =>
      new GTextTagFieldsReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTextTagFieldsReq &&
        vars == other.vars &&
        document == other.document &&
        fragmentName == other.fragmentName &&
        idFields == other.idFields;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, vars.hashCode), document.hashCode),
            fragmentName.hashCode),
        idFields.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GTextTagFieldsReq')
          ..add('vars', vars)
          ..add('document', document)
          ..add('fragmentName', fragmentName)
          ..add('idFields', idFields))
        .toString();
  }
}

class GTextTagFieldsReqBuilder
    implements Builder<GTextTagFieldsReq, GTextTagFieldsReqBuilder> {
  _$GTextTagFieldsReq? _$v;

  _i3.GTextTagFieldsVarsBuilder? _vars;
  _i3.GTextTagFieldsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GTextTagFieldsVarsBuilder();
  set vars(_i3.GTextTagFieldsVarsBuilder? vars) => _$this._vars = vars;

  _i5.DocumentNode? _document;
  _i5.DocumentNode? get document => _$this._document;
  set document(_i5.DocumentNode? document) => _$this._document = document;

  String? _fragmentName;
  String? get fragmentName => _$this._fragmentName;
  set fragmentName(String? fragmentName) => _$this._fragmentName = fragmentName;

  Map<String, dynamic>? _idFields;
  Map<String, dynamic>? get idFields => _$this._idFields;
  set idFields(Map<String, dynamic>? idFields) => _$this._idFields = idFields;

  GTextTagFieldsReqBuilder() {
    GTextTagFieldsReq._initializeBuilder(this);
  }

  GTextTagFieldsReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _document = $v.document;
      _fragmentName = $v.fragmentName;
      _idFields = $v.idFields;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTextTagFieldsReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTextTagFieldsReq;
  }

  @override
  void update(void Function(GTextTagFieldsReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GTextTagFieldsReq build() {
    _$GTextTagFieldsReq _$result;
    try {
      _$result = _$v ??
          new _$GTextTagFieldsReq._(
              vars: vars.build(),
              document: BuiltValueNullFieldError.checkNotNull(
                  document, 'GTextTagFieldsReq', 'document'),
              fragmentName: fragmentName,
              idFields: BuiltValueNullFieldError.checkNotNull(
                  idFields, 'GTextTagFieldsReq', 'idFields'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GTextTagFieldsReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GRiskTagFieldsReq extends GRiskTagFieldsReq {
  @override
  final _i3.GRiskTagFieldsVars vars;
  @override
  final _i5.DocumentNode document;
  @override
  final String? fragmentName;
  @override
  final Map<String, dynamic> idFields;

  factory _$GRiskTagFieldsReq(
          [void Function(GRiskTagFieldsReqBuilder)? updates]) =>
      (new GRiskTagFieldsReqBuilder()..update(updates)).build();

  _$GRiskTagFieldsReq._(
      {required this.vars,
      required this.document,
      this.fragmentName,
      required this.idFields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, 'GRiskTagFieldsReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        document, 'GRiskTagFieldsReq', 'document');
    BuiltValueNullFieldError.checkNotNull(
        idFields, 'GRiskTagFieldsReq', 'idFields');
  }

  @override
  GRiskTagFieldsReq rebuild(void Function(GRiskTagFieldsReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GRiskTagFieldsReqBuilder toBuilder() =>
      new GRiskTagFieldsReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GRiskTagFieldsReq &&
        vars == other.vars &&
        document == other.document &&
        fragmentName == other.fragmentName &&
        idFields == other.idFields;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, vars.hashCode), document.hashCode),
            fragmentName.hashCode),
        idFields.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GRiskTagFieldsReq')
          ..add('vars', vars)
          ..add('document', document)
          ..add('fragmentName', fragmentName)
          ..add('idFields', idFields))
        .toString();
  }
}

class GRiskTagFieldsReqBuilder
    implements Builder<GRiskTagFieldsReq, GRiskTagFieldsReqBuilder> {
  _$GRiskTagFieldsReq? _$v;

  _i3.GRiskTagFieldsVarsBuilder? _vars;
  _i3.GRiskTagFieldsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GRiskTagFieldsVarsBuilder();
  set vars(_i3.GRiskTagFieldsVarsBuilder? vars) => _$this._vars = vars;

  _i5.DocumentNode? _document;
  _i5.DocumentNode? get document => _$this._document;
  set document(_i5.DocumentNode? document) => _$this._document = document;

  String? _fragmentName;
  String? get fragmentName => _$this._fragmentName;
  set fragmentName(String? fragmentName) => _$this._fragmentName = fragmentName;

  Map<String, dynamic>? _idFields;
  Map<String, dynamic>? get idFields => _$this._idFields;
  set idFields(Map<String, dynamic>? idFields) => _$this._idFields = idFields;

  GRiskTagFieldsReqBuilder() {
    GRiskTagFieldsReq._initializeBuilder(this);
  }

  GRiskTagFieldsReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _document = $v.document;
      _fragmentName = $v.fragmentName;
      _idFields = $v.idFields;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GRiskTagFieldsReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GRiskTagFieldsReq;
  }

  @override
  void update(void Function(GRiskTagFieldsReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GRiskTagFieldsReq build() {
    _$GRiskTagFieldsReq _$result;
    try {
      _$result = _$v ??
          new _$GRiskTagFieldsReq._(
              vars: vars.build(),
              document: BuiltValueNullFieldError.checkNotNull(
                  document, 'GRiskTagFieldsReq', 'document'),
              fragmentName: fragmentName,
              idFields: BuiltValueNullFieldError.checkNotNull(
                  idFields, 'GRiskTagFieldsReq', 'idFields'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GRiskTagFieldsReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GQuickSearchTagFieldsReq extends GQuickSearchTagFieldsReq {
  @override
  final _i3.GQuickSearchTagFieldsVars vars;
  @override
  final _i5.DocumentNode document;
  @override
  final String? fragmentName;
  @override
  final Map<String, dynamic> idFields;

  factory _$GQuickSearchTagFieldsReq(
          [void Function(GQuickSearchTagFieldsReqBuilder)? updates]) =>
      (new GQuickSearchTagFieldsReqBuilder()..update(updates)).build();

  _$GQuickSearchTagFieldsReq._(
      {required this.vars,
      required this.document,
      this.fragmentName,
      required this.idFields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        vars, 'GQuickSearchTagFieldsReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        document, 'GQuickSearchTagFieldsReq', 'document');
    BuiltValueNullFieldError.checkNotNull(
        idFields, 'GQuickSearchTagFieldsReq', 'idFields');
  }

  @override
  GQuickSearchTagFieldsReq rebuild(
          void Function(GQuickSearchTagFieldsReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQuickSearchTagFieldsReqBuilder toBuilder() =>
      new GQuickSearchTagFieldsReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQuickSearchTagFieldsReq &&
        vars == other.vars &&
        document == other.document &&
        fragmentName == other.fragmentName &&
        idFields == other.idFields;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, vars.hashCode), document.hashCode),
            fragmentName.hashCode),
        idFields.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GQuickSearchTagFieldsReq')
          ..add('vars', vars)
          ..add('document', document)
          ..add('fragmentName', fragmentName)
          ..add('idFields', idFields))
        .toString();
  }
}

class GQuickSearchTagFieldsReqBuilder
    implements
        Builder<GQuickSearchTagFieldsReq, GQuickSearchTagFieldsReqBuilder> {
  _$GQuickSearchTagFieldsReq? _$v;

  _i3.GQuickSearchTagFieldsVarsBuilder? _vars;
  _i3.GQuickSearchTagFieldsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GQuickSearchTagFieldsVarsBuilder();
  set vars(_i3.GQuickSearchTagFieldsVarsBuilder? vars) => _$this._vars = vars;

  _i5.DocumentNode? _document;
  _i5.DocumentNode? get document => _$this._document;
  set document(_i5.DocumentNode? document) => _$this._document = document;

  String? _fragmentName;
  String? get fragmentName => _$this._fragmentName;
  set fragmentName(String? fragmentName) => _$this._fragmentName = fragmentName;

  Map<String, dynamic>? _idFields;
  Map<String, dynamic>? get idFields => _$this._idFields;
  set idFields(Map<String, dynamic>? idFields) => _$this._idFields = idFields;

  GQuickSearchTagFieldsReqBuilder() {
    GQuickSearchTagFieldsReq._initializeBuilder(this);
  }

  GQuickSearchTagFieldsReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _document = $v.document;
      _fragmentName = $v.fragmentName;
      _idFields = $v.idFields;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQuickSearchTagFieldsReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQuickSearchTagFieldsReq;
  }

  @override
  void update(void Function(GQuickSearchTagFieldsReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQuickSearchTagFieldsReq build() {
    _$GQuickSearchTagFieldsReq _$result;
    try {
      _$result = _$v ??
          new _$GQuickSearchTagFieldsReq._(
              vars: vars.build(),
              document: BuiltValueNullFieldError.checkNotNull(
                  document, 'GQuickSearchTagFieldsReq', 'document'),
              fragmentName: fragmentName,
              idFields: BuiltValueNullFieldError.checkNotNull(
                  idFields, 'GQuickSearchTagFieldsReq', 'idFields'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GQuickSearchTagFieldsReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
