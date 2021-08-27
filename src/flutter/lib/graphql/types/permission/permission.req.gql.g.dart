// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFrequencyPermissionFieldsReq>
    _$gFrequencyPermissionFieldsReqSerializer =
    new _$GFrequencyPermissionFieldsReqSerializer();
Serializer<GPaginationPermissionFieldsReq>
    _$gPaginationPermissionFieldsReqSerializer =
    new _$GPaginationPermissionFieldsReqSerializer();
Serializer<GLockPermissionFieldsReq> _$gLockPermissionFieldsReqSerializer =
    new _$GLockPermissionFieldsReqSerializer();

class _$GFrequencyPermissionFieldsReqSerializer
    implements StructuredSerializer<GFrequencyPermissionFieldsReq> {
  @override
  final Iterable<Type> types = const [
    GFrequencyPermissionFieldsReq,
    _$GFrequencyPermissionFieldsReq
  ];
  @override
  final String wireName = 'GFrequencyPermissionFieldsReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFrequencyPermissionFieldsReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GFrequencyPermissionFieldsVars)),
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
  GFrequencyPermissionFieldsReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFrequencyPermissionFieldsReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i3.GFrequencyPermissionFieldsVars))!
              as _i3.GFrequencyPermissionFieldsVars);
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

class _$GPaginationPermissionFieldsReqSerializer
    implements StructuredSerializer<GPaginationPermissionFieldsReq> {
  @override
  final Iterable<Type> types = const [
    GPaginationPermissionFieldsReq,
    _$GPaginationPermissionFieldsReq
  ];
  @override
  final String wireName = 'GPaginationPermissionFieldsReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPaginationPermissionFieldsReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GPaginationPermissionFieldsVars)),
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
  GPaginationPermissionFieldsReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPaginationPermissionFieldsReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i3.GPaginationPermissionFieldsVars))!
              as _i3.GPaginationPermissionFieldsVars);
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

class _$GLockPermissionFieldsReqSerializer
    implements StructuredSerializer<GLockPermissionFieldsReq> {
  @override
  final Iterable<Type> types = const [
    GLockPermissionFieldsReq,
    _$GLockPermissionFieldsReq
  ];
  @override
  final String wireName = 'GLockPermissionFieldsReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GLockPermissionFieldsReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GLockPermissionFieldsVars)),
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
  GLockPermissionFieldsReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GLockPermissionFieldsReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GLockPermissionFieldsVars))!
              as _i3.GLockPermissionFieldsVars);
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

class _$GFrequencyPermissionFieldsReq extends GFrequencyPermissionFieldsReq {
  @override
  final _i3.GFrequencyPermissionFieldsVars vars;
  @override
  final _i5.DocumentNode document;
  @override
  final String? fragmentName;
  @override
  final Map<String, dynamic> idFields;

  factory _$GFrequencyPermissionFieldsReq(
          [void Function(GFrequencyPermissionFieldsReqBuilder)? updates]) =>
      (new GFrequencyPermissionFieldsReqBuilder()..update(updates)).build();

