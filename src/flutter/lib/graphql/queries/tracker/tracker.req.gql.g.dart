// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracker.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GTrackerRecommendationsReq> _$gTrackerRecommendationsReqSerializer =
    new _$GTrackerRecommendationsReqSerializer();
Serializer<GTrackedEntityCountReq> _$gTrackedEntityCountReqSerializer =
    new _$GTrackedEntityCountReqSerializer();
Serializer<GAppTrackerTimelineReq> _$gAppTrackerTimelineReqSerializer =
    new _$GAppTrackerTimelineReqSerializer();
Serializer<GAppTrackerTabsReq> _$gAppTrackerTabsReqSerializer =
    new _$GAppTrackerTabsReqSerializer();
Serializer<GTrackTagsReq> _$gTrackTagsReqSerializer =
    new _$GTrackTagsReqSerializer();
Serializer<GTrackedEntitiesReq> _$gTrackedEntitiesReqSerializer =
    new _$GTrackedEntitiesReqSerializer();
Serializer<GTrackableThemeReq> _$gTrackableThemeReqSerializer =
    new _$GTrackableThemeReqSerializer();
Serializer<GAppTimelineRowNodeFieldsReq>
    _$gAppTimelineRowNodeFieldsReqSerializer =
    new _$GAppTimelineRowNodeFieldsReqSerializer();

class _$GTrackerRecommendationsReqSerializer
    implements StructuredSerializer<GTrackerRecommendationsReq> {
  @override
  final Iterable<Type> types = const [
    GTrackerRecommendationsReq,
    _$GTrackerRecommendationsReq
  ];
  @override
  final String wireName = 'GTrackerRecommendationsReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GTrackerRecommendationsReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GTrackerRecommendationsVars)),
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
            specifiedType: const FullType(_i2.GTrackerRecommendationsData)));
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
  GTrackerRecommendationsReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTrackerRecommendationsReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i3.GTrackerRecommendationsVars))!
              as _i3.GTrackerRecommendationsVars);
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
                      const FullType(_i2.GTrackerRecommendationsData))!
              as _i2.GTrackerRecommendationsData);
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

class _$GTrackedEntityCountReqSerializer
    implements StructuredSerializer<GTrackedEntityCountReq> {
  @override
  final Iterable<Type> types = const [
    GTrackedEntityCountReq,
    _$GTrackedEntityCountReq
  ];
  @override
  final String wireName = 'GTrackedEntityCountReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GTrackedEntityCountReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GTrackedEntityCountVars)),
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
            specifiedType: const FullType(_i2.GTrackedEntityCountData)));
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
  GTrackedEntityCountReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTrackedEntityCountReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GTrackedEntityCountVars))!
              as _i3.GTrackedEntityCountVars);
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
                  specifiedType: const FullType(_i2.GTrackedEntityCountData))!
              as _i2.GTrackedEntityCountData);
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

class _$GAppTrackerTimelineReqSerializer
    implements StructuredSerializer<GAppTrackerTimelineReq> {
  @override
  final Iterable<Type> types = const [
    GAppTrackerTimelineReq,
    _$GAppTrackerTimelineReq
  ];
  @override
  final String wireName = 'GAppTrackerTimelineReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAppTrackerTimelineReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GAppTrackerTimelineVars)),
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
            specifiedType: const FullType(_i2.GAppTrackerTimelineData)));
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
  GAppTrackerTimelineReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAppTrackerTimelineReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GAppTrackerTimelineVars))!
              as _i3.GAppTrackerTimelineVars);
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
                  specifiedType: const FullType(_i2.GAppTrackerTimelineData))!
              as _i2.GAppTrackerTimelineData);
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

class _$GAppTrackerTabsReqSerializer
    implements StructuredSerializer<GAppTrackerTabsReq> {
  @override
  final Iterable<Type> types = const [GAppTrackerTabsReq, _$GAppTrackerTabsReq];
  @override
  final String wireName = 'GAppTrackerTabsReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAppTrackerTabsReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GAppTrackerTabsVars)),
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
            specifiedType: const FullType(_i2.GAppTrackerTabsData)));
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
  GAppTrackerTabsReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAppTrackerTabsReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GAppTrackerTabsVars))!
              as _i3.GAppTrackerTabsVars);
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
                  specifiedType: const FullType(_i2.GAppTrackerTabsData))!
              as _i2.GAppTrackerTabsData);
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

