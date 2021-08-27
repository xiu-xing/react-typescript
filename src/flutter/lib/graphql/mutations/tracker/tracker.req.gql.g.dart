// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracker.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GTrackEntityReq> _$gTrackEntityReqSerializer =
    new _$GTrackEntityReqSerializer();
Serializer<GUnTrackEntityByEntityIDReq>
    _$gUnTrackEntityByEntityIDReqSerializer =
    new _$GUnTrackEntityByEntityIDReqSerializer();

class _$GTrackEntityReqSerializer
    implements StructuredSerializer<GTrackEntityReq> {
  @override
  final Iterable<Type> types = const [GTrackEntityReq, _$GTrackEntityReq];
  @override
  final String wireName = 'GTrackEntityReq';

  @override
  Iterable<Object?> serialize(Serializers serializers, GTrackEntityReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GTrackEntityVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i4.Operation)),
      'executeOnListen',
      serializers.serialize(object.executeOnListen,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.requestId;
    if (value != null) {
      result
        ..add('requestId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.optimisticResponse;
    if (value != null) {
      result
        ..add('optimisticResponse')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i2.GTrackEntityData)));
    }
    value = object.updateCacheHandlerKey;
    if (value != null) {
      result
        ..add('updateCacheHandlerKey')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.updateCacheHandlerContext;
    if (value != null) {
      result
        ..add('updateCacheHandlerContext')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                Map, const [const FullType(String), const FullType(dynamic)])));
    }
    value = object.fetchPolicy;
    if (value != null) {
      result
        ..add('fetchPolicy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i1.FetchPolicy)));
    }
    return result;
  }

  @override
  GTrackEntityReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTrackEntityReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GTrackEntityVars))!
              as _i3.GTrackEntityVars);
          break;
        case 'operation':
          result.operation = serializers.deserialize(value,
              specifiedType: const FullType(_i4.Operation)) as _i4.Operation;
          break;
        case 'requestId':
          result.requestId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'optimisticResponse':
          result.optimisticResponse.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GTrackEntityData))!
              as _i2.GTrackEntityData);
          break;
        case 'updateCacheHandlerKey':
          result.updateCacheHandlerKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'updateCacheHandlerContext':
          result.updateCacheHandlerContext = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ])) as Map<String, dynamic>?;
          break;
        case 'fetchPolicy':
          result.fetchPolicy = serializers.deserialize(value,
                  specifiedType: const FullType(_i1.FetchPolicy))
              as _i1.FetchPolicy?;
          break;
        case 'executeOnListen':
          result.executeOnListen = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GUnTrackEntityByEntityIDReqSerializer
    implements StructuredSerializer<GUnTrackEntityByEntityIDReq> {
  @override
  final Iterable<Type> types = const [
    GUnTrackEntityByEntityIDReq,
    _$GUnTrackEntityByEntityIDReq
  ];
  @override
  final String wireName = 'GUnTrackEntityByEntityIDReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUnTrackEntityByEntityIDReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GUnTrackEntityByEntityIDVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i4.Operation)),
      'executeOnListen',
      serializers.serialize(object.executeOnListen,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.requestId;
    if (value != null) {
      result
        ..add('requestId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.optimisticResponse;
    if (value != null) {
      result
        ..add('optimisticResponse')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i2.GUnTrackEntityByEntityIDData)));
    }
    value = object.updateCacheHandlerKey;
    if (value != null) {
      result
        ..add('updateCacheHandlerKey')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.updateCacheHandlerContext;
    if (value != null) {
      result
        ..add('updateCacheHandlerContext')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                Map, const [const FullType(String), const FullType(dynamic)])));
    }
    value = object.fetchPolicy;
    if (value != null) {
      result
        ..add('fetchPolicy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i1.FetchPolicy)));
    }
    return result;
  }

  @override
  GUnTrackEntityByEntityIDReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUnTrackEntityByEntityIDReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i3.GUnTrackEntityByEntityIDVars))!
              as _i3.GUnTrackEntityByEntityIDVars);
          break;
        case 'operation':
          result.operation = serializers.deserialize(value,
              specifiedType: const FullType(_i4.Operation)) as _i4.Operation;
          break;
        case 'requestId':
          result.requestId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'optimisticResponse':
          result.optimisticResponse.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i2.GUnTrackEntityByEntityIDData))!
              as _i2.GUnTrackEntityByEntityIDData);
          break;
        case 'updateCacheHandlerKey':
          result.updateCacheHandlerKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'updateCacheHandlerContext':
          result.updateCacheHandlerContext = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ])) as Map<String, dynamic>?;
          break;
        case 'fetchPolicy':
          result.fetchPolicy = serializers.deserialize(value,
                  specifiedType: const FullType(_i1.FetchPolicy))
              as _i1.FetchPolicy?;
          break;
        case 'executeOnListen':
          result.executeOnListen = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GTrackEntityReq extends GTrackEntityReq {
  @override
  final _i3.GTrackEntityVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String? requestId;
  @override
  final _i2.GTrackEntityData? Function(
      _i2.GTrackEntityData?, _i2.GTrackEntityData?)? updateResult;
  @override
  final _i2.GTrackEntityData? optimisticResponse;
  @override
  final String? updateCacheHandlerKey;
  @override
  final Map<String, dynamic>? updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy? fetchPolicy;
  @override
  final bool executeOnListen;

  factory _$GTrackEntityReq([void Function(GTrackEntityReqBuilder)? updates]) =>
      (new GTrackEntityReqBuilder()..update(updates)).build();

  _$GTrackEntityReq._(
      {required this.vars,
      required this.operation,
      this.requestId,
      this.updateResult,
      this.optimisticResponse,
      this.updateCacheHandlerKey,
      this.updateCacheHandlerContext,
      this.fetchPolicy,
      required this.executeOnListen})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, 'GTrackEntityReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GTrackEntityReq', 'operation');
    BuiltValueNullFieldError.checkNotNull(
        executeOnListen, 'GTrackEntityReq', 'executeOnListen');
  }

  @override
  GTrackEntityReq rebuild(void Function(GTrackEntityReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTrackEntityReqBuilder toBuilder() =>
      new GTrackEntityReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GTrackEntityReq &&
        vars == other.vars &&
        operation == other.operation &&
        requestId == other.requestId &&
        updateResult == _$dynamicOther.updateResult &&
        optimisticResponse == other.optimisticResponse &&
        updateCacheHandlerKey == other.updateCacheHandlerKey &&
        updateCacheHandlerContext == other.updateCacheHandlerContext &&
        fetchPolicy == other.fetchPolicy &&
        executeOnListen == other.executeOnListen;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, vars.hashCode), operation.hashCode),
                                requestId.hashCode),
                            updateResult.hashCode),
                        optimisticResponse.hashCode),
                    updateCacheHandlerKey.hashCode),
                updateCacheHandlerContext.hashCode),
            fetchPolicy.hashCode),
        executeOnListen.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GTrackEntityReq')
          ..add('vars', vars)
          ..add('operation', operation)
          ..add('requestId', requestId)
          ..add('updateResult', updateResult)
          ..add('optimisticResponse', optimisticResponse)
          ..add('updateCacheHandlerKey', updateCacheHandlerKey)
          ..add('updateCacheHandlerContext', updateCacheHandlerContext)
          ..add('fetchPolicy', fetchPolicy)
          ..add('executeOnListen', executeOnListen))
        .toString();
  }
}

