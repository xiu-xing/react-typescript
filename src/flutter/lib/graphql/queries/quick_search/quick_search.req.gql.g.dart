// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quick_search.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GQuickSearchTrendingReq> _$gQuickSearchTrendingReqSerializer =
    new _$GQuickSearchTrendingReqSerializer();
Serializer<GQuickSearchLatestViewReq> _$gQuickSearchLatestViewReqSerializer =
    new _$GQuickSearchLatestViewReqSerializer();
Serializer<GQuickSearchTabsReq> _$gQuickSearchTabsReqSerializer =
    new _$GQuickSearchTabsReqSerializer();
Serializer<GQuickSearchReq> _$gQuickSearchReqSerializer =
    new _$GQuickSearchReqSerializer();
Serializer<GIncrementEntityClickThroughReq>
    _$gIncrementEntityClickThroughReqSerializer =
    new _$GIncrementEntityClickThroughReqSerializer();

class _$GQuickSearchTrendingReqSerializer
    implements StructuredSerializer<GQuickSearchTrendingReq> {
  @override
  final Iterable<Type> types = const [
    GQuickSearchTrendingReq,
    _$GQuickSearchTrendingReq
  ];
  @override
  final String wireName = 'GQuickSearchTrendingReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GQuickSearchTrendingReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GQuickSearchTrendingVars)),
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
            specifiedType: const FullType(_i2.GQuickSearchTrendingData)));
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
  GQuickSearchTrendingReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQuickSearchTrendingReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GQuickSearchTrendingVars))!
              as _i3.GQuickSearchTrendingVars);
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
                  specifiedType: const FullType(_i2.GQuickSearchTrendingData))!
              as _i2.GQuickSearchTrendingData);
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

class _$GQuickSearchLatestViewReqSerializer
    implements StructuredSerializer<GQuickSearchLatestViewReq> {
  @override
  final Iterable<Type> types = const [
    GQuickSearchLatestViewReq,
    _$GQuickSearchLatestViewReq
  ];
  @override
  final String wireName = 'GQuickSearchLatestViewReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GQuickSearchLatestViewReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GQuickSearchLatestViewVars)),
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
            specifiedType: const FullType(_i2.GQuickSearchLatestViewData)));
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
  GQuickSearchLatestViewReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQuickSearchLatestViewReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i3.GQuickSearchLatestViewVars))!
              as _i3.GQuickSearchLatestViewVars);
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
                      const FullType(_i2.GQuickSearchLatestViewData))!
              as _i2.GQuickSearchLatestViewData);
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

class _$GQuickSearchTabsReqSerializer
    implements StructuredSerializer<GQuickSearchTabsReq> {
  @override
  final Iterable<Type> types = const [
    GQuickSearchTabsReq,
    _$GQuickSearchTabsReq
  ];
  @override
  final String wireName = 'GQuickSearchTabsReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GQuickSearchTabsReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GQuickSearchTabsVars)),
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
            specifiedType: const FullType(_i2.GQuickSearchTabsData)));
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
  GQuickSearchTabsReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQuickSearchTabsReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GQuickSearchTabsVars))!
              as _i3.GQuickSearchTabsVars);
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
                  specifiedType: const FullType(_i2.GQuickSearchTabsData))!
              as _i2.GQuickSearchTabsData);
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

class _$GQuickSearchReqSerializer
    implements StructuredSerializer<GQuickSearchReq> {
  @override
  final Iterable<Type> types = const [GQuickSearchReq, _$GQuickSearchReq];
  @override
  final String wireName = 'GQuickSearchReq';

  @override
  Iterable<Object?> serialize(Serializers serializers, GQuickSearchReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GQuickSearchVars)),
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
            specifiedType: const FullType(_i2.GQuickSearchData)));
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
  GQuickSearchReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQuickSearchReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GQuickSearchVars))!
              as _i3.GQuickSearchVars);
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
                  specifiedType: const FullType(_i2.GQuickSearchData))!
              as _i2.GQuickSearchData);
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

class _$GIncrementEntityClickThroughReqSerializer
    implements StructuredSerializer<GIncrementEntityClickThroughReq> {
  @override
  final Iterable<Type> types = const [
    GIncrementEntityClickThroughReq,
    _$GIncrementEntityClickThroughReq
  ];
  @override
  final String wireName = 'GIncrementEntityClickThroughReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GIncrementEntityClickThroughReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GIncrementEntityClickThroughVars)),
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
                const FullType(_i2.GIncrementEntityClickThroughData)));
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
  GIncrementEntityClickThroughReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GIncrementEntityClickThroughReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i3.GIncrementEntityClickThroughVars))!
              as _i3.GIncrementEntityClickThroughVars);
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
                      const FullType(_i2.GIncrementEntityClickThroughData))!
              as _i2.GIncrementEntityClickThroughData);
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

