// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quick_search_fragment.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GQuickSearchEntityNodeFieldsReq>
    _$gQuickSearchEntityNodeFieldsReqSerializer =
    new _$GQuickSearchEntityNodeFieldsReqSerializer();
Serializer<GQuickSearchInfoFlowNodeFieldsReq>
    _$gQuickSearchInfoFlowNodeFieldsReqSerializer =
    new _$GQuickSearchInfoFlowNodeFieldsReqSerializer();

class _$GQuickSearchEntityNodeFieldsReqSerializer
    implements StructuredSerializer<GQuickSearchEntityNodeFieldsReq> {
  @override
  final Iterable<Type> types = const [
    GQuickSearchEntityNodeFieldsReq,
    _$GQuickSearchEntityNodeFieldsReq
  ];
  @override
  final String wireName = 'GQuickSearchEntityNodeFieldsReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GQuickSearchEntityNodeFieldsReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GQuickSearchEntityNodeFieldsVars)),
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
  GQuickSearchEntityNodeFieldsReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQuickSearchEntityNodeFieldsReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i3.GQuickSearchEntityNodeFieldsVars))!
              as _i3.GQuickSearchEntityNodeFieldsVars);
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

class _$GQuickSearchInfoFlowNodeFieldsReqSerializer
    implements StructuredSerializer<GQuickSearchInfoFlowNodeFieldsReq> {
  @override
  final Iterable<Type> types = const [
    GQuickSearchInfoFlowNodeFieldsReq,
    _$GQuickSearchInfoFlowNodeFieldsReq
  ];
  @override
  final String wireName = 'GQuickSearchInfoFlowNodeFieldsReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GQuickSearchInfoFlowNodeFieldsReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType:
              const FullType(_i3.GQuickSearchInfoFlowNodeFieldsVars)),
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
  GQuickSearchInfoFlowNodeFieldsReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQuickSearchInfoFlowNodeFieldsReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i3.GQuickSearchInfoFlowNodeFieldsVars))!
              as _i3.GQuickSearchInfoFlowNodeFieldsVars);
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

