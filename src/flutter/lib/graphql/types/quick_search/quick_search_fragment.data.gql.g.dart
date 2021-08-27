// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quick_search_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GQuickSearchEntityNodeFieldsData>
    _$gQuickSearchEntityNodeFieldsDataSerializer =
    new _$GQuickSearchEntityNodeFieldsDataSerializer();
Serializer<GQuickSearchEntityNodeFieldsData_action>
    _$gQuickSearchEntityNodeFieldsDataActionSerializer =
    new _$GQuickSearchEntityNodeFieldsData_actionSerializer();
Serializer<GQuickSearchEntityNodeFieldsData_tags__base>
    _$gQuickSearchEntityNodeFieldsDataTagsBaseSerializer =
    new _$GQuickSearchEntityNodeFieldsData_tags__baseSerializer();
Serializer<GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag>
    _$gQuickSearchEntityNodeFieldsDataTagsAsQuickSearchTagSerializer =
    new _$GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTagSerializer();
Serializer<GQuickSearchEntityNodeFieldsData_tags__asTextTag>
    _$gQuickSearchEntityNodeFieldsDataTagsAsTextTagSerializer =
    new _$GQuickSearchEntityNodeFieldsData_tags__asTextTagSerializer();
Serializer<GQuickSearchEntityNodeFieldsData_tags__asTextTag_action>
    _$gQuickSearchEntityNodeFieldsDataTagsAsTextTagActionSerializer =
    new _$GQuickSearchEntityNodeFieldsData_tags__asTextTag_actionSerializer();
Serializer<GQuickSearchEntityNodeFieldsData_tags__asRiskTag>
    _$gQuickSearchEntityNodeFieldsDataTagsAsRiskTagSerializer =
    new _$GQuickSearchEntityNodeFieldsData_tags__asRiskTagSerializer();
Serializer<GQuickSearchInfoFlowNodeFieldsData>
    _$gQuickSearchInfoFlowNodeFieldsDataSerializer =
    new _$GQuickSearchInfoFlowNodeFieldsDataSerializer();
Serializer<GQuickSearchInfoFlowNodeFieldsData_action>
    _$gQuickSearchInfoFlowNodeFieldsDataActionSerializer =
    new _$GQuickSearchInfoFlowNodeFieldsData_actionSerializer();
Serializer<GQuickSearchInfoFlowNodeFieldsData_tags__base>
    _$gQuickSearchInfoFlowNodeFieldsDataTagsBaseSerializer =
    new _$GQuickSearchInfoFlowNodeFieldsData_tags__baseSerializer();
Serializer<GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag>
    _$gQuickSearchInfoFlowNodeFieldsDataTagsAsQuickSearchTagSerializer =
    new _$GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTagSerializer();
Serializer<GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag>
    _$gQuickSearchInfoFlowNodeFieldsDataTagsAsTextTagSerializer =
    new _$GQuickSearchInfoFlowNodeFieldsData_tags__asTextTagSerializer();
Serializer<GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action>
    _$gQuickSearchInfoFlowNodeFieldsDataTagsAsTextTagActionSerializer =
    new _$GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_actionSerializer();
Serializer<GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag>
    _$gQuickSearchInfoFlowNodeFieldsDataTagsAsRiskTagSerializer =
    new _$GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTagSerializer();
Serializer<GQuickSearchInfoFlowNodeFieldsData_relatedEntity>
    _$gQuickSearchInfoFlowNodeFieldsDataRelatedEntitySerializer =
    new _$GQuickSearchInfoFlowNodeFieldsData_relatedEntitySerializer();

class _$GQuickSearchEntityNodeFieldsDataSerializer
    implements StructuredSerializer<GQuickSearchEntityNodeFieldsData> {
  @override
  final Iterable<Type> types = const [
    GQuickSearchEntityNodeFieldsData,
    _$GQuickSearchEntityNodeFieldsData
  ];
  @override
  final String wireName = 'GQuickSearchEntityNodeFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GQuickSearchEntityNodeFieldsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'nodeId',
      serializers.serialize(object.nodeId,
          specifiedType: const FullType(String)),
      'searchType',
      serializers.serialize(object.searchType,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.action;
    if (value != null) {
      result
        ..add('action')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GQuickSearchEntityNodeFieldsData_action)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.highlightTexts;
    if (value != null) {
      result
        ..add('highlightTexts')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.logoURI;
    if (value != null) {
      result
        ..add('logoURI')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.subtitle;
    if (value != null) {
      result
        ..add('subtitle')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tags;
    if (value != null) {
      result
        ..add('tags')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(GQuickSearchEntityNodeFieldsData_tags)
            ])));
    }
    return result;
  }

  @override
  GQuickSearchEntityNodeFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQuickSearchEntityNodeFieldsDataBuilder();

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
        case 'action':
          result.action.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GQuickSearchEntityNodeFieldsData_action))!
              as GQuickSearchEntityNodeFieldsData_action);
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'highlightTexts':
          result.highlightTexts.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'logoURI':
          result.logoURI = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nodeId':
          result.nodeId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'searchType':
          result.searchType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'subtitle':
          result.subtitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tags':
          result.tags.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GQuickSearchEntityNodeFieldsData_tags)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GQuickSearchEntityNodeFieldsData_actionSerializer
    implements StructuredSerializer<GQuickSearchEntityNodeFieldsData_action> {
  @override
  final Iterable<Type> types = const [
    GQuickSearchEntityNodeFieldsData_action,
    _$GQuickSearchEntityNodeFieldsData_action
  ];
  @override
  final String wireName = 'GQuickSearchEntityNodeFieldsData_action';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GQuickSearchEntityNodeFieldsData_action object,
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
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.args;
    if (value != null) {
      result
        ..add('args')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                Map, const [const FullType(String), const FullType(dynamic)])));
    }
    return result;
  }

  @override
  GQuickSearchEntityNodeFieldsData_action deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQuickSearchEntityNodeFieldsData_actionBuilder();

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
        case 'data':
          result.data = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'args':
          result.args = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ])) as Map<String, dynamic>?;
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
      }
    }

    return result.build();
  }
}

class _$GQuickSearchEntityNodeFieldsData_tags__baseSerializer
    implements
        StructuredSerializer<GQuickSearchEntityNodeFieldsData_tags__base> {
  @override
  final Iterable<Type> types = const [
    GQuickSearchEntityNodeFieldsData_tags__base,
    _$GQuickSearchEntityNodeFieldsData_tags__base
  ];
  @override
  final String wireName = 'GQuickSearchEntityNodeFieldsData_tags__base';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GQuickSearchEntityNodeFieldsData_tags__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GQuickSearchEntityNodeFieldsData_tags__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQuickSearchEntityNodeFieldsData_tags__baseBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTagSerializer
    implements
        StructuredSerializer<
            GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag> {
  @override
  final Iterable<Type> types = const [
    GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag,
    _$GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag
  ];
  @override
  final String wireName =
      'GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag object,
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
  GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTagBuilder();

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

class _$GQuickSearchEntityNodeFieldsData_tags__asTextTagSerializer
    implements
        StructuredSerializer<GQuickSearchEntityNodeFieldsData_tags__asTextTag> {
  @override
  final Iterable<Type> types = const [
    GQuickSearchEntityNodeFieldsData_tags__asTextTag,
    _$GQuickSearchEntityNodeFieldsData_tags__asTextTag
  ];
  @override
  final String wireName = 'GQuickSearchEntityNodeFieldsData_tags__asTextTag';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GQuickSearchEntityNodeFieldsData_tags__asTextTag object,
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
            specifiedType: const FullType(
                GQuickSearchEntityNodeFieldsData_tags__asTextTag_action)));
    }
    return result;
  }

  @override
  GQuickSearchEntityNodeFieldsData_tags__asTextTag deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GQuickSearchEntityNodeFieldsData_tags__asTextTagBuilder();

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
                  specifiedType: const FullType(
                      GQuickSearchEntityNodeFieldsData_tags__asTextTag_action))!
              as GQuickSearchEntityNodeFieldsData_tags__asTextTag_action);
          break;
      }
    }

    return result.build();
  }
}