class _$GTrackTagsReqSerializer implements StructuredSerializer<GTrackTagsReq> {
  @override
  final Iterable<Type> types = const [GTrackTagsReq, _$GTrackTagsReq];
  @override
  final String wireName = 'GTrackTagsReq';

  @override
  Iterable<Object?> serialize(Serializers serializers, GTrackTagsReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GTrackTagsVars)),
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
            specifiedType: const FullType(_i2.GTrackTagsData)));
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
  GTrackTagsReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTrackTagsReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GTrackTagsVars))!
              as _i3.GTrackTagsVars);
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
                  specifiedType: const FullType(_i2.GTrackTagsData))!
              as _i2.GTrackTagsData);
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

class _$GTrackedEntitiesReqSerializer
    implements StructuredSerializer<GTrackedEntitiesReq> {
  @override
  final Iterable<Type> types = const [
    GTrackedEntitiesReq,
    _$GTrackedEntitiesReq
  ];
  @override
  final String wireName = 'GTrackedEntitiesReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GTrackedEntitiesReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GTrackedEntitiesVars)),
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
            specifiedType: const FullType(_i2.GTrackedEntitiesData)));
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
  GTrackedEntitiesReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTrackedEntitiesReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GTrackedEntitiesVars))!
              as _i3.GTrackedEntitiesVars);
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
                  specifiedType: const FullType(_i2.GTrackedEntitiesData))!
              as _i2.GTrackedEntitiesData);
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

class _$GTrackableThemeReqSerializer
    implements StructuredSerializer<GTrackableThemeReq> {
  @override
  final Iterable<Type> types = const [GTrackableThemeReq, _$GTrackableThemeReq];
  @override
  final String wireName = 'GTrackableThemeReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GTrackableThemeReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GTrackableThemeVars)),
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
            specifiedType: const FullType(_i2.GTrackableThemeData)));
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
  GTrackableThemeReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTrackableThemeReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GTrackableThemeVars))!
              as _i3.GTrackableThemeVars);
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
                  specifiedType: const FullType(_i2.GTrackableThemeData))!
              as _i2.GTrackableThemeData);
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

class _$GAppTimelineRowNodeFieldsReqSerializer
    implements StructuredSerializer<GAppTimelineRowNodeFieldsReq> {
  @override
  final Iterable<Type> types = const [
    GAppTimelineRowNodeFieldsReq,
    _$GAppTimelineRowNodeFieldsReq
  ];
  @override
  final String wireName = 'GAppTimelineRowNodeFieldsReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAppTimelineRowNodeFieldsReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GAppTimelineRowNodeFieldsVars)),
      'document',
      serializers.serialize(object.document,
          specifiedType: const FullType(_i7.DocumentNode)),
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
  GAppTimelineRowNodeFieldsReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAppTimelineRowNodeFieldsReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i3.GAppTimelineRowNodeFieldsVars))!
              as _i3.GAppTimelineRowNodeFieldsVars);
          break;
        case 'document':
          result.document = serializers.deserialize(value,
                  specifiedType: const FullType(_i7.DocumentNode))
              as _i7.DocumentNode;
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

class _$GTrackerRecommendationsReq extends GTrackerRecommendationsReq {
  @override
  final _i3.GTrackerRecommendationsVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String? requestId;
  @override
  final _i2.GTrackerRecommendationsData? Function(
          _i2.GTrackerRecommendationsData?, _i2.GTrackerRecommendationsData?)?
      updateResult;
  @override
  final _i2.GTrackerRecommendationsData? optimisticResponse;
  @override
  final String? updateCacheHandlerKey;
  @override
  final Map<String, dynamic>? updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy? fetchPolicy;
  @override
  final bool executeOnListen;

  factory _$GTrackerRecommendationsReq(
          [void Function(GTrackerRecommendationsReqBuilder)? updates]) =>
      (new GTrackerRecommendationsReqBuilder()..update(updates)).build();