class _$GQuickSearchEntityNodeFieldsReq
    extends GQuickSearchEntityNodeFieldsReq {
  @override
  final _i3.GQuickSearchEntityNodeFieldsVars vars;
  @override
  final _i5.DocumentNode document;
  @override
  final String? fragmentName;
  @override
  final Map<String, dynamic> idFields;

  factory _$GQuickSearchEntityNodeFieldsReq(
          [void Function(GQuickSearchEntityNodeFieldsReqBuilder)? updates]) =>
      (new GQuickSearchEntityNodeFieldsReqBuilder()..update(updates)).build();

  _$GQuickSearchEntityNodeFieldsReq._(
      {required this.vars,
      required this.document,
      this.fragmentName,
      required this.idFields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        vars, 'GQuickSearchEntityNodeFieldsReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        document, 'GQuickSearchEntityNodeFieldsReq', 'document');
    BuiltValueNullFieldError.checkNotNull(
        idFields, 'GQuickSearchEntityNodeFieldsReq', 'idFields');
  }

  @override
  GQuickSearchEntityNodeFieldsReq rebuild(
          void Function(GQuickSearchEntityNodeFieldsReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQuickSearchEntityNodeFieldsReqBuilder toBuilder() =>
      new GQuickSearchEntityNodeFieldsReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQuickSearchEntityNodeFieldsReq &&
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
    return (newBuiltValueToStringHelper('GQuickSearchEntityNodeFieldsReq')
          ..add('vars', vars)
          ..add('document', document)
          ..add('fragmentName', fragmentName)
          ..add('idFields', idFields))
        .toString();
  }
}

class GQuickSearchEntityNodeFieldsReqBuilder
    implements
        Builder<GQuickSearchEntityNodeFieldsReq,
            GQuickSearchEntityNodeFieldsReqBuilder> {
  _$GQuickSearchEntityNodeFieldsReq? _$v;

  _i3.GQuickSearchEntityNodeFieldsVarsBuilder? _vars;
  _i3.GQuickSearchEntityNodeFieldsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GQuickSearchEntityNodeFieldsVarsBuilder();
  set vars(_i3.GQuickSearchEntityNodeFieldsVarsBuilder? vars) =>
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

  GQuickSearchEntityNodeFieldsReqBuilder() {
    GQuickSearchEntityNodeFieldsReq._initializeBuilder(this);
  }

  GQuickSearchEntityNodeFieldsReqBuilder get _$this {
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
  void replace(GQuickSearchEntityNodeFieldsReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQuickSearchEntityNodeFieldsReq;
  }

  @override
  void update(void Function(GQuickSearchEntityNodeFieldsReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQuickSearchEntityNodeFieldsReq build() {
    _$GQuickSearchEntityNodeFieldsReq _$result;
    try {
      _$result = _$v ??
          new _$GQuickSearchEntityNodeFieldsReq._(
              vars: vars.build(),
              document: BuiltValueNullFieldError.checkNotNull(
                  document, 'GQuickSearchEntityNodeFieldsReq', 'document'),
              fragmentName: fragmentName,
              idFields: BuiltValueNullFieldError.checkNotNull(
                  idFields, 'GQuickSearchEntityNodeFieldsReq', 'idFields'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GQuickSearchEntityNodeFieldsReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GQuickSearchInfoFlowNodeFieldsReq
    extends GQuickSearchInfoFlowNodeFieldsReq {
  @override
  final _i3.GQuickSearchInfoFlowNodeFieldsVars vars;
  @override
  final _i5.DocumentNode document;
  @override
  final String? fragmentName;
  @override
  final Map<String, dynamic> idFields;

  factory _$GQuickSearchInfoFlowNodeFieldsReq(
          [void Function(GQuickSearchInfoFlowNodeFieldsReqBuilder)? updates]) =>
      (new GQuickSearchInfoFlowNodeFieldsReqBuilder()..update(updates)).build();

  _$GQuickSearchInfoFlowNodeFieldsReq._(
      {required this.vars,
      required this.document,
      this.fragmentName,
      required this.idFields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        vars, 'GQuickSearchInfoFlowNodeFieldsReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        document, 'GQuickSearchInfoFlowNodeFieldsReq', 'document');
    BuiltValueNullFieldError.checkNotNull(
        idFields, 'GQuickSearchInfoFlowNodeFieldsReq', 'idFields');
  }

  @override
  GQuickSearchInfoFlowNodeFieldsReq rebuild(
          void Function(GQuickSearchInfoFlowNodeFieldsReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQuickSearchInfoFlowNodeFieldsReqBuilder toBuilder() =>
      new GQuickSearchInfoFlowNodeFieldsReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQuickSearchInfoFlowNodeFieldsReq &&
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
    return (newBuiltValueToStringHelper('GQuickSearchInfoFlowNodeFieldsReq')
          ..add('vars', vars)
          ..add('document', document)
          ..add('fragmentName', fragmentName)
          ..add('idFields', idFields))
        .toString();
  }
}

class GQuickSearchInfoFlowNodeFieldsReqBuilder
    implements
        Builder<GQuickSearchInfoFlowNodeFieldsReq,
            GQuickSearchInfoFlowNodeFieldsReqBuilder> {
  _$GQuickSearchInfoFlowNodeFieldsReq? _$v;

  _i3.GQuickSearchInfoFlowNodeFieldsVarsBuilder? _vars;
  _i3.GQuickSearchInfoFlowNodeFieldsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GQuickSearchInfoFlowNodeFieldsVarsBuilder();
  set vars(_i3.GQuickSearchInfoFlowNodeFieldsVarsBuilder? vars) =>
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

  GQuickSearchInfoFlowNodeFieldsReqBuilder() {
    GQuickSearchInfoFlowNodeFieldsReq._initializeBuilder(this);
  }

  GQuickSearchInfoFlowNodeFieldsReqBuilder get _$this {
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
  void replace(GQuickSearchInfoFlowNodeFieldsReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQuickSearchInfoFlowNodeFieldsReq;
  }

  @override
  void update(
      void Function(GQuickSearchInfoFlowNodeFieldsReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQuickSearchInfoFlowNodeFieldsReq build() {
    _$GQuickSearchInfoFlowNodeFieldsReq _$result;
    try {
      _$result = _$v ??
          new _$GQuickSearchInfoFlowNodeFieldsReq._(
              vars: vars.build(),
              document: BuiltValueNullFieldError.checkNotNull(
                  document, 'GQuickSearchInfoFlowNodeFieldsReq', 'document'),
              fragmentName: fragmentName,
              idFields: BuiltValueNullFieldError.checkNotNull(
                  idFields, 'GQuickSearchInfoFlowNodeFieldsReq', 'idFields'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GQuickSearchInfoFlowNodeFieldsReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