class _$GQuickSearchEntityNodeFieldsData_tags__asTextTag_actionSerializer
    implements
        StructuredSerializer<
            GQuickSearchEntityNodeFieldsData_tags__asTextTag_action> {
  @override
  final Iterable<Type> types = const [
    GQuickSearchEntityNodeFieldsData_tags__asTextTag_action,
    _$GQuickSearchEntityNodeFieldsData_tags__asTextTag_action
  ];
  @override
  final String wireName =
      'GQuickSearchEntityNodeFieldsData_tags__asTextTag_action';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GQuickSearchEntityNodeFieldsData_tags__asTextTag_action object,
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
  GQuickSearchEntityNodeFieldsData_tags__asTextTag_action deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GQuickSearchEntityNodeFieldsData_tags__asTextTag_actionBuilder();

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

class _$GQuickSearchEntityNodeFieldsData_tags__asRiskTagSerializer
    implements
        StructuredSerializer<GQuickSearchEntityNodeFieldsData_tags__asRiskTag> {
  @override
  final Iterable<Type> types = const [
    GQuickSearchEntityNodeFieldsData_tags__asRiskTag,
    _$GQuickSearchEntityNodeFieldsData_tags__asRiskTag
  ];
  @override
  final String wireName = 'GQuickSearchEntityNodeFieldsData_tags__asRiskTag';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GQuickSearchEntityNodeFieldsData_tags__asRiskTag object,
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
  GQuickSearchEntityNodeFieldsData_tags__asRiskTag deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GQuickSearchEntityNodeFieldsData_tags__asRiskTagBuilder();

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

class _$GQuickSearchInfoFlowNodeFieldsDataSerializer
    implements StructuredSerializer<GQuickSearchInfoFlowNodeFieldsData> {
  @override
  final Iterable<Type> types = const [
    GQuickSearchInfoFlowNodeFieldsData,
    _$GQuickSearchInfoFlowNodeFieldsData
  ];
  @override
  final String wireName = 'GQuickSearchInfoFlowNodeFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GQuickSearchInfoFlowNodeFieldsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'nodeId',
      serializers.serialize(object.nodeId,
          specifiedType: const FullType(String)),
      'searchType',
      serializers.serialize(object.searchType,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.action;
    if (value != null) {
      result
        ..add('action')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GQuickSearchInfoFlowNodeFieldsData_action)));
    }
    value = object.imageURI;
    if (value != null) {
      result
        ..add('imageURI')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.publishTime;
    if (value != null) {
      result
        ..add('publishTime')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.highlightTexts;
    if (value != null) {
      result
        ..add('highlightTexts')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.subtitle;
    if (value != null) {
      result
        ..add('subtitle')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tags;
    if (value != null) {
      result
        ..add('tags')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(GQuickSearchInfoFlowNodeFieldsData_tags)
            ])));
    }
    value = object.relatedEntity;
    if (value != null) {
      result
        ..add('relatedEntity')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(GQuickSearchInfoFlowNodeFieldsData_relatedEntity)
            ])));
    }
    return result;
  }

  @override
  GQuickSearchInfoFlowNodeFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQuickSearchInfoFlowNodeFieldsDataBuilder();

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
        case 'action':
          result.action.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GQuickSearchInfoFlowNodeFieldsData_action))!
              as GQuickSearchInfoFlowNodeFieldsData_action);
          break;
        case 'imageURI':
          result.imageURI = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'publishTime':
          result.publishTime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'highlightTexts':
          result.highlightTexts.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'nodeId':
          result.nodeId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'searchType':
          result.searchType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'subtitle':
          result.subtitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tags':
          result.tags.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GQuickSearchInfoFlowNodeFieldsData_tags)
              ]))! as BuiltList<Object?>);
          break;
        case 'relatedEntity':
          result.relatedEntity.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GQuickSearchInfoFlowNodeFieldsData_relatedEntity)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GQuickSearchInfoFlowNodeFieldsData_actionSerializer
    implements StructuredSerializer<GQuickSearchInfoFlowNodeFieldsData_action> {
  @override
  final Iterable<Type> types = const [
    GQuickSearchInfoFlowNodeFieldsData_action,
    _$GQuickSearchInfoFlowNodeFieldsData_action
  ];
  @override
  final String wireName = 'GQuickSearchInfoFlowNodeFieldsData_action';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GQuickSearchInfoFlowNodeFieldsData_action object,
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
  GQuickSearchInfoFlowNodeFieldsData_action deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQuickSearchInfoFlowNodeFieldsData_actionBuilder();

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
        case 'args':
          result.args = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ])) as Map<String, dynamic>?;
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
        case 'data':
          result.data = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GQuickSearchInfoFlowNodeFieldsData_tags__baseSerializer
    implements
        StructuredSerializer<GQuickSearchInfoFlowNodeFieldsData_tags__base> {
  @override
  final Iterable<Type> types = const [
    GQuickSearchInfoFlowNodeFieldsData_tags__base,
    _$GQuickSearchInfoFlowNodeFieldsData_tags__base
  ];
  @override
  final String wireName = 'GQuickSearchInfoFlowNodeFieldsData_tags__base';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GQuickSearchInfoFlowNodeFieldsData_tags__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GQuickSearchInfoFlowNodeFieldsData_tags__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQuickSearchInfoFlowNodeFieldsData_tags__baseBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTagSerializer
    implements
        StructuredSerializer<
            GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag> {
  @override
  final Iterable<Type> types = const [
    GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag,
    _$GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag
  ];
  @override
  final String wireName =
      'GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag object,
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
  GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTagBuilder();

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

class _$GQuickSearchInfoFlowNodeFieldsData_tags__asTextTagSerializer
    implements
        StructuredSerializer<
            GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag> {
  @override
  final Iterable<Type> types = const [
    GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag,
    _$GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag
  ];
  @override
  final String wireName = 'GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag object,
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
            specifiedType: const FullType(
                GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action)));
    }
    return result;
  }

  @override
  GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GQuickSearchInfoFlowNodeFieldsData_tags__asTextTagBuilder();

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
                  specifiedType: const FullType(
                      GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action))!
              as GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action);
          break;
      }
    }

    return result.build();
  }
}