  _$GTrackerRecommendationsReq._(
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
        vars, 'GTrackerRecommendationsReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GTrackerRecommendationsReq', 'operation');
    BuiltValueNullFieldError.checkNotNull(
        executeOnListen, 'GTrackerRecommendationsReq', 'executeOnListen');
  }

  @override
  GTrackerRecommendationsReq rebuild(
          void Function(GTrackerRecommendationsReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTrackerRecommendationsReqBuilder toBuilder() =>
      new GTrackerRecommendationsReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GTrackerRecommendationsReq &&
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
    return (newBuiltValueToStringHelper('GTrackerRecommendationsReq')
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

class GTrackerRecommendationsReqBuilder
    implements
        Builder<GTrackerRecommendationsReq, GTrackerRecommendationsReqBuilder> {
  _$GTrackerRecommendationsReq? _$v;

  _i3.GTrackerRecommendationsVarsBuilder? _vars;
  _i3.GTrackerRecommendationsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GTrackerRecommendationsVarsBuilder();
  set vars(_i3.GTrackerRecommendationsVarsBuilder? vars) => _$this._vars = vars;

  _i4.Operation? _operation;
  _i4.Operation? get operation => _$this._operation;
  set operation(_i4.Operation? operation) => _$this._operation = operation;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  _i2.GTrackerRecommendationsData? Function(
          _i2.GTrackerRecommendationsData?, _i2.GTrackerRecommendationsData?)?
      _updateResult;
  _i2.GTrackerRecommendationsData? Function(
          _i2.GTrackerRecommendationsData?, _i2.GTrackerRecommendationsData?)?
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GTrackerRecommendationsData? Function(
                  _i2.GTrackerRecommendationsData?,
                  _i2.GTrackerRecommendationsData?)?
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GTrackerRecommendationsDataBuilder? _optimisticResponse;
  _i2.GTrackerRecommendationsDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??=
          new _i2.GTrackerRecommendationsDataBuilder();
  set optimisticResponse(
          _i2.GTrackerRecommendationsDataBuilder? optimisticResponse) =>
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

  GTrackerRecommendationsReqBuilder() {
    GTrackerRecommendationsReq._initializeBuilder(this);
  }

  GTrackerRecommendationsReqBuilder get _$this {
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
  void replace(GTrackerRecommendationsReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTrackerRecommendationsReq;
  }

  @override
  void update(void Function(GTrackerRecommendationsReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GTrackerRecommendationsReq build() {
    _$GTrackerRecommendationsReq _$result;
    try {
      _$result = _$v ??
          new _$GTrackerRecommendationsReq._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, 'GTrackerRecommendationsReq', 'operation'),
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: BuiltValueNullFieldError.checkNotNull(
                  executeOnListen,
                  'GTrackerRecommendationsReq',
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
            'GTrackerRecommendationsReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GTrackedEntityCountReq extends GTrackedEntityCountReq {
  @override
  final _i3.GTrackedEntityCountVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String? requestId;
  @override
  final _i2.GTrackedEntityCountData? Function(
      _i2.GTrackedEntityCountData?, _i2.GTrackedEntityCountData?)? updateResult;
  @override
  final _i2.GTrackedEntityCountData? optimisticResponse;
  @override
  final String? updateCacheHandlerKey;
  @override
  final Map<String, dynamic>? updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy? fetchPolicy;
  @override
  final bool executeOnListen;

  factory _$GTrackedEntityCountReq(
          [void Function(GTrackedEntityCountReqBuilder)? updates]) =>
      (new GTrackedEntityCountReqBuilder()..update(updates)).build();

  _$GTrackedEntityCountReq._(
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
        vars, 'GTrackedEntityCountReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GTrackedEntityCountReq', 'operation');
    BuiltValueNullFieldError.checkNotNull(
        executeOnListen, 'GTrackedEntityCountReq', 'executeOnListen');
  }

  @override
  GTrackedEntityCountReq rebuild(
          void Function(GTrackedEntityCountReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTrackedEntityCountReqBuilder toBuilder() =>
      new GTrackedEntityCountReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GTrackedEntityCountReq &&
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
    return (newBuiltValueToStringHelper('GTrackedEntityCountReq')
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

class GTrackedEntityCountReqBuilder
    implements Builder<GTrackedEntityCountReq, GTrackedEntityCountReqBuilder> {
  _$GTrackedEntityCountReq? _$v;

  _i3.GTrackedEntityCountVarsBuilder? _vars;
  _i3.GTrackedEntityCountVarsBuilder get vars =>
      _$this._vars ??= new _i3.GTrackedEntityCountVarsBuilder();
  set vars(_i3.GTrackedEntityCountVarsBuilder? vars) => _$this._vars = vars;

  _i4.Operation? _operation;
  _i4.Operation? get operation => _$this._operation;
  set operation(_i4.Operation? operation) => _$this._operation = operation;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  _i2.GTrackedEntityCountData? Function(
          _i2.GTrackedEntityCountData?, _i2.GTrackedEntityCountData?)?
      _updateResult;
  _i2.GTrackedEntityCountData? Function(
          _i2.GTrackedEntityCountData?, _i2.GTrackedEntityCountData?)?
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GTrackedEntityCountData? Function(
                  _i2.GTrackedEntityCountData?, _i2.GTrackedEntityCountData?)?
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GTrackedEntityCountDataBuilder? _optimisticResponse;
  _i2.GTrackedEntityCountDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??= new _i2.GTrackedEntityCountDataBuilder();
  set optimisticResponse(
          _i2.GTrackedEntityCountDataBuilder? optimisticResponse) =>
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

  GTrackedEntityCountReqBuilder() {
    GTrackedEntityCountReq._initializeBuilder(this);
  }

  GTrackedEntityCountReqBuilder get _$this {
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
  void replace(GTrackedEntityCountReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTrackedEntityCountReq;
  }

  @override
  void update(void Function(GTrackedEntityCountReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GTrackedEntityCountReq build() {
    _$GTrackedEntityCountReq _$result;
    try {
      _$result = _$v ??
          new _$GTrackedEntityCountReq._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, 'GTrackedEntityCountReq', 'operation'),
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: BuiltValueNullFieldError.checkNotNull(
                  executeOnListen,
                  'GTrackedEntityCountReq',
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
            'GTrackedEntityCountReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAppTrackerTimelineReq extends GAppTrackerTimelineReq {
  @override
  final _i3.GAppTrackerTimelineVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String? requestId;
  @override
  final _i2.GAppTrackerTimelineData? Function(
      _i2.GAppTrackerTimelineData?, _i2.GAppTrackerTimelineData?)? updateResult;
  @override
  final _i2.GAppTrackerTimelineData? optimisticResponse;
  @override
  final String? updateCacheHandlerKey;
  @override
  final Map<String, dynamic>? updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy? fetchPolicy;
  @override
  final bool executeOnListen;

  factory _$GAppTrackerTimelineReq(
          [void Function(GAppTrackerTimelineReqBuilder)? updates]) =>
      (new GAppTrackerTimelineReqBuilder()..update(updates)).build();

  _$GAppTrackerTimelineReq._(
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
        vars, 'GAppTrackerTimelineReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GAppTrackerTimelineReq', 'operation');
    BuiltValueNullFieldError.checkNotNull(
        executeOnListen, 'GAppTrackerTimelineReq', 'executeOnListen');
  }

  @override
  GAppTrackerTimelineReq rebuild(
          void Function(GAppTrackerTimelineReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAppTrackerTimelineReqBuilder toBuilder() =>
      new GAppTrackerTimelineReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GAppTrackerTimelineReq &&
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
    return (newBuiltValueToStringHelper('GAppTrackerTimelineReq')
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

class GAppTrackerTimelineReqBuilder
    implements Builder<GAppTrackerTimelineReq, GAppTrackerTimelineReqBuilder> {
  _$GAppTrackerTimelineReq? _$v;

  _i3.GAppTrackerTimelineVarsBuilder? _vars;
  _i3.GAppTrackerTimelineVarsBuilder get vars =>
      _$this._vars ??= new _i3.GAppTrackerTimelineVarsBuilder();
  set vars(_i3.GAppTrackerTimelineVarsBuilder? vars) => _$this._vars = vars;

  _i4.Operation? _operation;
  _i4.Operation? get operation => _$this._operation;
  set operation(_i4.Operation? operation) => _$this._operation = operation;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  _i2.GAppTrackerTimelineData? Function(
          _i2.GAppTrackerTimelineData?, _i2.GAppTrackerTimelineData?)?
      _updateResult;
  _i2.GAppTrackerTimelineData? Function(
          _i2.GAppTrackerTimelineData?, _i2.GAppTrackerTimelineData?)?
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GAppTrackerTimelineData? Function(
                  _i2.GAppTrackerTimelineData?, _i2.GAppTrackerTimelineData?)?
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GAppTrackerTimelineDataBuilder? _optimisticResponse;
  _i2.GAppTrackerTimelineDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??= new _i2.GAppTrackerTimelineDataBuilder();
  set optimisticResponse(
          _i2.GAppTrackerTimelineDataBuilder? optimisticResponse) =>
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

  GAppTrackerTimelineReqBuilder() {
    GAppTrackerTimelineReq._initializeBuilder(this);
  }

  GAppTrackerTimelineReqBuilder get _$this {
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
  void replace(GAppTrackerTimelineReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAppTrackerTimelineReq;
  }

  @override
  void update(void Function(GAppTrackerTimelineReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAppTrackerTimelineReq build() {
    _$GAppTrackerTimelineReq _$result;
    try {
      _$result = _$v ??
          new _$GAppTrackerTimelineReq._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, 'GAppTrackerTimelineReq', 'operation'),
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: BuiltValueNullFieldError.checkNotNull(
                  executeOnListen,
                  'GAppTrackerTimelineReq',
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
            'GAppTrackerTimelineReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAppTrackerTabsReq extends GAppTrackerTabsReq {
  @override
  final _i3.GAppTrackerTabsVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String? requestId;
  @override
  final _i2.GAppTrackerTabsData? Function(
      _i2.GAppTrackerTabsData?, _i2.GAppTrackerTabsData?)? updateResult;
  @override
  final _i2.GAppTrackerTabsData? optimisticResponse;
  @override
  final String? updateCacheHandlerKey;
  @override
  final Map<String, dynamic>? updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy? fetchPolicy;
  @override
  final bool executeOnListen;

  factory _$GAppTrackerTabsReq(
          [void Function(GAppTrackerTabsReqBuilder)? updates]) =>
      (new GAppTrackerTabsReqBuilder()..update(updates)).build();

  _$GAppTrackerTabsReq._(
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
    BuiltValueNullFieldError.checkNotNull(vars, 'GAppTrackerTabsReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GAppTrackerTabsReq', 'operation');
    BuiltValueNullFieldError.checkNotNull(
        executeOnListen, 'GAppTrackerTabsReq', 'executeOnListen');
  }

  @override
  GAppTrackerTabsReq rebuild(
          void Function(GAppTrackerTabsReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAppTrackerTabsReqBuilder toBuilder() =>
      new GAppTrackerTabsReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GAppTrackerTabsReq &&
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
    return (newBuiltValueToStringHelper('GAppTrackerTabsReq')
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

class GAppTrackerTabsReqBuilder
    implements Builder<GAppTrackerTabsReq, GAppTrackerTabsReqBuilder> {
  _$GAppTrackerTabsReq? _$v;

  _i3.GAppTrackerTabsVarsBuilder? _vars;
  _i3.GAppTrackerTabsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GAppTrackerTabsVarsBuilder();
  set vars(_i3.GAppTrackerTabsVarsBuilder? vars) => _$this._vars = vars;

  _i4.Operation? _operation;
  _i4.Operation? get operation => _$this._operation;
  set operation(_i4.Operation? operation) => _$this._operation = operation;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  _i2.GAppTrackerTabsData? Function(
      _i2.GAppTrackerTabsData?, _i2.GAppTrackerTabsData?)? _updateResult;
  _i2.GAppTrackerTabsData? Function(
          _i2.GAppTrackerTabsData?, _i2.GAppTrackerTabsData?)?
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GAppTrackerTabsData? Function(
                  _i2.GAppTrackerTabsData?, _i2.GAppTrackerTabsData?)?
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GAppTrackerTabsDataBuilder? _optimisticResponse;
  _i2.GAppTrackerTabsDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??= new _i2.GAppTrackerTabsDataBuilder();
  set optimisticResponse(_i2.GAppTrackerTabsDataBuilder? optimisticResponse) =>
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

  GAppTrackerTabsReqBuilder() {
    GAppTrackerTabsReq._initializeBuilder(this);
  }

  GAppTrackerTabsReqBuilder get _$this {
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
  void replace(GAppTrackerTabsReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAppTrackerTabsReq;
  }

  @override
  void update(void Function(GAppTrackerTabsReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAppTrackerTabsReq build() {
    _$GAppTrackerTabsReq _$result;
    try {
      _$result = _$v ??
          new _$GAppTrackerTabsReq._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, 'GAppTrackerTabsReq', 'operation'),
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: BuiltValueNullFieldError.checkNotNull(
                  executeOnListen, 'GAppTrackerTabsReq', 'executeOnListen'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();

        _$failedField = 'optimisticResponse';
        _optimisticResponse?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GAppTrackerTabsReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GTrackTagsReq extends GTrackTagsReq {
  @override
  final _i3.GTrackTagsVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String? requestId;
  @override
  final _i2.GTrackTagsData? Function(_i2.GTrackTagsData?, _i2.GTrackTagsData?)?
      updateResult;
  @override
  final _i2.GTrackTagsData? optimisticResponse;
  @override
  final String? updateCacheHandlerKey;
  @override
  final Map<String, dynamic>? updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy? fetchPolicy;
  @override
  final bool executeOnListen;

  factory _$GTrackTagsReq([void Function(GTrackTagsReqBuilder)? updates]) =>
      (new GTrackTagsReqBuilder()..update(updates)).build();

  _$GTrackTagsReq._(
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
    BuiltValueNullFieldError.checkNotNull(vars, 'GTrackTagsReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GTrackTagsReq', 'operation');
    BuiltValueNullFieldError.checkNotNull(
        executeOnListen, 'GTrackTagsReq', 'executeOnListen');
  }

  @override
  GTrackTagsReq rebuild(void Function(GTrackTagsReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTrackTagsReqBuilder toBuilder() => new GTrackTagsReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GTrackTagsReq &&
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
    return (newBuiltValueToStringHelper('GTrackTagsReq')
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

class GTrackTagsReqBuilder
    implements Builder<GTrackTagsReq, GTrackTagsReqBuilder> {
  _$GTrackTagsReq? _$v;

  _i3.GTrackTagsVarsBuilder? _vars;
  _i3.GTrackTagsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GTrackTagsVarsBuilder();
  set vars(_i3.GTrackTagsVarsBuilder? vars) => _$this._vars = vars;

  _i4.Operation? _operation;
  _i4.Operation? get operation => _$this._operation;
  set operation(_i4.Operation? operation) => _$this._operation = operation;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  _i2.GTrackTagsData? Function(_i2.GTrackTagsData?, _i2.GTrackTagsData?)?
      _updateResult;
  _i2.GTrackTagsData? Function(_i2.GTrackTagsData?, _i2.GTrackTagsData?)?
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GTrackTagsData? Function(
                  _i2.GTrackTagsData?, _i2.GTrackTagsData?)?
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GTrackTagsDataBuilder? _optimisticResponse;
  _i2.GTrackTagsDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??= new _i2.GTrackTagsDataBuilder();
  set optimisticResponse(_i2.GTrackTagsDataBuilder? optimisticResponse) =>
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

  GTrackTagsReqBuilder() {
    GTrackTagsReq._initializeBuilder(this);
  }

  GTrackTagsReqBuilder get _$this {
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
  void replace(GTrackTagsReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTrackTagsReq;
  }

  @override
  void update(void Function(GTrackTagsReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GTrackTagsReq build() {
    _$GTrackTagsReq _$result;
    try {
      _$result = _$v ??
          new _$GTrackTagsReq._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, 'GTrackTagsReq', 'operation'),
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: BuiltValueNullFieldError.checkNotNull(
                  executeOnListen, 'GTrackTagsReq', 'executeOnListen'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();

        _$failedField = 'optimisticResponse';
        _optimisticResponse?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GTrackTagsReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GTrackedEntitiesReq extends GTrackedEntitiesReq {
  @override
  final _i3.GTrackedEntitiesVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String? requestId;
  @override
  final _i2.GTrackedEntitiesData? Function(
      _i2.GTrackedEntitiesData?, _i2.GTrackedEntitiesData?)? updateResult;
  @override
  final _i2.GTrackedEntitiesData? optimisticResponse;
  @override
  final String? updateCacheHandlerKey;
  @override
  final Map<String, dynamic>? updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy? fetchPolicy;
  @override
  final bool executeOnListen;

  factory _$GTrackedEntitiesReq(
          [void Function(GTrackedEntitiesReqBuilder)? updates]) =>
      (new GTrackedEntitiesReqBuilder()..update(updates)).build();

  _$GTrackedEntitiesReq._(
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
    BuiltValueNullFieldError.checkNotNull(vars, 'GTrackedEntitiesReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GTrackedEntitiesReq', 'operation');
    BuiltValueNullFieldError.checkNotNull(
        executeOnListen, 'GTrackedEntitiesReq', 'executeOnListen');
  }

  @override
  GTrackedEntitiesReq rebuild(
          void Function(GTrackedEntitiesReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTrackedEntitiesReqBuilder toBuilder() =>
      new GTrackedEntitiesReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GTrackedEntitiesReq &&
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
    return (newBuiltValueToStringHelper('GTrackedEntitiesReq')
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

class GTrackedEntitiesReqBuilder
    implements Builder<GTrackedEntitiesReq, GTrackedEntitiesReqBuilder> {
  _$GTrackedEntitiesReq? _$v;

  _i3.GTrackedEntitiesVarsBuilder? _vars;
  _i3.GTrackedEntitiesVarsBuilder get vars =>
      _$this._vars ??= new _i3.GTrackedEntitiesVarsBuilder();
  set vars(_i3.GTrackedEntitiesVarsBuilder? vars) => _$this._vars = vars;

  _i4.Operation? _operation;
  _i4.Operation? get operation => _$this._operation;
  set operation(_i4.Operation? operation) => _$this._operation = operation;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  _i2.GTrackedEntitiesData? Function(
      _i2.GTrackedEntitiesData?, _i2.GTrackedEntitiesData?)? _updateResult;
  _i2.GTrackedEntitiesData? Function(
          _i2.GTrackedEntitiesData?, _i2.GTrackedEntitiesData?)?
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GTrackedEntitiesData? Function(
                  _i2.GTrackedEntitiesData?, _i2.GTrackedEntitiesData?)?
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GTrackedEntitiesDataBuilder? _optimisticResponse;
  _i2.GTrackedEntitiesDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??= new _i2.GTrackedEntitiesDataBuilder();
  set optimisticResponse(_i2.GTrackedEntitiesDataBuilder? optimisticResponse) =>
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

  GTrackedEntitiesReqBuilder() {
    GTrackedEntitiesReq._initializeBuilder(this);
  }

  GTrackedEntitiesReqBuilder get _$this {
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
  void replace(GTrackedEntitiesReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTrackedEntitiesReq;
  }

  @override
  void update(void Function(GTrackedEntitiesReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GTrackedEntitiesReq build() {
    _$GTrackedEntitiesReq _$result;
    try {
      _$result = _$v ??
          new _$GTrackedEntitiesReq._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, 'GTrackedEntitiesReq', 'operation'),
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: BuiltValueNullFieldError.checkNotNull(
                  executeOnListen, 'GTrackedEntitiesReq', 'executeOnListen'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();

        _$failedField = 'optimisticResponse';
        _optimisticResponse?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GTrackedEntitiesReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GTrackableThemeReq extends GTrackableThemeReq {
  @override
  final _i3.GTrackableThemeVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String? requestId;
  @override
  final _i2.GTrackableThemeData? Function(
      _i2.GTrackableThemeData?, _i2.GTrackableThemeData?)? updateResult;
  @override
  final _i2.GTrackableThemeData? optimisticResponse;
  @override
  final String? updateCacheHandlerKey;
  @override
  final Map<String, dynamic>? updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy? fetchPolicy;
  @override
  final bool executeOnListen;

  factory _$GTrackableThemeReq(
          [void Function(GTrackableThemeReqBuilder)? updates]) =>
      (new GTrackableThemeReqBuilder()..update(updates)).build();

  _$GTrackableThemeReq._(
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
    BuiltValueNullFieldError.checkNotNull(vars, 'GTrackableThemeReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GTrackableThemeReq', 'operation');
    BuiltValueNullFieldError.checkNotNull(
        executeOnListen, 'GTrackableThemeReq', 'executeOnListen');
  }

  @override
  GTrackableThemeReq rebuild(
          void Function(GTrackableThemeReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTrackableThemeReqBuilder toBuilder() =>
      new GTrackableThemeReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GTrackableThemeReq &&
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
    return (newBuiltValueToStringHelper('GTrackableThemeReq')
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

class GTrackableThemeReqBuilder
    implements Builder<GTrackableThemeReq, GTrackableThemeReqBuilder> {
  _$GTrackableThemeReq? _$v;

  _i3.GTrackableThemeVarsBuilder? _vars;
  _i3.GTrackableThemeVarsBuilder get vars =>
      _$this._vars ??= new _i3.GTrackableThemeVarsBuilder();
  set vars(_i3.GTrackableThemeVarsBuilder? vars) => _$this._vars = vars;

  _i4.Operation? _operation;
  _i4.Operation? get operation => _$this._operation;
  set operation(_i4.Operation? operation) => _$this._operation = operation;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  _i2.GTrackableThemeData? Function(
      _i2.GTrackableThemeData?, _i2.GTrackableThemeData?)? _updateResult;
  _i2.GTrackableThemeData? Function(
          _i2.GTrackableThemeData?, _i2.GTrackableThemeData?)?
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GTrackableThemeData? Function(
                  _i2.GTrackableThemeData?, _i2.GTrackableThemeData?)?
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GTrackableThemeDataBuilder? _optimisticResponse;
  _i2.GTrackableThemeDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??= new _i2.GTrackableThemeDataBuilder();
  set optimisticResponse(_i2.GTrackableThemeDataBuilder? optimisticResponse) =>
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

  GTrackableThemeReqBuilder() {
    GTrackableThemeReq._initializeBuilder(this);
  }

  GTrackableThemeReqBuilder get _$this {
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
  void replace(GTrackableThemeReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTrackableThemeReq;
  }

  @override
  void update(void Function(GTrackableThemeReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GTrackableThemeReq build() {
    _$GTrackableThemeReq _$result;
    try {
      _$result = _$v ??
          new _$GTrackableThemeReq._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, 'GTrackableThemeReq', 'operation'),
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: BuiltValueNullFieldError.checkNotNull(
                  executeOnListen, 'GTrackableThemeReq', 'executeOnListen'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();

        _$failedField = 'optimisticResponse';
        _optimisticResponse?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GTrackableThemeReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAppTimelineRowNodeFieldsReq extends GAppTimelineRowNodeFieldsReq {
  @override
  final _i3.GAppTimelineRowNodeFieldsVars vars;
  @override
  final _i7.DocumentNode document;
  @override
  final String? fragmentName;
  @override
  final Map<String, dynamic> idFields;

  factory _$GAppTimelineRowNodeFieldsReq(
          [void Function(GAppTimelineRowNodeFieldsReqBuilder)? updates]) =>
      (new GAppTimelineRowNodeFieldsReqBuilder()..update(updates)).build();

  _$GAppTimelineRowNodeFieldsReq._(
      {required this.vars,
      required this.document,
      this.fragmentName,
      required this.idFields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        vars, 'GAppTimelineRowNodeFieldsReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        document, 'GAppTimelineRowNodeFieldsReq', 'document');
    BuiltValueNullFieldError.checkNotNull(
        idFields, 'GAppTimelineRowNodeFieldsReq', 'idFields');
  }

  @override
  GAppTimelineRowNodeFieldsReq rebuild(
          void Function(GAppTimelineRowNodeFieldsReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAppTimelineRowNodeFieldsReqBuilder toBuilder() =>
      new GAppTimelineRowNodeFieldsReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAppTimelineRowNodeFieldsReq &&
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
    return (newBuiltValueToStringHelper('GAppTimelineRowNodeFieldsReq')
          ..add('vars', vars)
          ..add('document', document)
          ..add('fragmentName', fragmentName)
          ..add('idFields', idFields))
        .toString();
  }
}

class GAppTimelineRowNodeFieldsReqBuilder
    implements
        Builder<GAppTimelineRowNodeFieldsReq,
            GAppTimelineRowNodeFieldsReqBuilder> {
  _$GAppTimelineRowNodeFieldsReq? _$v;

  _i3.GAppTimelineRowNodeFieldsVarsBuilder? _vars;
  _i3.GAppTimelineRowNodeFieldsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GAppTimelineRowNodeFieldsVarsBuilder();
  set vars(_i3.GAppTimelineRowNodeFieldsVarsBuilder? vars) =>
      _$this._vars = vars;

  _i7.DocumentNode? _document;
  _i7.DocumentNode? get document => _$this._document;
  set document(_i7.DocumentNode? document) => _$this._document = document;

  String? _fragmentName;
  String? get fragmentName => _$this._fragmentName;
  set fragmentName(String? fragmentName) => _$this._fragmentName = fragmentName;

  Map<String, dynamic>? _idFields;
  Map<String, dynamic>? get idFields => _$this._idFields;
  set idFields(Map<String, dynamic>? idFields) => _$this._idFields = idFields;

  GAppTimelineRowNodeFieldsReqBuilder() {
    GAppTimelineRowNodeFieldsReq._initializeBuilder(this);
  }

  GAppTimelineRowNodeFieldsReqBuilder get _$this {
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
  void replace(GAppTimelineRowNodeFieldsReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAppTimelineRowNodeFieldsReq;
  }

  @override
  void update(void Function(GAppTimelineRowNodeFieldsReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAppTimelineRowNodeFieldsReq build() {
    _$GAppTimelineRowNodeFieldsReq _$result;
    try {
      _$result = _$v ??
          new _$GAppTimelineRowNodeFieldsReq._(
              vars: vars.build(),
              document: BuiltValueNullFieldError.checkNotNull(
                  document, 'GAppTimelineRowNodeFieldsReq', 'document'),
              fragmentName: fragmentName,
              idFields: BuiltValueNullFieldError.checkNotNull(
                  idFields, 'GAppTimelineRowNodeFieldsReq', 'idFields'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GAppTimelineRowNodeFieldsReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