class GTrackEntityReqBuilder
    implements Builder<GTrackEntityReq, GTrackEntityReqBuilder> {
  _$GTrackEntityReq? _$v;

  _i3.GTrackEntityVarsBuilder? _vars;
  _i3.GTrackEntityVarsBuilder get vars =>
      _$this._vars ??= new _i3.GTrackEntityVarsBuilder();
  set vars(_i3.GTrackEntityVarsBuilder? vars) => _$this._vars = vars;

  _i4.Operation? _operation;
  _i4.Operation? get operation => _$this._operation;
  set operation(_i4.Operation? operation) => _$this._operation = operation;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  _i2.GTrackEntityData? Function(_i2.GTrackEntityData?, _i2.GTrackEntityData?)?
      _updateResult;
  _i2.GTrackEntityData? Function(_i2.GTrackEntityData?, _i2.GTrackEntityData?)?
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GTrackEntityData? Function(
                  _i2.GTrackEntityData?, _i2.GTrackEntityData?)?
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GTrackEntityDataBuilder? _optimisticResponse;
  _i2.GTrackEntityDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??= new _i2.GTrackEntityDataBuilder();
  set optimisticResponse(_i2.GTrackEntityDataBuilder? optimisticResponse) =>
      _$this._optimisticResponse = optimisticResponse;

  String? _updateCacheHandlerKey;
  String? get updateCacheHandlerKey => _$this._updateCacheHandlerKey;
  set updateCacheHandlerKey(String? updateCacheHandlerKey) =>
      _$this._updateCacheHandlerKey = updateCacheHandlerKey;

  Map<String, dynamic>? _updateCacheHandlerContext;
  Map<String, dynamic>? get updateCacheHandlerContext =>
      _$this._updateCacheHandlerContext;
  set updateCacheHandlerContext(
          Map<String, dynamic>? updateCacheHandlerContext) =>
      _$this._updateCacheHandlerContext = updateCacheHandlerContext;

  _i1.FetchPolicy? _fetchPolicy;
  _i1.FetchPolicy? get fetchPolicy => _$this._fetchPolicy;
  set fetchPolicy(_i1.FetchPolicy? fetchPolicy) =>
      _$this._fetchPolicy = fetchPolicy;

  bool? _executeOnListen;
  bool? get executeOnListen => _$this._executeOnListen;
  set executeOnListen(bool? executeOnListen) =>
      _$this._executeOnListen = executeOnListen;

  GTrackEntityReqBuilder() {
    GTrackEntityReq._initializeBuilder(this);
  }

  GTrackEntityReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _requestId = $v.requestId;
      _updateResult = $v.updateResult;
      _optimisticResponse = $v.optimisticResponse?.toBuilder();
      _updateCacheHandlerKey = $v.updateCacheHandlerKey;
      _updateCacheHandlerContext = $v.updateCacheHandlerContext;
      _fetchPolicy = $v.fetchPolicy;
      _executeOnListen = $v.executeOnListen;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTrackEntityReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTrackEntityReq;
  }

  @override
  void update(void Function(GTrackEntityReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GTrackEntityReq build() {
    _$GTrackEntityReq _$result;
    try {
      _$result = _$v ??
          new _$GTrackEntityReq._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, 'GTrackEntityReq', 'operation'),
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: BuiltValueNullFieldError.checkNotNull(
                  executeOnListen, 'GTrackEntityReq', 'executeOnListen'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();

        _$failedField = 'optimisticResponse';
        _optimisticResponse?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GTrackEntityReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUnTrackEntityByEntityIDReq extends GUnTrackEntityByEntityIDReq {
  @override
  final _i3.GUnTrackEntityByEntityIDVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String? requestId;
  @override
  final _i2.GUnTrackEntityByEntityIDData? Function(
          _i2.GUnTrackEntityByEntityIDData?, _i2.GUnTrackEntityByEntityIDData?)?
      updateResult;
  @override
  final _i2.GUnTrackEntityByEntityIDData? optimisticResponse;
  @override
  final String? updateCacheHandlerKey;
  @override
  final Map<String, dynamic>? updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy? fetchPolicy;
  @override
  final bool executeOnListen;

  factory _$GUnTrackEntityByEntityIDReq(
          [void Function(GUnTrackEntityByEntityIDReqBuilder)? updates]) =>
      (new GUnTrackEntityByEntityIDReqBuilder()..update(updates)).build();

  _$GUnTrackEntityByEntityIDReq._(
      {required this.vars,
      required this.operation,
      this.requestId,
      this.updateResult,
      this.optimisticResponse,
      this.updateCacheHandlerKey,
      this.updateCacheHandlerContext,
      this.fetchPolicy,
      required this.executeOnListen})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        vars, 'GUnTrackEntityByEntityIDReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GUnTrackEntityByEntityIDReq', 'operation');
    BuiltValueNullFieldError.checkNotNull(
        executeOnListen, 'GUnTrackEntityByEntityIDReq', 'executeOnListen');
  }

  @override
  GUnTrackEntityByEntityIDReq rebuild(
          void Function(GUnTrackEntityByEntityIDReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUnTrackEntityByEntityIDReqBuilder toBuilder() =>
      new GUnTrackEntityByEntityIDReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GUnTrackEntityByEntityIDReq &&
        vars == other.vars &&
        operation == other.operation &&
        requestId == other.requestId &&
        updateResult == _$dynamicOther.updateResult &&
        optimisticResponse == other.optimisticResponse &&
        updateCacheHandlerKey == other.updateCacheHandlerKey &&
        updateCacheHandlerContext == other.updateCacheHandlerContext &&
        fetchPolicy == other.fetchPolicy &&
        executeOnListen == other.executeOnListen;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, vars.hashCode), operation.hashCode),
                                requestId.hashCode),
                            updateResult.hashCode),
                        optimisticResponse.hashCode),
                    updateCacheHandlerKey.hashCode),
                updateCacheHandlerContext.hashCode),
            fetchPolicy.hashCode),
        executeOnListen.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUnTrackEntityByEntityIDReq')
          ..add('vars', vars)
          ..add('operation', operation)
          ..add('requestId', requestId)
          ..add('updateResult', updateResult)
          ..add('optimisticResponse', optimisticResponse)
          ..add('updateCacheHandlerKey', updateCacheHandlerKey)
          ..add('updateCacheHandlerContext', updateCacheHandlerContext)
          ..add('fetchPolicy', fetchPolicy)
          ..add('executeOnListen', executeOnListen))
        .toString();
  }
}