class _$GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_actionSerializer
    implements
        StructuredSerializer<
            GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action> {
  @override
  final Iterable<Type> types = const [
    GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action,
    _$GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action
  ];
  @override
  final String wireName =
      'GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action object,
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
  GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_actionBuilder();

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

class _$GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTagSerializer
    implements
        StructuredSerializer<
            GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag> {
  @override
  final Iterable<Type> types = const [
    GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag,
    _$GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag
  ];
  @override
  final String wireName = 'GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag object,
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
  GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTagBuilder();

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

class _$GQuickSearchInfoFlowNodeFieldsData_relatedEntitySerializer
    implements
        StructuredSerializer<GQuickSearchInfoFlowNodeFieldsData_relatedEntity> {
  @override
  final Iterable<Type> types = const [
    GQuickSearchInfoFlowNodeFieldsData_relatedEntity,
    _$GQuickSearchInfoFlowNodeFieldsData_relatedEntity
  ];
  @override
  final String wireName = 'GQuickSearchInfoFlowNodeFieldsData_relatedEntity';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GQuickSearchInfoFlowNodeFieldsData_relatedEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'entityType',
      serializers.serialize(object.entityType,
          specifiedType: const FullType(_i1.GEntityType)),
      'entityName',
      serializers.serialize(object.entityName,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.entityId;
    if (value != null) {
      result
        ..add('entityId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.portraitURL;
    if (value != null) {
      result
        ..add('portraitURL')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GQuickSearchInfoFlowNodeFieldsData_relatedEntity deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GQuickSearchInfoFlowNodeFieldsData_relatedEntityBuilder();

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
        case 'entityId':
          result.entityId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'entityType':
          result.entityType = serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GEntityType))
              as _i1.GEntityType;
          break;
        case 'entityName':
          result.entityName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'portraitURL':
          result.portraitURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GQuickSearchEntityNodeFieldsData
    extends GQuickSearchEntityNodeFieldsData {
  @override
  final String G__typename;
  @override
  final GQuickSearchEntityNodeFieldsData_action? action;
  @override
  final String? description;
  @override
  final BuiltList<String>? highlightTexts;
  @override
  final String? logoURI;
  @override
  final String nodeId;
  @override
  final String searchType;
  @override
  final String? subtitle;
  @override
  final String? title;
  @override
  final BuiltList<GQuickSearchEntityNodeFieldsData_tags>? tags;

  factory _$GQuickSearchEntityNodeFieldsData(
          [void Function(GQuickSearchEntityNodeFieldsDataBuilder)? updates]) =>
      (new GQuickSearchEntityNodeFieldsDataBuilder()..update(updates)).build();

  _$GQuickSearchEntityNodeFieldsData._(
      {required this.G__typename,
      this.action,
      this.description,
      this.highlightTexts,
      this.logoURI,
      required this.nodeId,
      required this.searchType,
      this.subtitle,
      this.title,
      this.tags})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GQuickSearchEntityNodeFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        nodeId, 'GQuickSearchEntityNodeFieldsData', 'nodeId');
    BuiltValueNullFieldError.checkNotNull(
        searchType, 'GQuickSearchEntityNodeFieldsData', 'searchType');
  }

  @override
  GQuickSearchEntityNodeFieldsData rebuild(
          void Function(GQuickSearchEntityNodeFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQuickSearchEntityNodeFieldsDataBuilder toBuilder() =>
      new GQuickSearchEntityNodeFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQuickSearchEntityNodeFieldsData &&
        G__typename == other.G__typename &&
        action == other.action &&
        description == other.description &&
        highlightTexts == other.highlightTexts &&
        logoURI == other.logoURI &&
        nodeId == other.nodeId &&
        searchType == other.searchType &&
        subtitle == other.subtitle &&
        title == other.title &&
        tags == other.tags;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, G__typename.hashCode),
                                        action.hashCode),
                                    description.hashCode),
                                highlightTexts.hashCode),
                            logoURI.hashCode),
                        nodeId.hashCode),
                    searchType.hashCode),
                subtitle.hashCode),
            title.hashCode),
        tags.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GQuickSearchEntityNodeFieldsData')
          ..add('G__typename', G__typename)
          ..add('action', action)
          ..add('description', description)
          ..add('highlightTexts', highlightTexts)
          ..add('logoURI', logoURI)
          ..add('nodeId', nodeId)
          ..add('searchType', searchType)
          ..add('subtitle', subtitle)
          ..add('title', title)
          ..add('tags', tags))
        .toString();
  }
}

class GQuickSearchEntityNodeFieldsDataBuilder
    implements
        Builder<GQuickSearchEntityNodeFieldsData,
            GQuickSearchEntityNodeFieldsDataBuilder> {
  _$GQuickSearchEntityNodeFieldsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GQuickSearchEntityNodeFieldsData_actionBuilder? _action;
  GQuickSearchEntityNodeFieldsData_actionBuilder get action =>
      _$this._action ??= new GQuickSearchEntityNodeFieldsData_actionBuilder();
  set action(GQuickSearchEntityNodeFieldsData_actionBuilder? action) =>
      _$this._action = action;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ListBuilder<String>? _highlightTexts;
  ListBuilder<String> get highlightTexts =>
      _$this._highlightTexts ??= new ListBuilder<String>();
  set highlightTexts(ListBuilder<String>? highlightTexts) =>
      _$this._highlightTexts = highlightTexts;

  String? _logoURI;
  String? get logoURI => _$this._logoURI;
  set logoURI(String? logoURI) => _$this._logoURI = logoURI;

  String? _nodeId;
  String? get nodeId => _$this._nodeId;
  set nodeId(String? nodeId) => _$this._nodeId = nodeId;

  String? _searchType;
  String? get searchType => _$this._searchType;
  set searchType(String? searchType) => _$this._searchType = searchType;

  String? _subtitle;
  String? get subtitle => _$this._subtitle;
  set subtitle(String? subtitle) => _$this._subtitle = subtitle;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  ListBuilder<GQuickSearchEntityNodeFieldsData_tags>? _tags;
  ListBuilder<GQuickSearchEntityNodeFieldsData_tags> get tags =>
      _$this._tags ??= new ListBuilder<GQuickSearchEntityNodeFieldsData_tags>();
  set tags(ListBuilder<GQuickSearchEntityNodeFieldsData_tags>? tags) =>
      _$this._tags = tags;

  GQuickSearchEntityNodeFieldsDataBuilder() {
    GQuickSearchEntityNodeFieldsData._initializeBuilder(this);
  }

  GQuickSearchEntityNodeFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _action = $v.action?.toBuilder();
      _description = $v.description;
      _highlightTexts = $v.highlightTexts?.toBuilder();
      _logoURI = $v.logoURI;
      _nodeId = $v.nodeId;
      _searchType = $v.searchType;
      _subtitle = $v.subtitle;
      _title = $v.title;
      _tags = $v.tags?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQuickSearchEntityNodeFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQuickSearchEntityNodeFieldsData;
  }

  @override
  void update(void Function(GQuickSearchEntityNodeFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQuickSearchEntityNodeFieldsData build() {
    _$GQuickSearchEntityNodeFieldsData _$result;
    try {
      _$result = _$v ??
          new _$GQuickSearchEntityNodeFieldsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  'GQuickSearchEntityNodeFieldsData', 'G__typename'),
              action: _action?.build(),
              description: description,
              highlightTexts: _highlightTexts?.build(),
              logoURI: logoURI,
              nodeId: BuiltValueNullFieldError.checkNotNull(
                  nodeId, 'GQuickSearchEntityNodeFieldsData', 'nodeId'),
              searchType: BuiltValueNullFieldError.checkNotNull(
                  searchType, 'GQuickSearchEntityNodeFieldsData', 'searchType'),
              subtitle: subtitle,
              title: title,
              tags: _tags?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'action';
        _action?.build();

        _$failedField = 'highlightTexts';
        _highlightTexts?.build();

        _$failedField = 'tags';
        _tags?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GQuickSearchEntityNodeFieldsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GQuickSearchEntityNodeFieldsData_action
    extends GQuickSearchEntityNodeFieldsData_action {
  @override
  final String G__typename;
  @override
  final String? data;
  @override
  final Map<String, dynamic>? args;
  @override
  final String name;
  @override
  final _i1.GActionType type;

  factory _$GQuickSearchEntityNodeFieldsData_action(
          [void Function(GQuickSearchEntityNodeFieldsData_actionBuilder)?
              updates]) =>
      (new GQuickSearchEntityNodeFieldsData_actionBuilder()..update(updates))
          .build();

  _$GQuickSearchEntityNodeFieldsData_action._(
      {required this.G__typename,
      this.data,
      this.args,
      required this.name,
      required this.type})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GQuickSearchEntityNodeFieldsData_action', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        name, 'GQuickSearchEntityNodeFieldsData_action', 'name');
    BuiltValueNullFieldError.checkNotNull(
        type, 'GQuickSearchEntityNodeFieldsData_action', 'type');
  }

  @override
  GQuickSearchEntityNodeFieldsData_action rebuild(
          void Function(GQuickSearchEntityNodeFieldsData_actionBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQuickSearchEntityNodeFieldsData_actionBuilder toBuilder() =>
      new GQuickSearchEntityNodeFieldsData_actionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQuickSearchEntityNodeFieldsData_action &&
        G__typename == other.G__typename &&
        data == other.data &&
        args == other.args &&
        name == other.name &&
        type == other.type;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, G__typename.hashCode), data.hashCode),
                args.hashCode),
            name.hashCode),
        type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GQuickSearchEntityNodeFieldsData_action')
          ..add('G__typename', G__typename)
          ..add('data', data)
          ..add('args', args)
          ..add('name', name)
          ..add('type', type))
        .toString();
  }
}

