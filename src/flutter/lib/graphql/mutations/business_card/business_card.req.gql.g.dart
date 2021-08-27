// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_card.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateBusinessCardApprovalTicketReq>
    _$gCreateBusinessCardApprovalTicketReqSerializer =
    new _$GCreateBusinessCardApprovalTicketReqSerializer();
Serializer<GCreateVerificationCodeReq> _$gCreateVerificationCodeReqSerializer =
    new _$GCreateVerificationCodeReqSerializer();
Serializer<GVerifyCodeAndApproveJoinRequestReq>
    _$gVerifyCodeAndApproveJoinRequestReqSerializer =
    new _$GVerifyCodeAndApproveJoinRequestReqSerializer();
Serializer<GCreateVerificationCodeByJoinRequestReq>
    _$gCreateVerificationCodeByJoinRequestReqSerializer =
    new _$GCreateVerificationCodeByJoinRequestReqSerializer();

class _$GCreateBusinessCardApprovalTicketReqSerializer
    implements StructuredSerializer<GCreateBusinessCardApprovalTicketReq> {
  @override
  final Iterable<Type> types = const [
    GCreateBusinessCardApprovalTicketReq,
    _$GCreateBusinessCardApprovalTicketReq
  ];
  @override
  final String wireName = 'GCreateBusinessCardApprovalTicketReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateBusinessCardApprovalTicketReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType:
              const FullType(_i3.GCreateBusinessCardApprovalTicketVars)),
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
            specifiedType:
                const FullType(_i2.GCreateBusinessCardApprovalTicketData)));
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
  GCreateBusinessCardApprovalTicketReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateBusinessCardApprovalTicketReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      _i3.GCreateBusinessCardApprovalTicketVars))!
              as _i3.GCreateBusinessCardApprovalTicketVars);
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
                  specifiedType: const FullType(
                      _i2.GCreateBusinessCardApprovalTicketData))!
              as _i2.GCreateBusinessCardApprovalTicketData);
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

class _$GCreateVerificationCodeReqSerializer
    implements StructuredSerializer<GCreateVerificationCodeReq> {
  @override
  final Iterable<Type> types = const [
    GCreateVerificationCodeReq,
    _$GCreateVerificationCodeReq
  ];
  @override
  final String wireName = 'GCreateVerificationCodeReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateVerificationCodeReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GCreateVerificationCodeVars)),
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
            specifiedType: const FullType(_i2.GCreateVerificationCodeData)));
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
  GCreateVerificationCodeReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateVerificationCodeReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i3.GCreateVerificationCodeVars))!
              as _i3.GCreateVerificationCodeVars);
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
                      const FullType(_i2.GCreateVerificationCodeData))!
              as _i2.GCreateVerificationCodeData);
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

class _$GVerifyCodeAndApproveJoinRequestReqSerializer
    implements StructuredSerializer<GVerifyCodeAndApproveJoinRequestReq> {
  @override
  final Iterable<Type> types = const [
    GVerifyCodeAndApproveJoinRequestReq,
    _$GVerifyCodeAndApproveJoinRequestReq
  ];
  @override
  final String wireName = 'GVerifyCodeAndApproveJoinRequestReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GVerifyCodeAndApproveJoinRequestReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType:
              const FullType(_i3.GVerifyCodeAndApproveJoinRequestVars)),
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
            specifiedType:
                const FullType(_i2.GVerifyCodeAndApproveJoinRequestData)));
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
  GVerifyCodeAndApproveJoinRequestReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GVerifyCodeAndApproveJoinRequestReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i3.GVerifyCodeAndApproveJoinRequestVars))!
              as _i3.GVerifyCodeAndApproveJoinRequestVars);
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
                      const FullType(_i2.GVerifyCodeAndApproveJoinRequestData))!
              as _i2.GVerifyCodeAndApproveJoinRequestData);
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

class _$GCreateVerificationCodeByJoinRequestReqSerializer
    implements StructuredSerializer<GCreateVerificationCodeByJoinRequestReq> {
  @override
  final Iterable<Type> types = const [
    GCreateVerificationCodeByJoinRequestReq,
    _$GCreateVerificationCodeByJoinRequestReq
  ];
  @override
  final String wireName = 'GCreateVerificationCodeByJoinRequestReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateVerificationCodeByJoinRequestReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType:
              const FullType(_i3.GCreateVerificationCodeByJoinRequestVars)),
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
            specifiedType:
                const FullType(_i2.GCreateVerificationCodeByJoinRequestData)));
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
  GCreateVerificationCodeByJoinRequestReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateVerificationCodeByJoinRequestReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      _i3.GCreateVerificationCodeByJoinRequestVars))!
              as _i3.GCreateVerificationCodeByJoinRequestVars);
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
                  specifiedType: const FullType(
                      _i2.GCreateVerificationCodeByJoinRequestData))!
              as _i2.GCreateVerificationCodeByJoinRequestData);
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