class GUnTrackEntityByEntityIDReqBuilder
    implements
        Builder<GUnTrackEntityByEntityIDReq,
            GUnTrackEntityByEntityIDReqBuilder> {
  _$GUnTrackEntityByEntityIDReq? _$v;

  _i3.GUnTrackEntityByEntityIDVarsBuilder? _vars;
  _i3.GUnTrackEntityByEntityIDVarsBuilder get vars =>
      _$this._vars ??= new _i3.GUnTrackEntityByEntityIDVarsBuilder();
  set vars(_i3.GUnTrackEntityByEntityIDVarsBuilder? vars) =>
      _$this._vars = vars;

  _i4.Operation? _operation;
  _i4.Operation? get operation => _$this._operation;
  set operation(_i4.Operation? operation) => _$this._operation = operation;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  _i2.GUnTrackEntityByEntityIDData? Function(
          _i2.GUnTrackEntityByEntityIDData?, _i2.GUnTrackEntityByEntityIDData?)?
      _updateResult;
  _i2.GUnTrackEntityByEntityIDData? Function(
          _i2.GUnTrackEntityByEntityIDData?, _i2.GUnTrackEntityByEntityIDData?)?
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GUnTrackEntityByEntityIDData? Function(
                  _i2.GUnTrackEntityByEntityIDData?,
                  _i2.GUnTrackEntityByEntityIDData?)?
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GUnTrackEntityByEntityIDDataBuilder? _optimisticResponse;
  _i2.GUnTrackEntityByEntityIDDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??=
          new _i2.GUnTrackEntityByEntityIDDataBuilder();
  set optimisticResponse(
          _i2.GUnTrackEntityByEntityIDDataBuilder? optimisticResponse) =>
      _$this._optimisticResponse = optimisticResponse;

  String? _updateCacheHandlerKey;
  String? get updateCacheHandlerKey => _$this._updateCacheHandlerKey;
  set updateCacheHandlerKey(String? updateCacheHandlerKey) =>
      _$this._updateCacheHandlerKey = updateCacheHandlerKey;

  Map<String, dynamic>? _updateCacheHandlerContext;
  Map<String, dynamic>? get updateCacheHandlerContext =>
      _$this._updateCacheHandlerContext;
  set updateCacheHandlerContext(
          Map<String, dynamic>? updateCacheHandlerContext) =>
      _$this._updateCacheHandlerContext = updateCacheHandlerContext;

  _i1.FetchPolicy? _fetchPolicy;
  _i1.FetchPolicy? get fetchPolicy => _$this._fetchPolicy;
  set fetchPolicy(_i1.FetchPolicy? fetchPolicy) =>
      _$this._fetchPolicy = fetchPolicy;

  bool? _executeOnListen;
  bool? get executeOnListen => _$this._executeOnListen;
  set executeOnListen(bool? executeOnListen) =>
      _$this._executeOnListen = executeOnListen;

  GUnTrackEntityByEntityIDReqBuilder() {
    GUnTrackEntityByEntityIDReq._initializeBuilder(this);
  }

  GUnTrackEntityByEntityIDReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _requestId = $v.requestId;
      _updateResult = $v.updateResult;
      _optimisticResponse = $v.optimisticResponse?.toBuilder();
      _updateCacheHandlerKey = $v.updateCacheHandlerKey;
      _updateCacheHandlerContext = $v.updateCacheHandlerContext;
      _fetchPolicy = $v.fetchPolicy;
      _executeOnListen = $v.executeOnListen;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUnTrackEntityByEntityIDReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUnTrackEntityByEntityIDReq;
  }

  @override
  void update(void Function(GUnTrackEntityByEntityIDReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUnTrackEntityByEntityIDReq build() {
    _$GUnTrackEntityByEntityIDReq _$result;
    try {
      _$result = _$v ??
          new _$GUnTrackEntityByEntityIDReq._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, 'GUnTrackEntityByEntityIDReq', 'operation'),
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: BuiltValueNullFieldError.checkNotNull(
                  executeOnListen,
                  'GUnTrackEntityByEntityIDReq',
                  'executeOnListen'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();

        _$failedField = 'optimisticResponse';
        _optimisticResponse?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GUnTrackEntityByEntityIDReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