class GQuickSearchEntityNodeFieldsData_actionBuilder
    implements
        Builder<GQuickSearchEntityNodeFieldsData_action,
            GQuickSearchEntityNodeFieldsData_actionBuilder> {
  _$GQuickSearchEntityNodeFieldsData_action? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _data;
  String? get data => _$this._data;
  set data(String? data) => _$this._data = data;

  Map<String, dynamic>? _args;
  Map<String, dynamic>? get args => _$this._args;
  set args(Map<String, dynamic>? args) => _$this._args = args;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  _i1.GActionType? _type;
  _i1.GActionType? get type => _$this._type;
  set type(_i1.GActionType? type) => _$this._type = type;

  GQuickSearchEntityNodeFieldsData_actionBuilder() {
    GQuickSearchEntityNodeFieldsData_action._initializeBuilder(this);
  }

  GQuickSearchEntityNodeFieldsData_actionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _data = $v.data;
      _args = $v.args;
      _name = $v.name;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQuickSearchEntityNodeFieldsData_action other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQuickSearchEntityNodeFieldsData_action;
  }

  @override
  void update(
      void Function(GQuickSearchEntityNodeFieldsData_actionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQuickSearchEntityNodeFieldsData_action build() {
    final _$result = _$v ??
        new _$GQuickSearchEntityNodeFieldsData_action._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                'GQuickSearchEntityNodeFieldsData_action', 'G__typename'),
            data: data,
            args: args,
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'GQuickSearchEntityNodeFieldsData_action', 'name'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, 'GQuickSearchEntityNodeFieldsData_action', 'type'));
    replace(_$result);
    return _$result;
  }
}