class _$GCreateBusinessCardApprovalTicketReq
    extends GCreateBusinessCardApprovalTicketReq {
  @override
  final _i3.GCreateBusinessCardApprovalTicketVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String? requestId;
  @override
  final _i2.GCreateBusinessCardApprovalTicketData? Function(
      _i2.GCreateBusinessCardApprovalTicketData?,
      _i2.GCreateBusinessCardApprovalTicketData?)? updateResult;
  @override
  final _i2.GCreateBusinessCardApprovalTicketData? optimisticResponse;
  @override
  final String? updateCacheHandlerKey;
  @override
  final Map<String, dynamic>? updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy? fetchPolicy;
  @override
  final bool executeOnListen;

  factory _$GCreateBusinessCardApprovalTicketReq(
          [void Function(GCreateBusinessCardApprovalTicketReqBuilder)?
              updates]) =>
      (new GCreateBusinessCardApprovalTicketReqBuilder()..update(updates))
          .build();

  _$GCreateBusinessCardApprovalTicketReq._(
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
        vars, 'GCreateBusinessCardApprovalTicketReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GCreateBusinessCardApprovalTicketReq', 'operation');
    BuiltValueNullFieldError.checkNotNull(executeOnListen,
        'GCreateBusinessCardApprovalTicketReq', 'executeOnListen');
  }

  @override
  GCreateBusinessCardApprovalTicketReq rebuild(
          void Function(GCreateBusinessCardApprovalTicketReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateBusinessCardApprovalTicketReqBuilder toBuilder() =>
      new GCreateBusinessCardApprovalTicketReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GCreateBusinessCardApprovalTicketReq &&
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
    return (newBuiltValueToStringHelper('GCreateBusinessCardApprovalTicketReq')
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

class GCreateBusinessCardApprovalTicketReqBuilder
    implements
        Builder<GCreateBusinessCardApprovalTicketReq,
            GCreateBusinessCardApprovalTicketReqBuilder> {
  _$GCreateBusinessCardApprovalTicketReq? _$v;

  _i3.GCreateBusinessCardApprovalTicketVarsBuilder? _vars;
  _i3.GCreateBusinessCardApprovalTicketVarsBuilder get vars =>
      _$this._vars ??= new _i3.GCreateBusinessCardApprovalTicketVarsBuilder();
  set vars(_i3.GCreateBusinessCardApprovalTicketVarsBuilder? vars) =>
      _$this._vars = vars;

  _i4.Operation? _operation;
  _i4.Operation? get operation => _$this._operation;
  set operation(_i4.Operation? operation) => _$this._operation = operation;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  _i2.GCreateBusinessCardApprovalTicketData? Function(
      _i2.GCreateBusinessCardApprovalTicketData?,
      _i2.GCreateBusinessCardApprovalTicketData?)? _updateResult;
  _i2.GCreateBusinessCardApprovalTicketData? Function(
          _i2.GCreateBusinessCardApprovalTicketData?,
          _i2.GCreateBusinessCardApprovalTicketData?)?
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GCreateBusinessCardApprovalTicketData? Function(
                  _i2.GCreateBusinessCardApprovalTicketData?,
                  _i2.GCreateBusinessCardApprovalTicketData?)?
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GCreateBusinessCardApprovalTicketDataBuilder? _optimisticResponse;
  _i2.GCreateBusinessCardApprovalTicketDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??=
          new _i2.GCreateBusinessCardApprovalTicketDataBuilder();
  set optimisticResponse(
          _i2.GCreateBusinessCardApprovalTicketDataBuilder?
              optimisticResponse) =>
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

  GCreateBusinessCardApprovalTicketReqBuilder() {
    GCreateBusinessCardApprovalTicketReq._initializeBuilder(this);
  }

  GCreateBusinessCardApprovalTicketReqBuilder get _$this {
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
  void replace(GCreateBusinessCardApprovalTicketReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateBusinessCardApprovalTicketReq;
  }

  @override
  void update(
      void Function(GCreateBusinessCardApprovalTicketReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCreateBusinessCardApprovalTicketReq build() {
    _$GCreateBusinessCardApprovalTicketReq _$result;
    try {
      _$result = _$v ??
          new _$GCreateBusinessCardApprovalTicketReq._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(operation,
                  'GCreateBusinessCardApprovalTicketReq', 'operation'),
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: BuiltValueNullFieldError.checkNotNull(
                  executeOnListen,
                  'GCreateBusinessCardApprovalTicketReq',
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
            'GCreateBusinessCardApprovalTicketReq',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateVerificationCodeReq extends GCreateVerificationCodeReq {
  @override
  final _i3.GCreateVerificationCodeVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String? requestId;
  @override
  final _i2.GCreateVerificationCodeData? Function(
          _i2.GCreateVerificationCodeData?, _i2.GCreateVerificationCodeData?)?
      updateResult;
  @override
  final _i2.GCreateVerificationCodeData? optimisticResponse;
  @override
  final String? updateCacheHandlerKey;
  @override
  final Map<String, dynamic>? updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy? fetchPolicy;
  @override
  final bool executeOnListen;

  factory _$GCreateVerificationCodeReq(
          [void Function(GCreateVerificationCodeReqBuilder)? updates]) =>
      (new GCreateVerificationCodeReqBuilder()..update(updates)).build();

  _$GCreateVerificationCodeReq._(
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
        vars, 'GCreateVerificationCodeReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GCreateVerificationCodeReq', 'operation');
    BuiltValueNullFieldError.checkNotNull(
        executeOnListen, 'GCreateVerificationCodeReq', 'executeOnListen');
  }

  @override
  GCreateVerificationCodeReq rebuild(
          void Function(GCreateVerificationCodeReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateVerificationCodeReqBuilder toBuilder() =>
      new GCreateVerificationCodeReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GCreateVerificationCodeReq &&
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
    return (newBuiltValueToStringHelper('GCreateVerificationCodeReq')
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

class GCreateVerificationCodeReqBuilder
    implements
        Builder<GCreateVerificationCodeReq, GCreateVerificationCodeReqBuilder> {
  _$GCreateVerificationCodeReq? _$v;

  _i3.GCreateVerificationCodeVarsBuilder? _vars;
  _i3.GCreateVerificationCodeVarsBuilder get vars =>
      _$this._vars ??= new _i3.GCreateVerificationCodeVarsBuilder();
  set vars(_i3.GCreateVerificationCodeVarsBuilder? vars) => _$this._vars = vars;

  _i4.Operation? _operation;
  _i4.Operation? get operation => _$this._operation;
  set operation(_i4.Operation? operation) => _$this._operation = operation;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  _i2.GCreateVerificationCodeData? Function(
          _i2.GCreateVerificationCodeData?, _i2.GCreateVerificationCodeData?)?
      _updateResult;
  _i2.GCreateVerificationCodeData? Function(
          _i2.GCreateVerificationCodeData?, _i2.GCreateVerificationCodeData?)?
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GCreateVerificationCodeData? Function(
                  _i2.GCreateVerificationCodeData?,
                  _i2.GCreateVerificationCodeData?)?
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GCreateVerificationCodeDataBuilder? _optimisticResponse;
  _i2.GCreateVerificationCodeDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??=
          new _i2.GCreateVerificationCodeDataBuilder();
  set optimisticResponse(
          _i2.GCreateVerificationCodeDataBuilder? optimisticResponse) =>
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

  GCreateVerificationCodeReqBuilder() {
    GCreateVerificationCodeReq._initializeBuilder(this);
  }

  GCreateVerificationCodeReqBuilder get _$this {
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
  void replace(GCreateVerificationCodeReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateVerificationCodeReq;
  }

  @override
  void update(void Function(GCreateVerificationCodeReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCreateVerificationCodeReq build() {
    _$GCreateVerificationCodeReq _$result;
    try {
      _$result = _$v ??
          new _$GCreateVerificationCodeReq._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, 'GCreateVerificationCodeReq', 'operation'),
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: BuiltValueNullFieldError.checkNotNull(
                  executeOnListen,
                  'GCreateVerificationCodeReq',
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
            'GCreateVerificationCodeReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GVerifyCodeAndApproveJoinRequestReq
    extends GVerifyCodeAndApproveJoinRequestReq {
  @override
  final _i3.GVerifyCodeAndApproveJoinRequestVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String? requestId;
  @override
  final _i2.GVerifyCodeAndApproveJoinRequestData? Function(
      _i2.GVerifyCodeAndApproveJoinRequestData?,
      _i2.GVerifyCodeAndApproveJoinRequestData?)? updateResult;
  @override
  final _i2.GVerifyCodeAndApproveJoinRequestData? optimisticResponse;
  @override
  final String? updateCacheHandlerKey;
  @override
  final Map<String, dynamic>? updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy? fetchPolicy;
  @override
  final bool executeOnListen;

  factory _$GVerifyCodeAndApproveJoinRequestReq(
          [void Function(GVerifyCodeAndApproveJoinRequestReqBuilder)?
              updates]) =>
      (new GVerifyCodeAndApproveJoinRequestReqBuilder()..update(updates))
          .build();

  _$GVerifyCodeAndApproveJoinRequestReq._(
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
        vars, 'GVerifyCodeAndApproveJoinRequestReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GVerifyCodeAndApproveJoinRequestReq', 'operation');
    BuiltValueNullFieldError.checkNotNull(executeOnListen,
        'GVerifyCodeAndApproveJoinRequestReq', 'executeOnListen');
  }

  @override
  GVerifyCodeAndApproveJoinRequestReq rebuild(
          void Function(GVerifyCodeAndApproveJoinRequestReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GVerifyCodeAndApproveJoinRequestReqBuilder toBuilder() =>
      new GVerifyCodeAndApproveJoinRequestReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GVerifyCodeAndApproveJoinRequestReq &&
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
    return (newBuiltValueToStringHelper('GVerifyCodeAndApproveJoinRequestReq')
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

class GVerifyCodeAndApproveJoinRequestReqBuilder
    implements
        Builder<GVerifyCodeAndApproveJoinRequestReq,
            GVerifyCodeAndApproveJoinRequestReqBuilder> {
  _$GVerifyCodeAndApproveJoinRequestReq? _$v;

  _i3.GVerifyCodeAndApproveJoinRequestVarsBuilder? _vars;
  _i3.GVerifyCodeAndApproveJoinRequestVarsBuilder get vars =>
      _$this._vars ??= new _i3.GVerifyCodeAndApproveJoinRequestVarsBuilder();
  set vars(_i3.GVerifyCodeAndApproveJoinRequestVarsBuilder? vars) =>
      _$this._vars = vars;

  _i4.Operation? _operation;
  _i4.Operation? get operation => _$this._operation;
  set operation(_i4.Operation? operation) => _$this._operation = operation;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  _i2.GVerifyCodeAndApproveJoinRequestData? Function(
      _i2.GVerifyCodeAndApproveJoinRequestData?,
      _i2.GVerifyCodeAndApproveJoinRequestData?)? _updateResult;
  _i2.GVerifyCodeAndApproveJoinRequestData? Function(
          _i2.GVerifyCodeAndApproveJoinRequestData?,
          _i2.GVerifyCodeAndApproveJoinRequestData?)?
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GVerifyCodeAndApproveJoinRequestData? Function(
                  _i2.GVerifyCodeAndApproveJoinRequestData?,
                  _i2.GVerifyCodeAndApproveJoinRequestData?)?
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GVerifyCodeAndApproveJoinRequestDataBuilder? _optimisticResponse;
  _i2.GVerifyCodeAndApproveJoinRequestDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??=
          new _i2.GVerifyCodeAndApproveJoinRequestDataBuilder();
  set optimisticResponse(
          _i2.GVerifyCodeAndApproveJoinRequestDataBuilder?
              optimisticResponse) =>
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

  GVerifyCodeAndApproveJoinRequestReqBuilder() {
    GVerifyCodeAndApproveJoinRequestReq._initializeBuilder(this);
  }

  GVerifyCodeAndApproveJoinRequestReqBuilder get _$this {
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
  void replace(GVerifyCodeAndApproveJoinRequestReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GVerifyCodeAndApproveJoinRequestReq;
  }

  @override
  void update(
      void Function(GVerifyCodeAndApproveJoinRequestReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GVerifyCodeAndApproveJoinRequestReq build() {
    _$GVerifyCodeAndApproveJoinRequestReq _$result;
    try {
      _$result = _$v ??
          new _$GVerifyCodeAndApproveJoinRequestReq._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(operation,
                  'GVerifyCodeAndApproveJoinRequestReq', 'operation'),
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: BuiltValueNullFieldError.checkNotNull(
                  executeOnListen,
                  'GVerifyCodeAndApproveJoinRequestReq',
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
            'GVerifyCodeAndApproveJoinRequestReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateVerificationCodeByJoinRequestReq
    extends GCreateVerificationCodeByJoinRequestReq {
  @override
  final _i3.GCreateVerificationCodeByJoinRequestVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String? requestId;
  @override
  final _i2.GCreateVerificationCodeByJoinRequestData? Function(
      _i2.GCreateVerificationCodeByJoinRequestData?,
      _i2.GCreateVerificationCodeByJoinRequestData?)? updateResult;
  @override
  final _i2.GCreateVerificationCodeByJoinRequestData? optimisticResponse;
  @override
  final String? updateCacheHandlerKey;
  @override
  final Map<String, dynamic>? updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy? fetchPolicy;
  @override
  final bool executeOnListen;

  factory _$GCreateVerificationCodeByJoinRequestReq(
          [void Function(GCreateVerificationCodeByJoinRequestReqBuilder)?
              updates]) =>
      (new GCreateVerificationCodeByJoinRequestReqBuilder()..update(updates))
          .build();

  _$GCreateVerificationCodeByJoinRequestReq._(
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
        vars, 'GCreateVerificationCodeByJoinRequestReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GCreateVerificationCodeByJoinRequestReq', 'operation');
    BuiltValueNullFieldError.checkNotNull(executeOnListen,
        'GCreateVerificationCodeByJoinRequestReq', 'executeOnListen');
  }

  @override
  GCreateVerificationCodeByJoinRequestReq rebuild(
          void Function(GCreateVerificationCodeByJoinRequestReqBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateVerificationCodeByJoinRequestReqBuilder toBuilder() =>
      new GCreateVerificationCodeByJoinRequestReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GCreateVerificationCodeByJoinRequestReq &&
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
    return (newBuiltValueToStringHelper(
            'GCreateVerificationCodeByJoinRequestReq')
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

class GCreateVerificationCodeByJoinRequestReqBuilder
    implements
        Builder<GCreateVerificationCodeByJoinRequestReq,
            GCreateVerificationCodeByJoinRequestReqBuilder> {
  _$GCreateVerificationCodeByJoinRequestReq? _$v;

  _i3.GCreateVerificationCodeByJoinRequestVarsBuilder? _vars;
  _i3.GCreateVerificationCodeByJoinRequestVarsBuilder get vars =>
      _$this._vars ??=
          new _i3.GCreateVerificationCodeByJoinRequestVarsBuilder();
  set vars(_i3.GCreateVerificationCodeByJoinRequestVarsBuilder? vars) =>
      _$this._vars = vars;

  _i4.Operation? _operation;
  _i4.Operation? get operation => _$this._operation;
  set operation(_i4.Operation? operation) => _$this._operation = operation;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  _i2.GCreateVerificationCodeByJoinRequestData? Function(
      _i2.GCreateVerificationCodeByJoinRequestData?,
      _i2.GCreateVerificationCodeByJoinRequestData?)? _updateResult;
  _i2.GCreateVerificationCodeByJoinRequestData? Function(
          _i2.GCreateVerificationCodeByJoinRequestData?,
          _i2.GCreateVerificationCodeByJoinRequestData?)?
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GCreateVerificationCodeByJoinRequestData? Function(
                  _i2.GCreateVerificationCodeByJoinRequestData?,
                  _i2.GCreateVerificationCodeByJoinRequestData?)?
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GCreateVerificationCodeByJoinRequestDataBuilder? _optimisticResponse;
  _i2.GCreateVerificationCodeByJoinRequestDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??=
          new _i2.GCreateVerificationCodeByJoinRequestDataBuilder();
  set optimisticResponse(
          _i2.GCreateVerificationCodeByJoinRequestDataBuilder?
              optimisticResponse) =>
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

  GCreateVerificationCodeByJoinRequestReqBuilder() {
    GCreateVerificationCodeByJoinRequestReq._initializeBuilder(this);
  }

  GCreateVerificationCodeByJoinRequestReqBuilder get _$this {
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
  void replace(GCreateVerificationCodeByJoinRequestReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateVerificationCodeByJoinRequestReq;
  }

  @override
  void update(
      void Function(GCreateVerificationCodeByJoinRequestReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCreateVerificationCodeByJoinRequestReq build() {
    _$GCreateVerificationCodeByJoinRequestReq _$result;
    try {
      _$result = _$v ??
          new _$GCreateVerificationCodeByJoinRequestReq._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(operation,
                  'GCreateVerificationCodeByJoinRequestReq', 'operation'),
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: BuiltValueNullFieldError.checkNotNull(
                  executeOnListen,
                  'GCreateVerificationCodeByJoinRequestReq',
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
            'GCreateVerificationCodeByJoinRequestReq',
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