  _$GFrequencyPermissionFieldsReq._(
      {required this.vars,
      required this.document,
      this.fragmentName,
      required this.idFields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        vars, 'GFrequencyPermissionFieldsReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        document, 'GFrequencyPermissionFieldsReq', 'document');
    BuiltValueNullFieldError.checkNotNull(
        idFields, 'GFrequencyPermissionFieldsReq', 'idFields');
  }

  @override
  GFrequencyPermissionFieldsReq rebuild(
          void Function(GFrequencyPermissionFieldsReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFrequencyPermissionFieldsReqBuilder toBuilder() =>
      new GFrequencyPermissionFieldsReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFrequencyPermissionFieldsReq &&
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
    return (newBuiltValueToStringHelper('GFrequencyPermissionFieldsReq')
          ..add('vars', vars)
          ..add('document', document)
          ..add('fragmentName', fragmentName)
          ..add('idFields', idFields))
        .toString();
  }
}

class GFrequencyPermissionFieldsReqBuilder
    implements
        Builder<GFrequencyPermissionFieldsReq,
            GFrequencyPermissionFieldsReqBuilder> {
  _$GFrequencyPermissionFieldsReq? _$v;

  _i3.GFrequencyPermissionFieldsVarsBuilder? _vars;
  _i3.GFrequencyPermissionFieldsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GFrequencyPermissionFieldsVarsBuilder();
  set vars(_i3.GFrequencyPermissionFieldsVarsBuilder? vars) =>
      _$this._vars = vars;

  _i5.DocumentNode? _document;
  _i5.DocumentNode? get document => _$this._document;
  set document(_i5.DocumentNode? document) => _$this._document = document;

  String? _fragmentName;
  String? get fragmentName => _$this._fragmentName;
  set fragmentName(String? fragmentName) => _$this._fragmentName = fragmentName;

  Map<String, dynamic>? _idFields;
  Map<String, dynamic>? get idFields => _$this._idFields;
  set idFields(Map<String, dynamic>? idFields) => _$this._idFields = idFields;

  GFrequencyPermissionFieldsReqBuilder() {
    GFrequencyPermissionFieldsReq._initializeBuilder(this);
  }

  GFrequencyPermissionFieldsReqBuilder get _$this {
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
  void replace(GFrequencyPermissionFieldsReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFrequencyPermissionFieldsReq;
  }

  @override
  void update(void Function(GFrequencyPermissionFieldsReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GFrequencyPermissionFieldsReq build() {
    _$GFrequencyPermissionFieldsReq _$result;
    try {
      _$result = _$v ??
          new _$GFrequencyPermissionFieldsReq._(
              vars: vars.build(),
              document: BuiltValueNullFieldError.checkNotNull(
                  document, 'GFrequencyPermissionFieldsReq', 'document'),
              fragmentName: fragmentName,
              idFields: BuiltValueNullFieldError.checkNotNull(
                  idFields, 'GFrequencyPermissionFieldsReq', 'idFields'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GFrequencyPermissionFieldsReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPaginationPermissionFieldsReq extends GPaginationPermissionFieldsReq {
  @override
  final _i3.GPaginationPermissionFieldsVars vars;
  @override
  final _i5.DocumentNode document;
  @override
  final String? fragmentName;
  @override
  final Map<String, dynamic> idFields;

  factory _$GPaginationPermissionFieldsReq(
          [void Function(GPaginationPermissionFieldsReqBuilder)? updates]) =>
      (new GPaginationPermissionFieldsReqBuilder()..update(updates)).build();

  _$GPaginationPermissionFieldsReq._(
      {required this.vars,
      required this.document,
      this.fragmentName,
      required this.idFields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        vars, 'GPaginationPermissionFieldsReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        document, 'GPaginationPermissionFieldsReq', 'document');
    BuiltValueNullFieldError.checkNotNull(
        idFields, 'GPaginationPermissionFieldsReq', 'idFields');
  }

  @override
  GPaginationPermissionFieldsReq rebuild(
          void Function(GPaginationPermissionFieldsReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPaginationPermissionFieldsReqBuilder toBuilder() =>
      new GPaginationPermissionFieldsReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPaginationPermissionFieldsReq &&
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
    return (newBuiltValueToStringHelper('GPaginationPermissionFieldsReq')
          ..add('vars', vars)
          ..add('document', document)
          ..add('fragmentName', fragmentName)
          ..add('idFields', idFields))
        .toString();
  }
}

class GPaginationPermissionFieldsReqBuilder
    implements
        Builder<GPaginationPermissionFieldsReq,
            GPaginationPermissionFieldsReqBuilder> {
  _$GPaginationPermissionFieldsReq? _$v;

  _i3.GPaginationPermissionFieldsVarsBuilder? _vars;
  _i3.GPaginationPermissionFieldsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GPaginationPermissionFieldsVarsBuilder();
  set vars(_i3.GPaginationPermissionFieldsVarsBuilder? vars) =>
      _$this._vars = vars;

  _i5.DocumentNode? _document;
  _i5.DocumentNode? get document => _$this._document;
  set document(_i5.DocumentNode? document) => _$this._document = document;

  String? _fragmentName;
  String? get fragmentName => _$this._fragmentName;
  set fragmentName(String? fragmentName) => _$this._fragmentName = fragmentName;

  Map<String, dynamic>? _idFields;
  Map<String, dynamic>? get idFields => _$this._idFields;
  set idFields(Map<String, dynamic>? idFields) => _$this._idFields = idFields;

  GPaginationPermissionFieldsReqBuilder() {
    GPaginationPermissionFieldsReq._initializeBuilder(this);
  }

  GPaginationPermissionFieldsReqBuilder get _$this {
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
  void replace(GPaginationPermissionFieldsReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPaginationPermissionFieldsReq;
  }

  @override
  void update(void Function(GPaginationPermissionFieldsReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GPaginationPermissionFieldsReq build() {
    _$GPaginationPermissionFieldsReq _$result;
    try {
      _$result = _$v ??
          new _$GPaginationPermissionFieldsReq._(
              vars: vars.build(),
              document: BuiltValueNullFieldError.checkNotNull(
                  document, 'GPaginationPermissionFieldsReq', 'document'),
              fragmentName: fragmentName,
              idFields: BuiltValueNullFieldError.checkNotNull(
                  idFields, 'GPaginationPermissionFieldsReq', 'idFields'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GPaginationPermissionFieldsReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GLockPermissionFieldsReq extends GLockPermissionFieldsReq {
  @override
  final _i3.GLockPermissionFieldsVars vars;
  @override
  final _i5.DocumentNode document;
  @override
  final String? fragmentName;
  @override
  final Map<String, dynamic> idFields;

  factory _$GLockPermissionFieldsReq(
          [void Function(GLockPermissionFieldsReqBuilder)? updates]) =>
      (new GLockPermissionFieldsReqBuilder()..update(updates)).build();

  _$GLockPermissionFieldsReq._(
      {required this.vars,
      required this.document,
      this.fragmentName,
      required this.idFields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        vars, 'GLockPermissionFieldsReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        document, 'GLockPermissionFieldsReq', 'document');
    BuiltValueNullFieldError.checkNotNull(
        idFields, 'GLockPermissionFieldsReq', 'idFields');
  }

  @override
  GLockPermissionFieldsReq rebuild(
          void Function(GLockPermissionFieldsReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GLockPermissionFieldsReqBuilder toBuilder() =>
      new GLockPermissionFieldsReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GLockPermissionFieldsReq &&
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
    return (newBuiltValueToStringHelper('GLockPermissionFieldsReq')
          ..add('vars', vars)
          ..add('document', document)
          ..add('fragmentName', fragmentName)
          ..add('idFields', idFields))
        .toString();
  }
}

class GLockPermissionFieldsReqBuilder
    implements
        Builder<GLockPermissionFieldsReq, GLockPermissionFieldsReqBuilder> {
  _$GLockPermissionFieldsReq? _$v;

  _i3.GLockPermissionFieldsVarsBuilder? _vars;
  _i3.GLockPermissionFieldsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GLockPermissionFieldsVarsBuilder();
  set vars(_i3.GLockPermissionFieldsVarsBuilder? vars) => _$this._vars = vars;

  _i5.DocumentNode? _document;
  _i5.DocumentNode? get document => _$this._document;
  set document(_i5.DocumentNode? document) => _$this._document = document;

  String? _fragmentName;
  String? get fragmentName => _$this._fragmentName;
  set fragmentName(String? fragmentName) => _$this._fragmentName = fragmentName;

  Map<String, dynamic>? _idFields;
  Map<String, dynamic>? get idFields => _$this._idFields;
  set idFields(Map<String, dynamic>? idFields) => _$this._idFields = idFields;

  GLockPermissionFieldsReqBuilder() {
    GLockPermissionFieldsReq._initializeBuilder(this);
  }

  GLockPermissionFieldsReqBuilder get _$this {
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
  void replace(GLockPermissionFieldsReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GLockPermissionFieldsReq;
  }

  @override
  void update(void Function(GLockPermissionFieldsReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GLockPermissionFieldsReq build() {
    _$GLockPermissionFieldsReq _$result;
    try {
      _$result = _$v ??
          new _$GLockPermissionFieldsReq._(
              vars: vars.build(),
              document: BuiltValueNullFieldError.checkNotNull(
                  document, 'GLockPermissionFieldsReq', 'document'),
              fragmentName: fragmentName,
              idFields: BuiltValueNullFieldError.checkNotNull(
                  idFields, 'GLockPermissionFieldsReq', 'idFields'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GLockPermissionFieldsReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