class _$GQuickSearchEntityNodeFieldsData_tags__base
    extends GQuickSearchEntityNodeFieldsData_tags__base {
  @override
  final String G__typename;

  factory _$GQuickSearchEntityNodeFieldsData_tags__base(
          [void Function(GQuickSearchEntityNodeFieldsData_tags__baseBuilder)?
              updates]) =>
      (new GQuickSearchEntityNodeFieldsData_tags__baseBuilder()
            ..update(updates))
          .build();

  _$GQuickSearchEntityNodeFieldsData_tags__base._({required this.G__typename})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GQuickSearchEntityNodeFieldsData_tags__base', 'G__typename');
  }

  @override
  GQuickSearchEntityNodeFieldsData_tags__base rebuild(
          void Function(GQuickSearchEntityNodeFieldsData_tags__baseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQuickSearchEntityNodeFieldsData_tags__baseBuilder toBuilder() =>
      new GQuickSearchEntityNodeFieldsData_tags__baseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQuickSearchEntityNodeFieldsData_tags__base &&
        G__typename == other.G__typename;
  }

  @override
  int get hashCode {
    return $jf($jc(0, G__typename.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GQuickSearchEntityNodeFieldsData_tags__base')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GQuickSearchEntityNodeFieldsData_tags__baseBuilder
    implements
        Builder<GQuickSearchEntityNodeFieldsData_tags__base,
            GQuickSearchEntityNodeFieldsData_tags__baseBuilder> {
  _$GQuickSearchEntityNodeFieldsData_tags__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GQuickSearchEntityNodeFieldsData_tags__baseBuilder() {
    GQuickSearchEntityNodeFieldsData_tags__base._initializeBuilder(this);
  }

  GQuickSearchEntityNodeFieldsData_tags__baseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQuickSearchEntityNodeFieldsData_tags__base other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQuickSearchEntityNodeFieldsData_tags__base;
  }

  @override
  void update(
      void Function(GQuickSearchEntityNodeFieldsData_tags__baseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQuickSearchEntityNodeFieldsData_tags__base build() {
    final _$result = _$v ??
        new _$GQuickSearchEntityNodeFieldsData_tags__base._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                'GQuickSearchEntityNodeFieldsData_tags__base', 'G__typename'));
    replace(_$result);
    return _$result;
  }
}

class _$GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag
    extends GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag {
  @override
  final String G__typename;
  @override
  final String? icon;
  @override
  final String? nameType;
  @override
  final String? matchedName;

  factory _$GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag(
          [void Function(
                  GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTagBuilder)?
              updates]) =>
      (new GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTagBuilder()
            ..update(updates))
          .build();

  _$GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag._(
      {required this.G__typename, this.icon, this.nameType, this.matchedName})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        'GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag',
        'G__typename');
  }

  @override
  GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag rebuild(
          void Function(
                  GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTagBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTagBuilder toBuilder() =>
      new GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTagBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag &&
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
    return (newBuiltValueToStringHelper(
            'GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag')
          ..add('G__typename', G__typename)
          ..add('icon', icon)
          ..add('nameType', nameType)
          ..add('matchedName', matchedName))
        .toString();
  }
}

class GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTagBuilder
    implements
        Builder<GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag,
            GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTagBuilder> {
  _$GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag? _$v;

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

  GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTagBuilder() {
    GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag._initializeBuilder(
        this);
  }

  GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTagBuilder get _$this {
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
  void replace(GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag;
  }

  @override
  void update(
      void Function(
              GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTagBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag build() {
    final _$result = _$v ??
        new _$GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag',
                'G__typename'),
            icon: icon,
            nameType: nameType,
            matchedName: matchedName);
    replace(_$result);
    return _$result;
  }
}

class _$GQuickSearchEntityNodeFieldsData_tags__asTextTag
    extends GQuickSearchEntityNodeFieldsData_tags__asTextTag {
  @override
  final String G__typename;
  @override
  final String? name;
  @override
  final GQuickSearchEntityNodeFieldsData_tags__asTextTag_action? action;

  factory _$GQuickSearchEntityNodeFieldsData_tags__asTextTag(
          [void Function(
                  GQuickSearchEntityNodeFieldsData_tags__asTextTagBuilder)?
              updates]) =>
      (new GQuickSearchEntityNodeFieldsData_tags__asTextTagBuilder()
            ..update(updates))
          .build();

  _$GQuickSearchEntityNodeFieldsData_tags__asTextTag._(
      {required this.G__typename, this.name, this.action})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GQuickSearchEntityNodeFieldsData_tags__asTextTag', 'G__typename');
  }

  @override
  GQuickSearchEntityNodeFieldsData_tags__asTextTag rebuild(
          void Function(GQuickSearchEntityNodeFieldsData_tags__asTextTagBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQuickSearchEntityNodeFieldsData_tags__asTextTagBuilder toBuilder() =>
      new GQuickSearchEntityNodeFieldsData_tags__asTextTagBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQuickSearchEntityNodeFieldsData_tags__asTextTag &&
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
    return (newBuiltValueToStringHelper(
            'GQuickSearchEntityNodeFieldsData_tags__asTextTag')
          ..add('G__typename', G__typename)
          ..add('name', name)
          ..add('action', action))
        .toString();
  }
}

class GQuickSearchEntityNodeFieldsData_tags__asTextTagBuilder
    implements
        Builder<GQuickSearchEntityNodeFieldsData_tags__asTextTag,
            GQuickSearchEntityNodeFieldsData_tags__asTextTagBuilder> {
  _$GQuickSearchEntityNodeFieldsData_tags__asTextTag? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GQuickSearchEntityNodeFieldsData_tags__asTextTag_actionBuilder? _action;
  GQuickSearchEntityNodeFieldsData_tags__asTextTag_actionBuilder get action =>
      _$this._action ??=
          new GQuickSearchEntityNodeFieldsData_tags__asTextTag_actionBuilder();
  set action(
          GQuickSearchEntityNodeFieldsData_tags__asTextTag_actionBuilder?
              action) =>
      _$this._action = action;

  GQuickSearchEntityNodeFieldsData_tags__asTextTagBuilder() {
    GQuickSearchEntityNodeFieldsData_tags__asTextTag._initializeBuilder(this);
  }

  GQuickSearchEntityNodeFieldsData_tags__asTextTagBuilder get _$this {
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
  void replace(GQuickSearchEntityNodeFieldsData_tags__asTextTag other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQuickSearchEntityNodeFieldsData_tags__asTextTag;
  }

  @override
  void update(
      void Function(GQuickSearchEntityNodeFieldsData_tags__asTextTagBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQuickSearchEntityNodeFieldsData_tags__asTextTag build() {
    _$GQuickSearchEntityNodeFieldsData_tags__asTextTag _$result;
    try {
      _$result = _$v ??
          new _$GQuickSearchEntityNodeFieldsData_tags__asTextTag._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  'GQuickSearchEntityNodeFieldsData_tags__asTextTag',
                  'G__typename'),
              name: name,
              action: _action?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'action';
        _action?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GQuickSearchEntityNodeFieldsData_tags__asTextTag',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GQuickSearchEntityNodeFieldsData_tags__asTextTag_action
    extends GQuickSearchEntityNodeFieldsData_tags__asTextTag_action {
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

  factory _$GQuickSearchEntityNodeFieldsData_tags__asTextTag_action(
          [void Function(
                  GQuickSearchEntityNodeFieldsData_tags__asTextTag_actionBuilder)?
              updates]) =>
      (new GQuickSearchEntityNodeFieldsData_tags__asTextTag_actionBuilder()
            ..update(updates))
          .build();

  _$GQuickSearchEntityNodeFieldsData_tags__asTextTag_action._(
      {required this.G__typename,
      required this.name,
      required this.type,
      this.args,
      this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        'GQuickSearchEntityNodeFieldsData_tags__asTextTag_action',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(name,
        'GQuickSearchEntityNodeFieldsData_tags__asTextTag_action', 'name');
    BuiltValueNullFieldError.checkNotNull(type,
        'GQuickSearchEntityNodeFieldsData_tags__asTextTag_action', 'type');
  }

  @override
  GQuickSearchEntityNodeFieldsData_tags__asTextTag_action rebuild(
          void Function(
                  GQuickSearchEntityNodeFieldsData_tags__asTextTag_actionBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQuickSearchEntityNodeFieldsData_tags__asTextTag_actionBuilder toBuilder() =>
      new GQuickSearchEntityNodeFieldsData_tags__asTextTag_actionBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQuickSearchEntityNodeFieldsData_tags__asTextTag_action &&
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
    return (newBuiltValueToStringHelper(
            'GQuickSearchEntityNodeFieldsData_tags__asTextTag_action')
          ..add('G__typename', G__typename)
          ..add('name', name)
          ..add('type', type)
          ..add('args', args)
          ..add('data', data))
        .toString();
  }
}

class GQuickSearchEntityNodeFieldsData_tags__asTextTag_actionBuilder
    implements
        Builder<GQuickSearchEntityNodeFieldsData_tags__asTextTag_action,
            GQuickSearchEntityNodeFieldsData_tags__asTextTag_actionBuilder> {
  _$GQuickSearchEntityNodeFieldsData_tags__asTextTag_action? _$v;

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

  GQuickSearchEntityNodeFieldsData_tags__asTextTag_actionBuilder() {
    GQuickSearchEntityNodeFieldsData_tags__asTextTag_action._initializeBuilder(
        this);
  }

  GQuickSearchEntityNodeFieldsData_tags__asTextTag_actionBuilder get _$this {
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
  void replace(GQuickSearchEntityNodeFieldsData_tags__asTextTag_action other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQuickSearchEntityNodeFieldsData_tags__asTextTag_action;
  }

  @override
  void update(
      void Function(
              GQuickSearchEntityNodeFieldsData_tags__asTextTag_actionBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQuickSearchEntityNodeFieldsData_tags__asTextTag_action build() {
    final _$result = _$v ??
        new _$GQuickSearchEntityNodeFieldsData_tags__asTextTag_action._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GQuickSearchEntityNodeFieldsData_tags__asTextTag_action',
                'G__typename'),
            name: BuiltValueNullFieldError.checkNotNull(
                name,
                'GQuickSearchEntityNodeFieldsData_tags__asTextTag_action',
                'name'),
            type: BuiltValueNullFieldError.checkNotNull(
                type,
                'GQuickSearchEntityNodeFieldsData_tags__asTextTag_action',
                'type'),
            args: args,
            data: data);
    replace(_$result);
    return _$result;
  }
}

class _$GQuickSearchEntityNodeFieldsData_tags__asRiskTag
    extends GQuickSearchEntityNodeFieldsData_tags__asRiskTag {
  @override
  final String G__typename;
  @override
  final int? level;

  factory _$GQuickSearchEntityNodeFieldsData_tags__asRiskTag(
          [void Function(
                  GQuickSearchEntityNodeFieldsData_tags__asRiskTagBuilder)?
              updates]) =>
      (new GQuickSearchEntityNodeFieldsData_tags__asRiskTagBuilder()
            ..update(updates))
          .build();

  _$GQuickSearchEntityNodeFieldsData_tags__asRiskTag._(
      {required this.G__typename, this.level})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GQuickSearchEntityNodeFieldsData_tags__asRiskTag', 'G__typename');
  }

  @override
  GQuickSearchEntityNodeFieldsData_tags__asRiskTag rebuild(
          void Function(GQuickSearchEntityNodeFieldsData_tags__asRiskTagBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQuickSearchEntityNodeFieldsData_tags__asRiskTagBuilder toBuilder() =>
      new GQuickSearchEntityNodeFieldsData_tags__asRiskTagBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQuickSearchEntityNodeFieldsData_tags__asRiskTag &&
        G__typename == other.G__typename &&
        level == other.level;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), level.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GQuickSearchEntityNodeFieldsData_tags__asRiskTag')
          ..add('G__typename', G__typename)
          ..add('level', level))
        .toString();
  }
}

class GQuickSearchEntityNodeFieldsData_tags__asRiskTagBuilder
    implements
        Builder<GQuickSearchEntityNodeFieldsData_tags__asRiskTag,
            GQuickSearchEntityNodeFieldsData_tags__asRiskTagBuilder> {
  _$GQuickSearchEntityNodeFieldsData_tags__asRiskTag? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _level;
  int? get level => _$this._level;
  set level(int? level) => _$this._level = level;

  GQuickSearchEntityNodeFieldsData_tags__asRiskTagBuilder() {
    GQuickSearchEntityNodeFieldsData_tags__asRiskTag._initializeBuilder(this);
  }

  GQuickSearchEntityNodeFieldsData_tags__asRiskTagBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _level = $v.level;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQuickSearchEntityNodeFieldsData_tags__asRiskTag other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQuickSearchEntityNodeFieldsData_tags__asRiskTag;
  }

  @override
  void update(
      void Function(GQuickSearchEntityNodeFieldsData_tags__asRiskTagBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQuickSearchEntityNodeFieldsData_tags__asRiskTag build() {
    final _$result = _$v ??
        new _$GQuickSearchEntityNodeFieldsData_tags__asRiskTag._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GQuickSearchEntityNodeFieldsData_tags__asRiskTag',
                'G__typename'),
            level: level);
    replace(_$result);
    return _$result;
  }
}

class _$GQuickSearchInfoFlowNodeFieldsData
    extends GQuickSearchInfoFlowNodeFieldsData {
  @override
  final String G__typename;
  @override
  final GQuickSearchInfoFlowNodeFieldsData_action? action;
  @override
  final String? imageURI;
  @override
  final int? publishTime;
  @override
  final String? description;
  @override
  final BuiltList<String>? highlightTexts;
  @override
  final String nodeId;
  @override
  final String searchType;
  @override
  final String? subtitle;
  @override
  final String? title;
  @override
  final BuiltList<GQuickSearchInfoFlowNodeFieldsData_tags>? tags;
  @override
  final BuiltList<GQuickSearchInfoFlowNodeFieldsData_relatedEntity>?
      relatedEntity;

  factory _$GQuickSearchInfoFlowNodeFieldsData(
          [void Function(GQuickSearchInfoFlowNodeFieldsDataBuilder)?
              updates]) =>
      (new GQuickSearchInfoFlowNodeFieldsDataBuilder()..update(updates))
          .build();

  _$GQuickSearchInfoFlowNodeFieldsData._(
      {required this.G__typename,
      this.action,
      this.imageURI,
      this.publishTime,
      this.description,
      this.highlightTexts,
      required this.nodeId,
      required this.searchType,
      this.subtitle,
      this.title,
      this.tags,
      this.relatedEntity})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GQuickSearchInfoFlowNodeFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        nodeId, 'GQuickSearchInfoFlowNodeFieldsData', 'nodeId');
    BuiltValueNullFieldError.checkNotNull(
        searchType, 'GQuickSearchInfoFlowNodeFieldsData', 'searchType');
  }

  @override
  GQuickSearchInfoFlowNodeFieldsData rebuild(
          void Function(GQuickSearchInfoFlowNodeFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQuickSearchInfoFlowNodeFieldsDataBuilder toBuilder() =>
      new GQuickSearchInfoFlowNodeFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQuickSearchInfoFlowNodeFieldsData &&
        G__typename == other.G__typename &&
        action == other.action &&
        imageURI == other.imageURI &&
        publishTime == other.publishTime &&
        description == other.description &&
        highlightTexts == other.highlightTexts &&
        nodeId == other.nodeId &&
        searchType == other.searchType &&
        subtitle == other.subtitle &&
        title == other.title &&
        tags == other.tags &&
        relatedEntity == other.relatedEntity;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, G__typename.hashCode),
                                                action.hashCode),
                                            imageURI.hashCode),
                                        publishTime.hashCode),
                                    description.hashCode),
                                highlightTexts.hashCode),
                            nodeId.hashCode),
                        searchType.hashCode),
                    subtitle.hashCode),
                title.hashCode),
            tags.hashCode),
        relatedEntity.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GQuickSearchInfoFlowNodeFieldsData')
          ..add('G__typename', G__typename)
          ..add('action', action)
          ..add('imageURI', imageURI)
          ..add('publishTime', publishTime)
          ..add('description', description)
          ..add('highlightTexts', highlightTexts)
          ..add('nodeId', nodeId)
          ..add('searchType', searchType)
          ..add('subtitle', subtitle)
          ..add('title', title)
          ..add('tags', tags)
          ..add('relatedEntity', relatedEntity))
        .toString();
  }
}