class _$GQuickSearchTrendingReq extends GQuickSearchTrendingReq {
  @override
  final _i3.GQuickSearchTrendingVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String? requestId;
  @override
  final _i2.GQuickSearchTrendingData? Function(
          _i2.GQuickSearchTrendingData?, _i2.GQuickSearchTrendingData?)?
      updateResult;
  @override
  final _i2.GQuickSearchTrendingData? optimisticResponse;
  @override
  final String? updateCacheHandlerKey;
  @override
  final Map<String, dynamic>? updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy? fetchPolicy;
  @override
  final bool executeOnListen;

  factory _$GQuickSearchTrendingReq(
          [void Function(GQuickSearchTrendingReqBuilder)? updates]) =>
      (new GQuickSearchTrendingReqBuilder()..update(updates)).build();

  _$GQuickSearchTrendingReq._(
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
        vars, 'GQuickSearchTrendingReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GQuickSearchTrendingReq', 'operation');
    BuiltValueNullFieldError.checkNotNull(
        executeOnListen, 'GQuickSearchTrendingReq', 'executeOnListen');
  }

  @override
  GQuickSearchTrendingReq rebuild(
          void Function(GQuickSearchTrendingReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQuickSearchTrendingReqBuilder toBuilder() =>
      new GQuickSearchTrendingReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GQuickSearchTrendingReq &&
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
    return (newBuiltValueToStringHelper('GQuickSearchTrendingReq')
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

class GQuickSearchTrendingReqBuilder
    implements
        Builder<GQuickSearchTrendingReq, GQuickSearchTrendingReqBuilder> {
  _$GQuickSearchTrendingReq? _$v;

  _i3.GQuickSearchTrendingVarsBuilder? _vars;
  _i3.GQuickSearchTrendingVarsBuilder get vars =>
      _$this._vars ??= new _i3.GQuickSearchTrendingVarsBuilder();
  set vars(_i3.GQuickSearchTrendingVarsBuilder? vars) => _$this._vars = vars;

  _i4.Operation? _operation;
  _i4.Operation? get operation => _$this._operation;
  set operation(_i4.Operation? operation) => _$this._operation = operation;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  _i2.GQuickSearchTrendingData? Function(
          _i2.GQuickSearchTrendingData?, _i2.GQuickSearchTrendingData?)?
      _updateResult;
  _i2.GQuickSearchTrendingData? Function(
          _i2.GQuickSearchTrendingData?, _i2.GQuickSearchTrendingData?)?
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GQuickSearchTrendingData? Function(
                  _i2.GQuickSearchTrendingData?, _i2.GQuickSearchTrendingData?)?
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GQuickSearchTrendingDataBuilder? _optimisticResponse;
  _i2.GQuickSearchTrendingDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??= new _i2.GQuickSearchTrendingDataBuilder();
  set optimisticResponse(
          _i2.GQuickSearchTrendingDataBuilder? optimisticResponse) =>
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

  GQuickSearchTrendingReqBuilder() {
    GQuickSearchTrendingReq._initializeBuilder(this);
  }

  GQuickSearchTrendingReqBuilder get _$this {
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
  void replace(GQuickSearchTrendingReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQuickSearchTrendingReq;
  }

  @override
  void update(void Function(GQuickSearchTrendingReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQuickSearchTrendingReq build() {
    _$GQuickSearchTrendingReq _$result;
    try {
      _$result = _$v ??
          new _$GQuickSearchTrendingReq._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, 'GQuickSearchTrendingReq', 'operation'),
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: BuiltValueNullFieldError.checkNotNull(
                  executeOnListen,
                  'GQuickSearchTrendingReq',
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
            'GQuickSearchTrendingReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GQuickSearchLatestViewReq extends GQuickSearchLatestViewReq {
  @override
  final _i3.GQuickSearchLatestViewVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String? requestId;
  @override
  final _i2.GQuickSearchLatestViewData? Function(
          _i2.GQuickSearchLatestViewData?, _i2.GQuickSearchLatestViewData?)?
      updateResult;
  @override
  final _i2.GQuickSearchLatestViewData? optimisticResponse;
  @override
  final String? updateCacheHandlerKey;
  @override
  final Map<String, dynamic>? updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy? fetchPolicy;
  @override
  final bool executeOnListen;

  factory _$GQuickSearchLatestViewReq(
          [void Function(GQuickSearchLatestViewReqBuilder)? updates]) =>
      (new GQuickSearchLatestViewReqBuilder()..update(updates)).build();

  _$GQuickSearchLatestViewReq._(
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
        vars, 'GQuickSearchLatestViewReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GQuickSearchLatestViewReq', 'operation');
    BuiltValueNullFieldError.checkNotNull(
        executeOnListen, 'GQuickSearchLatestViewReq', 'executeOnListen');
  }

  @override
  GQuickSearchLatestViewReq rebuild(
          void Function(GQuickSearchLatestViewReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQuickSearchLatestViewReqBuilder toBuilder() =>
      new GQuickSearchLatestViewReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GQuickSearchLatestViewReq &&
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
    return (newBuiltValueToStringHelper('GQuickSearchLatestViewReq')
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

class GQuickSearchLatestViewReqBuilder
    implements
        Builder<GQuickSearchLatestViewReq, GQuickSearchLatestViewReqBuilder> {
  _$GQuickSearchLatestViewReq? _$v;

  _i3.GQuickSearchLatestViewVarsBuilder? _vars;
  _i3.GQuickSearchLatestViewVarsBuilder get vars =>
      _$this._vars ??= new _i3.GQuickSearchLatestViewVarsBuilder();
  set vars(_i3.GQuickSearchLatestViewVarsBuilder? vars) => _$this._vars = vars;

  _i4.Operation? _operation;
  _i4.Operation? get operation => _$this._operation;
  set operation(_i4.Operation? operation) => _$this._operation = operation;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  _i2.GQuickSearchLatestViewData? Function(
          _i2.GQuickSearchLatestViewData?, _i2.GQuickSearchLatestViewData?)?
      _updateResult;
  _i2.GQuickSearchLatestViewData? Function(
          _i2.GQuickSearchLatestViewData?, _i2.GQuickSearchLatestViewData?)?
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GQuickSearchLatestViewData? Function(
                  _i2.GQuickSearchLatestViewData?,
                  _i2.GQuickSearchLatestViewData?)?
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GQuickSearchLatestViewDataBuilder? _optimisticResponse;
  _i2.GQuickSearchLatestViewDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??=
          new _i2.GQuickSearchLatestViewDataBuilder();
  set optimisticResponse(
          _i2.GQuickSearchLatestViewDataBuilder? optimisticResponse) =>
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

  GQuickSearchLatestViewReqBuilder() {
    GQuickSearchLatestViewReq._initializeBuilder(this);
  }

  GQuickSearchLatestViewReqBuilder get _$this {
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
  void replace(GQuickSearchLatestViewReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQuickSearchLatestViewReq;
  }

  @override
  void update(void Function(GQuickSearchLatestViewReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQuickSearchLatestViewReq build() {
    _$GQuickSearchLatestViewReq _$result;
    try {
      _$result = _$v ??
          new _$GQuickSearchLatestViewReq._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, 'GQuickSearchLatestViewReq', 'operation'),
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: BuiltValueNullFieldError.checkNotNull(
                  executeOnListen,
                  'GQuickSearchLatestViewReq',
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
            'GQuickSearchLatestViewReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GQuickSearchTabsReq extends GQuickSearchTabsReq {
  @override
  final _i3.GQuickSearchTabsVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String? requestId;
  @override
  final _i2.GQuickSearchTabsData? Function(
      _i2.GQuickSearchTabsData?, _i2.GQuickSearchTabsData?)? updateResult;
  @override
  final _i2.GQuickSearchTabsData? optimisticResponse;
  @override
  final String? updateCacheHandlerKey;
  @override
  final Map<String, dynamic>? updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy? fetchPolicy;
  @override
  final bool executeOnListen;

  factory _$GQuickSearchTabsReq(
          [void Function(GQuickSearchTabsReqBuilder)? updates]) =>
      (new GQuickSearchTabsReqBuilder()..update(updates)).build();

  _$GQuickSearchTabsReq._(
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
    BuiltValueNullFieldError.checkNotNull(vars, 'GQuickSearchTabsReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GQuickSearchTabsReq', 'operation');
    BuiltValueNullFieldError.checkNotNull(
        executeOnListen, 'GQuickSearchTabsReq', 'executeOnListen');
  }

  @override
  GQuickSearchTabsReq rebuild(
          void Function(GQuickSearchTabsReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQuickSearchTabsReqBuilder toBuilder() =>
      new GQuickSearchTabsReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GQuickSearchTabsReq &&
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
    return (newBuiltValueToStringHelper('GQuickSearchTabsReq')
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

class GQuickSearchTabsReqBuilder
    implements Builder<GQuickSearchTabsReq, GQuickSearchTabsReqBuilder> {
  _$GQuickSearchTabsReq? _$v;

  _i3.GQuickSearchTabsVarsBuilder? _vars;
  _i3.GQuickSearchTabsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GQuickSearchTabsVarsBuilder();
  set vars(_i3.GQuickSearchTabsVarsBuilder? vars) => _$this._vars = vars;

  _i4.Operation? _operation;
  _i4.Operation? get operation => _$this._operation;
  set operation(_i4.Operation? operation) => _$this._operation = operation;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  _i2.GQuickSearchTabsData? Function(
      _i2.GQuickSearchTabsData?, _i2.GQuickSearchTabsData?)? _updateResult;
  _i2.GQuickSearchTabsData? Function(
          _i2.GQuickSearchTabsData?, _i2.GQuickSearchTabsData?)?
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GQuickSearchTabsData? Function(
                  _i2.GQuickSearchTabsData?, _i2.GQuickSearchTabsData?)?
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GQuickSearchTabsDataBuilder? _optimisticResponse;
  _i2.GQuickSearchTabsDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??= new _i2.GQuickSearchTabsDataBuilder();
  set optimisticResponse(_i2.GQuickSearchTabsDataBuilder? optimisticResponse) =>
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

  GQuickSearchTabsReqBuilder() {
    GQuickSearchTabsReq._initializeBuilder(this);
  }

  GQuickSearchTabsReqBuilder get _$this {
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
  void replace(GQuickSearchTabsReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQuickSearchTabsReq;
  }

  @override
  void update(void Function(GQuickSearchTabsReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQuickSearchTabsReq build() {
    _$GQuickSearchTabsReq _$result;
    try {
      _$result = _$v ??
          new _$GQuickSearchTabsReq._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, 'GQuickSearchTabsReq', 'operation'),
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: BuiltValueNullFieldError.checkNotNull(
                  executeOnListen, 'GQuickSearchTabsReq', 'executeOnListen'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();

        _$failedField = 'optimisticResponse';
        _optimisticResponse?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GQuickSearchTabsReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GQuickSearchReq extends GQuickSearchReq {
  @override
  final _i3.GQuickSearchVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String? requestId;
  @override
  final _i2.GQuickSearchData? Function(
      _i2.GQuickSearchData?, _i2.GQuickSearchData?)? updateResult;
  @override
  final _i2.GQuickSearchData? optimisticResponse;
  @override
  final String? updateCacheHandlerKey;
  @override
  final Map<String, dynamic>? updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy? fetchPolicy;
  @override
  final bool executeOnListen;

  factory _$GQuickSearchReq([void Function(GQuickSearchReqBuilder)? updates]) =>
      (new GQuickSearchReqBuilder()..update(updates)).build();

  _$GQuickSearchReq._(
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
    BuiltValueNullFieldError.checkNotNull(vars, 'GQuickSearchReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GQuickSearchReq', 'operation');
    BuiltValueNullFieldError.checkNotNull(
        executeOnListen, 'GQuickSearchReq', 'executeOnListen');
  }

  @override
  GQuickSearchReq rebuild(void Function(GQuickSearchReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQuickSearchReqBuilder toBuilder() =>
      new GQuickSearchReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GQuickSearchReq &&
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
    return (newBuiltValueToStringHelper('GQuickSearchReq')
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

class GQuickSearchReqBuilder
    implements Builder<GQuickSearchReq, GQuickSearchReqBuilder> {
  _$GQuickSearchReq? _$v;

  _i3.GQuickSearchVarsBuilder? _vars;
  _i3.GQuickSearchVarsBuilder get vars =>
      _$this._vars ??= new _i3.GQuickSearchVarsBuilder();
  set vars(_i3.GQuickSearchVarsBuilder? vars) => _$this._vars = vars;

  _i4.Operation? _operation;
  _i4.Operation? get operation => _$this._operation;
  set operation(_i4.Operation? operation) => _$this._operation = operation;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  _i2.GQuickSearchData? Function(_i2.GQuickSearchData?, _i2.GQuickSearchData?)?
      _updateResult;
  _i2.GQuickSearchData? Function(_i2.GQuickSearchData?, _i2.GQuickSearchData?)?
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GQuickSearchData? Function(
                  _i2.GQuickSearchData?, _i2.GQuickSearchData?)?
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GQuickSearchDataBuilder? _optimisticResponse;
  _i2.GQuickSearchDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??= new _i2.GQuickSearchDataBuilder();
  set optimisticResponse(_i2.GQuickSearchDataBuilder? optimisticResponse) =>
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

  GQuickSearchReqBuilder() {
    GQuickSearchReq._initializeBuilder(this);
  }

  GQuickSearchReqBuilder get _$this {
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
  void replace(GQuickSearchReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQuickSearchReq;
  }

  @override
  void update(void Function(GQuickSearchReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQuickSearchReq build() {
    _$GQuickSearchReq _$result;
    try {
      _$result = _$v ??
          new _$GQuickSearchReq._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, 'GQuickSearchReq', 'operation'),
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: BuiltValueNullFieldError.checkNotNull(
                  executeOnListen, 'GQuickSearchReq', 'executeOnListen'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();

        _$failedField = 'optimisticResponse';
        _optimisticResponse?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GQuickSearchReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GIncrementEntityClickThroughReq
    extends GIncrementEntityClickThroughReq {
  @override
  final _i3.GIncrementEntityClickThroughVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String? requestId;
  @override
  final _i2.GIncrementEntityClickThroughData? Function(
      _i2.GIncrementEntityClickThroughData?,
      _i2.GIncrementEntityClickThroughData?)? updateResult;
  @override
  final _i2.GIncrementEntityClickThroughData? optimisticResponse;
  @override
  final String? updateCacheHandlerKey;
  @override
  final Map<String, dynamic>? updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy? fetchPolicy;
  @override
  final bool executeOnListen;

  factory _$GIncrementEntityClickThroughReq(
          [void Function(GIncrementEntityClickThroughReqBuilder)? updates]) =>
      (new GIncrementEntityClickThroughReqBuilder()..update(updates)).build();

  _$GIncrementEntityClickThroughReq._(
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
        vars, 'GIncrementEntityClickThroughReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GIncrementEntityClickThroughReq', 'operation');
    BuiltValueNullFieldError.checkNotNull(
        executeOnListen, 'GIncrementEntityClickThroughReq', 'executeOnListen');
  }

  @override
  GIncrementEntityClickThroughReq rebuild(
          void Function(GIncrementEntityClickThroughReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GIncrementEntityClickThroughReqBuilder toBuilder() =>
      new GIncrementEntityClickThroughReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GIncrementEntityClickThroughReq &&
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
    return (newBuiltValueToStringHelper('GIncrementEntityClickThroughReq')
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

class GIncrementEntityClickThroughReqBuilder
    implements
        Builder<GIncrementEntityClickThroughReq,
            GIncrementEntityClickThroughReqBuilder> {
  _$GIncrementEntityClickThroughReq? _$v;

  _i3.GIncrementEntityClickThroughVarsBuilder? _vars;
  _i3.GIncrementEntityClickThroughVarsBuilder get vars =>
      _$this._vars ??= new _i3.GIncrementEntityClickThroughVarsBuilder();
  set vars(_i3.GIncrementEntityClickThroughVarsBuilder? vars) =>
      _$this._vars = vars;

  _i4.Operation? _operation;
  _i4.Operation? get operation => _$this._operation;
  set operation(_i4.Operation? operation) => _$this._operation = operation;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  _i2.GIncrementEntityClickThroughData? Function(
      _i2.GIncrementEntityClickThroughData?,
      _i2.GIncrementEntityClickThroughData?)? _updateResult;
  _i2.GIncrementEntityClickThroughData? Function(
          _i2.GIncrementEntityClickThroughData?,
          _i2.GIncrementEntityClickThroughData?)?
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GIncrementEntityClickThroughData? Function(
                  _i2.GIncrementEntityClickThroughData?,
                  _i2.GIncrementEntityClickThroughData?)?
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GIncrementEntityClickThroughDataBuilder? _optimisticResponse;
  _i2.GIncrementEntityClickThroughDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??=
          new _i2.GIncrementEntityClickThroughDataBuilder();
  set optimisticResponse(
          _i2.GIncrementEntityClickThroughDataBuilder? optimisticResponse) =>
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

  GIncrementEntityClickThroughReqBuilder() {
    GIncrementEntityClickThroughReq._initializeBuilder(this);
  }

  GIncrementEntityClickThroughReqBuilder get _$this {
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
  void replace(GIncrementEntityClickThroughReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GIncrementEntityClickThroughReq;
  }

  @override
  void update(void Function(GIncrementEntityClickThroughReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GIncrementEntityClickThroughReq build() {
    _$GIncrementEntityClickThroughReq _$result;
    try {
      _$result = _$v ??
          new _$GIncrementEntityClickThroughReq._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, 'GIncrementEntityClickThroughReq', 'operation'),
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: BuiltValueNullFieldError.checkNotNull(
                  executeOnListen,
                  'GIncrementEntityClickThroughReq',
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
            'GIncrementEntityClickThroughReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