class GQuickSearchInfoFlowNodeFieldsDataBuilder
    implements
        Builder<GQuickSearchInfoFlowNodeFieldsData,
            GQuickSearchInfoFlowNodeFieldsDataBuilder> {
  _$GQuickSearchInfoFlowNodeFieldsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GQuickSearchInfoFlowNodeFieldsData_actionBuilder? _action;
  GQuickSearchInfoFlowNodeFieldsData_actionBuilder get action =>
      _$this._action ??= new GQuickSearchInfoFlowNodeFieldsData_actionBuilder();
  set action(GQuickSearchInfoFlowNodeFieldsData_actionBuilder? action) =>
      _$this._action = action;

  String? _imageURI;
  String? get imageURI => _$this._imageURI;
  set imageURI(String? imageURI) => _$this._imageURI = imageURI;

  int? _publishTime;
  int? get publishTime => _$this._publishTime;
  set publishTime(int? publishTime) => _$this._publishTime = publishTime;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ListBuilder<String>? _highlightTexts;
  ListBuilder<String> get highlightTexts =>
      _$this._highlightTexts ??= new ListBuilder<String>();
  set highlightTexts(ListBuilder<String>? highlightTexts) =>
      _$this._highlightTexts = highlightTexts;

  String? _nodeId;
  String? get nodeId => _$this._nodeId;
  set nodeId(String? nodeId) => _$this._nodeId = nodeId;

  String? _searchType;
  String? get searchType => _$this._searchType;
  set searchType(String? searchType) => _$this._searchType = searchType;

  String? _subtitle;
  String? get subtitle => _$this._subtitle;
  set subtitle(String? subtitle) => _$this._subtitle = subtitle;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  ListBuilder<GQuickSearchInfoFlowNodeFieldsData_tags>? _tags;
  ListBuilder<GQuickSearchInfoFlowNodeFieldsData_tags> get tags =>
      _$this._tags ??=
          new ListBuilder<GQuickSearchInfoFlowNodeFieldsData_tags>();
  set tags(ListBuilder<GQuickSearchInfoFlowNodeFieldsData_tags>? tags) =>
      _$this._tags = tags;

  ListBuilder<GQuickSearchInfoFlowNodeFieldsData_relatedEntity>? _relatedEntity;
  ListBuilder<GQuickSearchInfoFlowNodeFieldsData_relatedEntity>
      get relatedEntity => _$this._relatedEntity ??=
          new ListBuilder<GQuickSearchInfoFlowNodeFieldsData_relatedEntity>();
  set relatedEntity(
          ListBuilder<GQuickSearchInfoFlowNodeFieldsData_relatedEntity>?
              relatedEntity) =>
      _$this._relatedEntity = relatedEntity;

  GQuickSearchInfoFlowNodeFieldsDataBuilder() {
    GQuickSearchInfoFlowNodeFieldsData._initializeBuilder(this);
  }

  GQuickSearchInfoFlowNodeFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _action = $v.action?.toBuilder();
      _imageURI = $v.imageURI;
      _publishTime = $v.publishTime;
      _description = $v.description;
      _highlightTexts = $v.highlightTexts?.toBuilder();
      _nodeId = $v.nodeId;
      _searchType = $v.searchType;
      _subtitle = $v.subtitle;
      _title = $v.title;
      _tags = $v.tags?.toBuilder();
      _relatedEntity = $v.relatedEntity?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQuickSearchInfoFlowNodeFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQuickSearchInfoFlowNodeFieldsData;
  }

  @override
  void update(
      void Function(GQuickSearchInfoFlowNodeFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQuickSearchInfoFlowNodeFieldsData build() {
    _$GQuickSearchInfoFlowNodeFieldsData _$result;
    try {
      _$result = _$v ??
          new _$GQuickSearchInfoFlowNodeFieldsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  'GQuickSearchInfoFlowNodeFieldsData', 'G__typename'),
              action: _action?.build(),
              imageURI: imageURI,
              publishTime: publishTime,
              description: description,
              highlightTexts: _highlightTexts?.build(),
              nodeId: BuiltValueNullFieldError.checkNotNull(
                  nodeId, 'GQuickSearchInfoFlowNodeFieldsData', 'nodeId'),
              searchType: BuiltValueNullFieldError.checkNotNull(searchType,
                  'GQuickSearchInfoFlowNodeFieldsData', 'searchType'),
              subtitle: subtitle,
              title: title,
              tags: _tags?.build(),
              relatedEntity: _relatedEntity?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'action';
        _action?.build();

        _$failedField = 'highlightTexts';
        _highlightTexts?.build();

        _$failedField = 'tags';
        _tags?.build();
        _$failedField = 'relatedEntity';
        _relatedEntity?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GQuickSearchInfoFlowNodeFieldsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GQuickSearchInfoFlowNodeFieldsData_action
    extends GQuickSearchInfoFlowNodeFieldsData_action {
  @override
  final String G__typename;
  @override
  final Map<String, dynamic>? args;
  @override
  final String name;
  @override
  final _i1.GActionType type;
  @override
  final String? data;

  factory _$GQuickSearchInfoFlowNodeFieldsData_action(
          [void Function(GQuickSearchInfoFlowNodeFieldsData_actionBuilder)?
              updates]) =>
      (new GQuickSearchInfoFlowNodeFieldsData_actionBuilder()..update(updates))
          .build();

  _$GQuickSearchInfoFlowNodeFieldsData_action._(
      {required this.G__typename,
      this.args,
      required this.name,
      required this.type,
      this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GQuickSearchInfoFlowNodeFieldsData_action', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        name, 'GQuickSearchInfoFlowNodeFieldsData_action', 'name');
    BuiltValueNullFieldError.checkNotNull(
        type, 'GQuickSearchInfoFlowNodeFieldsData_action', 'type');
  }

  @override
  GQuickSearchInfoFlowNodeFieldsData_action rebuild(
          void Function(GQuickSearchInfoFlowNodeFieldsData_actionBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQuickSearchInfoFlowNodeFieldsData_actionBuilder toBuilder() =>
      new GQuickSearchInfoFlowNodeFieldsData_actionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQuickSearchInfoFlowNodeFieldsData_action &&
        G__typename == other.G__typename &&
        args == other.args &&
        name == other.name &&
        type == other.type &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, G__typename.hashCode), args.hashCode),
                name.hashCode),
            type.hashCode),
        data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GQuickSearchInfoFlowNodeFieldsData_action')
          ..add('G__typename', G__typename)
          ..add('args', args)
          ..add('name', name)
          ..add('type', type)
          ..add('data', data))
        .toString();
  }
}

class GQuickSearchInfoFlowNodeFieldsData_actionBuilder
    implements
        Builder<GQuickSearchInfoFlowNodeFieldsData_action,
            GQuickSearchInfoFlowNodeFieldsData_actionBuilder> {
  _$GQuickSearchInfoFlowNodeFieldsData_action? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  Map<String, dynamic>? _args;
  Map<String, dynamic>? get args => _$this._args;
  set args(Map<String, dynamic>? args) => _$this._args = args;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  _i1.GActionType? _type;
  _i1.GActionType? get type => _$this._type;
  set type(_i1.GActionType? type) => _$this._type = type;

  String? _data;
  String? get data => _$this._data;
  set data(String? data) => _$this._data = data;

  GQuickSearchInfoFlowNodeFieldsData_actionBuilder() {
    GQuickSearchInfoFlowNodeFieldsData_action._initializeBuilder(this);
  }

  GQuickSearchInfoFlowNodeFieldsData_actionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _args = $v.args;
      _name = $v.name;
      _type = $v.type;
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQuickSearchInfoFlowNodeFieldsData_action other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQuickSearchInfoFlowNodeFieldsData_action;
  }

  @override
  void update(
      void Function(GQuickSearchInfoFlowNodeFieldsData_actionBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQuickSearchInfoFlowNodeFieldsData_action build() {
    final _$result = _$v ??
        new _$GQuickSearchInfoFlowNodeFieldsData_action._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                'GQuickSearchInfoFlowNodeFieldsData_action', 'G__typename'),
            args: args,
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'GQuickSearchInfoFlowNodeFieldsData_action', 'name'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, 'GQuickSearchInfoFlowNodeFieldsData_action', 'type'),
            data: data);
    replace(_$result);
    return _$result;
  }
}

class _$GQuickSearchInfoFlowNodeFieldsData_tags__base
    extends GQuickSearchInfoFlowNodeFieldsData_tags__base {
  @override
  final String G__typename;

  factory _$GQuickSearchInfoFlowNodeFieldsData_tags__base(
          [void Function(GQuickSearchInfoFlowNodeFieldsData_tags__baseBuilder)?
              updates]) =>
      (new GQuickSearchInfoFlowNodeFieldsData_tags__baseBuilder()
            ..update(updates))
          .build();

  _$GQuickSearchInfoFlowNodeFieldsData_tags__base._({required this.G__typename})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GQuickSearchInfoFlowNodeFieldsData_tags__base', 'G__typename');
  }

  @override
  GQuickSearchInfoFlowNodeFieldsData_tags__base rebuild(
          void Function(GQuickSearchInfoFlowNodeFieldsData_tags__baseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQuickSearchInfoFlowNodeFieldsData_tags__baseBuilder toBuilder() =>
      new GQuickSearchInfoFlowNodeFieldsData_tags__baseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQuickSearchInfoFlowNodeFieldsData_tags__base &&
        G__typename == other.G__typename;
  }

  @override
  int get hashCode {
    return $jf($jc(0, G__typename.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GQuickSearchInfoFlowNodeFieldsData_tags__base')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GQuickSearchInfoFlowNodeFieldsData_tags__baseBuilder
    implements
        Builder<GQuickSearchInfoFlowNodeFieldsData_tags__base,
            GQuickSearchInfoFlowNodeFieldsData_tags__baseBuilder> {
  _$GQuickSearchInfoFlowNodeFieldsData_tags__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GQuickSearchInfoFlowNodeFieldsData_tags__baseBuilder() {
    GQuickSearchInfoFlowNodeFieldsData_tags__base._initializeBuilder(this);
  }

  GQuickSearchInfoFlowNodeFieldsData_tags__baseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQuickSearchInfoFlowNodeFieldsData_tags__base other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQuickSearchInfoFlowNodeFieldsData_tags__base;
  }

  @override
  void update(
      void Function(GQuickSearchInfoFlowNodeFieldsData_tags__baseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQuickSearchInfoFlowNodeFieldsData_tags__base build() {
    final _$result = _$v ??
        new _$GQuickSearchInfoFlowNodeFieldsData_tags__base._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GQuickSearchInfoFlowNodeFieldsData_tags__base',
                'G__typename'));
    replace(_$result);
    return _$result;
  }
}

class _$GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag
    extends GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag {
  @override
  final String G__typename;
  @override
  final String? icon;
  @override
  final String? nameType;
  @override
  final String? matchedName;

  factory _$GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag(
          [void Function(
                  GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTagBuilder)?
              updates]) =>
      (new GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTagBuilder()
            ..update(updates))
          .build();

  _$GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag._(
      {required this.G__typename, this.icon, this.nameType, this.matchedName})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        'GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag',
        'G__typename');
  }

  @override
  GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag rebuild(
          void Function(
                  GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTagBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTagBuilder
      toBuilder() =>
          new GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTagBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag &&
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
    return (newBuiltValueToStringHelper(
            'GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag')
          ..add('G__typename', G__typename)
          ..add('icon', icon)
          ..add('nameType', nameType)
          ..add('matchedName', matchedName))
        .toString();
  }
}

class GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTagBuilder
    implements
        Builder<GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag,
            GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTagBuilder> {
  _$GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag? _$v;

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

  GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTagBuilder() {
    GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag
        ._initializeBuilder(this);
  }

  GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTagBuilder get _$this {
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
  void replace(
      GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag;
  }

  @override
  void update(
      void Function(
              GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTagBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag build() {
    final _$result = _$v ??
        new _$GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag',
                'G__typename'),
            icon: icon,
            nameType: nameType,
            matchedName: matchedName);
    replace(_$result);
    return _$result;
  }
}

class _$GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag
    extends GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag {
  @override
  final String G__typename;
  @override
  final String? name;
  @override
  final GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action? action;

  factory _$GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag(
          [void Function(
                  GQuickSearchInfoFlowNodeFieldsData_tags__asTextTagBuilder)?
              updates]) =>
      (new GQuickSearchInfoFlowNodeFieldsData_tags__asTextTagBuilder()
            ..update(updates))
          .build();

  _$GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag._(
      {required this.G__typename, this.name, this.action})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag', 'G__typename');
  }

  @override
  GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag rebuild(
          void Function(
                  GQuickSearchInfoFlowNodeFieldsData_tags__asTextTagBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQuickSearchInfoFlowNodeFieldsData_tags__asTextTagBuilder toBuilder() =>
      new GQuickSearchInfoFlowNodeFieldsData_tags__asTextTagBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag &&
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
    return (newBuiltValueToStringHelper(
            'GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag')
          ..add('G__typename', G__typename)
          ..add('name', name)
          ..add('action', action))
        .toString();
  }
}

class GQuickSearchInfoFlowNodeFieldsData_tags__asTextTagBuilder
    implements
        Builder<GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag,
            GQuickSearchInfoFlowNodeFieldsData_tags__asTextTagBuilder> {
  _$GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_actionBuilder? _action;
  GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_actionBuilder get action =>
      _$this._action ??=
          new GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_actionBuilder();
  set action(
          GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_actionBuilder?
              action) =>
      _$this._action = action;

  GQuickSearchInfoFlowNodeFieldsData_tags__asTextTagBuilder() {
    GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag._initializeBuilder(this);
  }

  GQuickSearchInfoFlowNodeFieldsData_tags__asTextTagBuilder get _$this {
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
  void replace(GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag;
  }

  @override
  void update(
      void Function(GQuickSearchInfoFlowNodeFieldsData_tags__asTextTagBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag build() {
    _$GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag _$result;
    try {
      _$result = _$v ??
          new _$GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  'GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag',
                  'G__typename'),
              name: name,
              action: _action?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'action';
        _action?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action
    extends GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action {
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

  factory _$GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action(
          [void Function(
                  GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_actionBuilder)?
              updates]) =>
      (new GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_actionBuilder()
            ..update(updates))
          .build();

  _$GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action._(
      {required this.G__typename,
      required this.name,
      required this.type,
      this.args,
      this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        'GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(name,
        'GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action', 'name');
    BuiltValueNullFieldError.checkNotNull(type,
        'GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action', 'type');
  }

  @override
  GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action rebuild(
          void Function(
                  GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_actionBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_actionBuilder
      toBuilder() =>
          new GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_actionBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action &&
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
    return (newBuiltValueToStringHelper(
            'GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action')
          ..add('G__typename', G__typename)
          ..add('name', name)
          ..add('type', type)
          ..add('args', args)
          ..add('data', data))
        .toString();
  }
}

class GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_actionBuilder
    implements
        Builder<GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action,
            GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_actionBuilder> {
  _$GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action? _$v;

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

  GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_actionBuilder() {
    GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action
        ._initializeBuilder(this);
  }

  GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_actionBuilder get _$this {
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
  void replace(
      GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action;
  }

  @override
  void update(
      void Function(
              GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_actionBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action build() {
    final _$result = _$v ??
        new _$GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action',
                'G__typename'),
            name: BuiltValueNullFieldError.checkNotNull(
                name,
                'GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action',
                'name'),
            type: BuiltValueNullFieldError.checkNotNull(
                type,
                'GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action',
                'type'),
            args: args,
            data: data);
    replace(_$result);
    return _$result;
  }
}

class _$GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag
    extends GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag {
  @override
  final String G__typename;
  @override
  final int? level;

  factory _$GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag(
          [void Function(
                  GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTagBuilder)?
              updates]) =>
      (new GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTagBuilder()
            ..update(updates))
          .build();

  _$GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag._(
      {required this.G__typename, this.level})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag', 'G__typename');
  }

  @override
  GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag rebuild(
          void Function(
                  GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTagBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTagBuilder toBuilder() =>
      new GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTagBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag &&
        G__typename == other.G__typename &&
        level == other.level;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), level.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag')
          ..add('G__typename', G__typename)
          ..add('level', level))
        .toString();
  }
}

class GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTagBuilder
    implements
        Builder<GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag,
            GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTagBuilder> {
  _$GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _level;
  int? get level => _$this._level;
  set level(int? level) => _$this._level = level;

  GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTagBuilder() {
    GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag._initializeBuilder(this);
  }

  GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTagBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _level = $v.level;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag;
  }

  @override
  void update(
      void Function(GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTagBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag build() {
    final _$result = _$v ??
        new _$GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag',
                'G__typename'),
            level: level);
    replace(_$result);
    return _$result;
  }
}

class _$GQuickSearchInfoFlowNodeFieldsData_relatedEntity
    extends GQuickSearchInfoFlowNodeFieldsData_relatedEntity {
  @override
  final String G__typename;
  @override
  final String? entityId;
  @override
  final _i1.GEntityType entityType;
  @override
  final String entityName;
  @override
  final String? portraitURL;

  factory _$GQuickSearchInfoFlowNodeFieldsData_relatedEntity(
          [void Function(
                  GQuickSearchInfoFlowNodeFieldsData_relatedEntityBuilder)?
              updates]) =>
      (new GQuickSearchInfoFlowNodeFieldsData_relatedEntityBuilder()
            ..update(updates))
          .build();

  _$GQuickSearchInfoFlowNodeFieldsData_relatedEntity._(
      {required this.G__typename,
      this.entityId,
      required this.entityType,
      required this.entityName,
      this.portraitURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GQuickSearchInfoFlowNodeFieldsData_relatedEntity', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(entityType,
        'GQuickSearchInfoFlowNodeFieldsData_relatedEntity', 'entityType');
    BuiltValueNullFieldError.checkNotNull(entityName,
        'GQuickSearchInfoFlowNodeFieldsData_relatedEntity', 'entityName');
  }

  @override
  GQuickSearchInfoFlowNodeFieldsData_relatedEntity rebuild(
          void Function(GQuickSearchInfoFlowNodeFieldsData_relatedEntityBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQuickSearchInfoFlowNodeFieldsData_relatedEntityBuilder toBuilder() =>
      new GQuickSearchInfoFlowNodeFieldsData_relatedEntityBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQuickSearchInfoFlowNodeFieldsData_relatedEntity &&
        G__typename == other.G__typename &&
        entityId == other.entityId &&
        entityType == other.entityType &&
        entityName == other.entityName &&
        portraitURL == other.portraitURL;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, G__typename.hashCode), entityId.hashCode),
                entityType.hashCode),
            entityName.hashCode),
        portraitURL.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GQuickSearchInfoFlowNodeFieldsData_relatedEntity')
          ..add('G__typename', G__typename)
          ..add('entityId', entityId)
          ..add('entityType', entityType)
          ..add('entityName', entityName)
          ..add('portraitURL', portraitURL))
        .toString();
  }
}

class GQuickSearchInfoFlowNodeFieldsData_relatedEntityBuilder
    implements
        Builder<GQuickSearchInfoFlowNodeFieldsData_relatedEntity,
            GQuickSearchInfoFlowNodeFieldsData_relatedEntityBuilder> {
  _$GQuickSearchInfoFlowNodeFieldsData_relatedEntity? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _entityId;
  String? get entityId => _$this._entityId;
  set entityId(String? entityId) => _$this._entityId = entityId;

  _i1.GEntityType? _entityType;
  _i1.GEntityType? get entityType => _$this._entityType;
  set entityType(_i1.GEntityType? entityType) =>
      _$this._entityType = entityType;

  String? _entityName;
  String? get entityName => _$this._entityName;
  set entityName(String? entityName) => _$this._entityName = entityName;

  String? _portraitURL;
  String? get portraitURL => _$this._portraitURL;
  set portraitURL(String? portraitURL) => _$this._portraitURL = portraitURL;

  GQuickSearchInfoFlowNodeFieldsData_relatedEntityBuilder() {
    GQuickSearchInfoFlowNodeFieldsData_relatedEntity._initializeBuilder(this);
  }

  GQuickSearchInfoFlowNodeFieldsData_relatedEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _entityId = $v.entityId;
      _entityType = $v.entityType;
      _entityName = $v.entityName;
      _portraitURL = $v.portraitURL;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQuickSearchInfoFlowNodeFieldsData_relatedEntity other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQuickSearchInfoFlowNodeFieldsData_relatedEntity;
  }

  @override
  void update(
      void Function(GQuickSearchInfoFlowNodeFieldsData_relatedEntityBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQuickSearchInfoFlowNodeFieldsData_relatedEntity build() {
    final _$result = _$v ??
        new _$GQuickSearchInfoFlowNodeFieldsData_relatedEntity._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GQuickSearchInfoFlowNodeFieldsData_relatedEntity',
                'G__typename'),
            entityId: entityId,
            entityType: BuiltValueNullFieldError.checkNotNull(
                entityType,
                'GQuickSearchInfoFlowNodeFieldsData_relatedEntity',
                'entityType'),
            entityName: BuiltValueNullFieldError.checkNotNull(
                entityName,
                'GQuickSearchInfoFlowNodeFieldsData_relatedEntity',
                'entityName'),
            portraitURL: portraitURL);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
