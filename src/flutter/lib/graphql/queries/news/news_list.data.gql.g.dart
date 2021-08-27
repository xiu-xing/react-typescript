// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_list.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GNewsListData> _$gNewsListDataSerializer =
    new _$GNewsListDataSerializer();
Serializer<GNewsListData_newsList> _$gNewsListDataNewsListSerializer =
    new _$GNewsListData_newsListSerializer();
Serializer<GNewsListData_newsList_nodes>
    _$gNewsListDataNewsListNodesSerializer =
    new _$GNewsListData_newsList_nodesSerializer();
Serializer<GNewsListData_newsList_nodes_relatedEntity>
    _$gNewsListDataNewsListNodesRelatedEntitySerializer =
    new _$GNewsListData_newsList_nodes_relatedEntitySerializer();
Serializer<GNewsListData_newsList_pageInfo>
    _$gNewsListDataNewsListPageInfoSerializer =
    new _$GNewsListData_newsList_pageInfoSerializer();

class _$GNewsListDataSerializer implements StructuredSerializer<GNewsListData> {
  @override
  final Iterable<Type> types = const [GNewsListData, _$GNewsListData];
  @override
  final String wireName = 'GNewsListData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GNewsListData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.newsList;
    if (value != null) {
      result
        ..add('newsList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GNewsListData_newsList)));
    }
    return result;
  }

  @override
  GNewsListData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GNewsListDataBuilder();

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
        case 'newsList':
          result.newsList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GNewsListData_newsList))!
              as GNewsListData_newsList);
          break;
      }
    }

    return result.build();
  }
}

class _$GNewsListData_newsListSerializer
    implements StructuredSerializer<GNewsListData_newsList> {
  @override
  final Iterable<Type> types = const [
    GNewsListData_newsList,
    _$GNewsListData_newsList
  ];
  @override
  final String wireName = 'GNewsListData_newsList';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GNewsListData_newsList object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'pageInfo',
      serializers.serialize(object.pageInfo,
          specifiedType: const FullType(GNewsListData_newsList_pageInfo)),
    ];
    Object? value;
    value = object.nodes;
    if (value != null) {
      result
        ..add('nodes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList,
                const [const FullType(GNewsListData_newsList_nodes)])));
    }
    return result;
  }

  @override
  GNewsListData_newsList deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GNewsListData_newsListBuilder();

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
        case 'nodes':
          result.nodes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GNewsListData_newsList_nodes)
              ]))! as BuiltList<Object?>);
          break;
        case 'pageInfo':
          result.pageInfo.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GNewsListData_newsList_pageInfo))!
              as GNewsListData_newsList_pageInfo);
          break;
      }
    }

    return result.build();
  }
}

class _$GNewsListData_newsList_nodesSerializer
    implements StructuredSerializer<GNewsListData_newsList_nodes> {
  @override
  final Iterable<Type> types = const [
    GNewsListData_newsList_nodes,
    _$GNewsListData_newsList_nodes
  ];
  @override
  final String wireName = 'GNewsListData_newsList_nodes';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GNewsListData_newsList_nodes object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'relatedEntity',
      serializers.serialize(object.relatedEntity,
          specifiedType: const FullType(BuiltList, const [
            const FullType(GNewsListData_newsList_nodes_relatedEntity)
          ])),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
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
    value = object.abstract;
    if (value != null) {
      result
        ..add('abstract')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.link;
    if (value != null) {
      result
        ..add('link')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.publishTime;
    if (value != null) {
      result
        ..add('publishTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.source;
    if (value != null) {
      result
        ..add('source')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.content;
    if (value != null) {
      result
        ..add('content')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pictureURL;
    if (value != null) {
      result
        ..add('pictureURL')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GNewsListData_newsList_nodes deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GNewsListData_newsList_nodesBuilder();

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
              specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'abstract':
          result.abstract = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'link':
          result.link = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'publishTime':
          result.publishTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'source':
          result.source = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'content':
          result.content = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pictureURL':
          result.pictureURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'relatedEntity':
          result.relatedEntity.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GNewsListData_newsList_nodes_relatedEntity)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GNewsListData_newsList_nodes_relatedEntitySerializer
    implements
        StructuredSerializer<GNewsListData_newsList_nodes_relatedEntity> {
  @override
  final Iterable<Type> types = const [
    GNewsListData_newsList_nodes_relatedEntity,
    _$GNewsListData_newsList_nodes_relatedEntity
  ];
  @override
  final String wireName = 'GNewsListData_newsList_nodes_relatedEntity';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GNewsListData_newsList_nodes_relatedEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'entityType',
      serializers.serialize(object.entityType,
          specifiedType: const FullType(_i4.GEntityType)),
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
  GNewsListData_newsList_nodes_relatedEntity deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GNewsListData_newsList_nodes_relatedEntityBuilder();

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
                  specifiedType: const FullType(_i4.GEntityType))
              as _i4.GEntityType;
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

class _$GNewsListData_newsList_pageInfoSerializer
    implements StructuredSerializer<GNewsListData_newsList_pageInfo> {
  @override
  final Iterable<Type> types = const [
    GNewsListData_newsList_pageInfo,
    _$GNewsListData_newsList_pageInfo
  ];
  @override
  final String wireName = 'GNewsListData_newsList_pageInfo';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GNewsListData_newsList_pageInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'hasPreviousPage',
      serializers.serialize(object.hasPreviousPage,
          specifiedType: const FullType(bool)),
      'hasNextPage',
      serializers.serialize(object.hasNextPage,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.startCursor;
    if (value != null) {
      result
        ..add('startCursor')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.endCursor;
    if (value != null) {
      result
        ..add('endCursor')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GNewsListData_newsList_pageInfo deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GNewsListData_newsList_pageInfoBuilder();

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
        case 'hasPreviousPage':
          result.hasPreviousPage = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'hasNextPage':
          result.hasNextPage = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'startCursor':
          result.startCursor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'endCursor':
          result.endCursor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GNewsListData extends GNewsListData {
  @override
  final String G__typename;
  @override
  final GNewsListData_newsList? newsList;

  factory _$GNewsListData([void Function(GNewsListDataBuilder)? updates]) =>
      (new GNewsListDataBuilder()..update(updates)).build();

  _$GNewsListData._({required this.G__typename, this.newsList}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GNewsListData', 'G__typename');
  }

  @override
  GNewsListData rebuild(void Function(GNewsListDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GNewsListDataBuilder toBuilder() => new GNewsListDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GNewsListData &&
        G__typename == other.G__typename &&
        newsList == other.newsList;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), newsList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GNewsListData')
          ..add('G__typename', G__typename)
          ..add('newsList', newsList))
        .toString();
  }
}

class GNewsListDataBuilder
    implements Builder<GNewsListData, GNewsListDataBuilder> {
  _$GNewsListData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GNewsListData_newsListBuilder? _newsList;
  GNewsListData_newsListBuilder get newsList =>
      _$this._newsList ??= new GNewsListData_newsListBuilder();
  set newsList(GNewsListData_newsListBuilder? newsList) =>
      _$this._newsList = newsList;

  GNewsListDataBuilder() {
    GNewsListData._initializeBuilder(this);
  }

  GNewsListDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _newsList = $v.newsList?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GNewsListData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GNewsListData;
  }

  @override
  void update(void Function(GNewsListDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GNewsListData build() {
    _$GNewsListData _$result;
    try {
      _$result = _$v ??
          new _$GNewsListData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GNewsListData', 'G__typename'),
              newsList: _newsList?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'newsList';
        _newsList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GNewsListData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GNewsListData_newsList extends GNewsListData_newsList {
  @override
  final String G__typename;
  @override
  final BuiltList<GNewsListData_newsList_nodes>? nodes;
  @override
  final GNewsListData_newsList_pageInfo pageInfo;

  factory _$GNewsListData_newsList(
          [void Function(GNewsListData_newsListBuilder)? updates]) =>
      (new GNewsListData_newsListBuilder()..update(updates)).build();

  _$GNewsListData_newsList._(
      {required this.G__typename, this.nodes, required this.pageInfo})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GNewsListData_newsList', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        pageInfo, 'GNewsListData_newsList', 'pageInfo');
  }

  @override
  GNewsListData_newsList rebuild(
          void Function(GNewsListData_newsListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GNewsListData_newsListBuilder toBuilder() =>
      new GNewsListData_newsListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GNewsListData_newsList &&
        G__typename == other.G__typename &&
        nodes == other.nodes &&
        pageInfo == other.pageInfo;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, G__typename.hashCode), nodes.hashCode), pageInfo.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GNewsListData_newsList')
          ..add('G__typename', G__typename)
          ..add('nodes', nodes)
          ..add('pageInfo', pageInfo))
        .toString();
  }
}

class GNewsListData_newsListBuilder
    implements Builder<GNewsListData_newsList, GNewsListData_newsListBuilder> {
  _$GNewsListData_newsList? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GNewsListData_newsList_nodes>? _nodes;
  ListBuilder<GNewsListData_newsList_nodes> get nodes =>
      _$this._nodes ??= new ListBuilder<GNewsListData_newsList_nodes>();
  set nodes(ListBuilder<GNewsListData_newsList_nodes>? nodes) =>
      _$this._nodes = nodes;

  GNewsListData_newsList_pageInfoBuilder? _pageInfo;
  GNewsListData_newsList_pageInfoBuilder get pageInfo =>
      _$this._pageInfo ??= new GNewsListData_newsList_pageInfoBuilder();
  set pageInfo(GNewsListData_newsList_pageInfoBuilder? pageInfo) =>
      _$this._pageInfo = pageInfo;

  GNewsListData_newsListBuilder() {
    GNewsListData_newsList._initializeBuilder(this);
  }

  GNewsListData_newsListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _nodes = $v.nodes?.toBuilder();
      _pageInfo = $v.pageInfo.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GNewsListData_newsList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GNewsListData_newsList;
  }

  @override
  void update(void Function(GNewsListData_newsListBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GNewsListData_newsList build() {
    _$GNewsListData_newsList _$result;
    try {
      _$result = _$v ??
          new _$GNewsListData_newsList._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GNewsListData_newsList', 'G__typename'),
              nodes: _nodes?.build(),
              pageInfo: pageInfo.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'nodes';
        _nodes?.build();
        _$failedField = 'pageInfo';
        pageInfo.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GNewsListData_newsList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GNewsListData_newsList_nodes extends GNewsListData_newsList_nodes {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? abstract;
  @override
  final String? link;
  @override
  final String? publishTime;
  @override
  final String? source;
  @override
  final String? content;
  @override
  final String? pictureURL;
  @override
  final BuiltList<GNewsListData_newsList_nodes_relatedEntity> relatedEntity;

  factory _$GNewsListData_newsList_nodes(
          [void Function(GNewsListData_newsList_nodesBuilder)? updates]) =>
      (new GNewsListData_newsList_nodesBuilder()..update(updates)).build();

  _$GNewsListData_newsList_nodes._(
      {required this.G__typename,
      this.id,
      this.title,
      this.abstract,
      this.link,
      this.publishTime,
      this.source,
      this.content,
      this.pictureURL,
      required this.relatedEntity})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GNewsListData_newsList_nodes', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        relatedEntity, 'GNewsListData_newsList_nodes', 'relatedEntity');
  }

  @override
  GNewsListData_newsList_nodes rebuild(
          void Function(GNewsListData_newsList_nodesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GNewsListData_newsList_nodesBuilder toBuilder() =>
      new GNewsListData_newsList_nodesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GNewsListData_newsList_nodes &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        abstract == other.abstract &&
        link == other.link &&
        publishTime == other.publishTime &&
        source == other.source &&
        content == other.content &&
        pictureURL == other.pictureURL &&
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
                                    $jc($jc(0, G__typename.hashCode),
                                        id.hashCode),
                                    title.hashCode),
                                abstract.hashCode),
                            link.hashCode),
                        publishTime.hashCode),
                    source.hashCode),
                content.hashCode),
            pictureURL.hashCode),
        relatedEntity.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GNewsListData_newsList_nodes')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('abstract', abstract)
          ..add('link', link)
          ..add('publishTime', publishTime)
          ..add('source', source)
          ..add('content', content)
          ..add('pictureURL', pictureURL)
          ..add('relatedEntity', relatedEntity))
        .toString();
  }
}

class GNewsListData_newsList_nodesBuilder
    implements
        Builder<GNewsListData_newsList_nodes,
            GNewsListData_newsList_nodesBuilder> {
  _$GNewsListData_newsList_nodes? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _abstract;
  String? get abstract => _$this._abstract;
  set abstract(String? abstract) => _$this._abstract = abstract;

  String? _link;
  String? get link => _$this._link;
  set link(String? link) => _$this._link = link;

  String? _publishTime;
  String? get publishTime => _$this._publishTime;
  set publishTime(String? publishTime) => _$this._publishTime = publishTime;

  String? _source;
  String? get source => _$this._source;
  set source(String? source) => _$this._source = source;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  String? _pictureURL;
  String? get pictureURL => _$this._pictureURL;
  set pictureURL(String? pictureURL) => _$this._pictureURL = pictureURL;

  ListBuilder<GNewsListData_newsList_nodes_relatedEntity>? _relatedEntity;
  ListBuilder<GNewsListData_newsList_nodes_relatedEntity> get relatedEntity =>
      _$this._relatedEntity ??=
          new ListBuilder<GNewsListData_newsList_nodes_relatedEntity>();
  set relatedEntity(
          ListBuilder<GNewsListData_newsList_nodes_relatedEntity>?
              relatedEntity) =>
      _$this._relatedEntity = relatedEntity;

  GNewsListData_newsList_nodesBuilder() {
    GNewsListData_newsList_nodes._initializeBuilder(this);
  }

  GNewsListData_newsList_nodesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _abstract = $v.abstract;
      _link = $v.link;
      _publishTime = $v.publishTime;
      _source = $v.source;
      _content = $v.content;
      _pictureURL = $v.pictureURL;
      _relatedEntity = $v.relatedEntity.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GNewsListData_newsList_nodes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GNewsListData_newsList_nodes;
  }

  @override
  void update(void Function(GNewsListData_newsList_nodesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GNewsListData_newsList_nodes build() {
    _$GNewsListData_newsList_nodes _$result;
    try {
      _$result = _$v ??
          new _$GNewsListData_newsList_nodes._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GNewsListData_newsList_nodes', 'G__typename'),
              id: id,
              title: title,
              abstract: abstract,
              link: link,
              publishTime: publishTime,
              source: source,
              content: content,
              pictureURL: pictureURL,
              relatedEntity: relatedEntity.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'relatedEntity';
        relatedEntity.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GNewsListData_newsList_nodes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GNewsListData_newsList_nodes_relatedEntity
    extends GNewsListData_newsList_nodes_relatedEntity {
  @override
  final String G__typename;
  @override
  final String? entityId;
  @override
  final _i4.GEntityType entityType;
  @override
  final String entityName;
  @override
  final String? portraitURL;

  factory _$GNewsListData_newsList_nodes_relatedEntity(
          [void Function(GNewsListData_newsList_nodes_relatedEntityBuilder)?
              updates]) =>
      (new GNewsListData_newsList_nodes_relatedEntityBuilder()..update(updates))
          .build();

  _$GNewsListData_newsList_nodes_relatedEntity._(
      {required this.G__typename,
      this.entityId,
      required this.entityType,
      required this.entityName,
      this.portraitURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GNewsListData_newsList_nodes_relatedEntity', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        entityType, 'GNewsListData_newsList_nodes_relatedEntity', 'entityType');
    BuiltValueNullFieldError.checkNotNull(
        entityName, 'GNewsListData_newsList_nodes_relatedEntity', 'entityName');
  }

  @override
  GNewsListData_newsList_nodes_relatedEntity rebuild(
          void Function(GNewsListData_newsList_nodes_relatedEntityBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GNewsListData_newsList_nodes_relatedEntityBuilder toBuilder() =>
      new GNewsListData_newsList_nodes_relatedEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GNewsListData_newsList_nodes_relatedEntity &&
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
            'GNewsListData_newsList_nodes_relatedEntity')
          ..add('G__typename', G__typename)
          ..add('entityId', entityId)
          ..add('entityType', entityType)
          ..add('entityName', entityName)
          ..add('portraitURL', portraitURL))
        .toString();
  }
}

class GNewsListData_newsList_nodes_relatedEntityBuilder
    implements
        Builder<GNewsListData_newsList_nodes_relatedEntity,
            GNewsListData_newsList_nodes_relatedEntityBuilder> {
  _$GNewsListData_newsList_nodes_relatedEntity? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _entityId;
  String? get entityId => _$this._entityId;
  set entityId(String? entityId) => _$this._entityId = entityId;

  _i4.GEntityType? _entityType;
  _i4.GEntityType? get entityType => _$this._entityType;
  set entityType(_i4.GEntityType? entityType) =>
      _$this._entityType = entityType;

  String? _entityName;
  String? get entityName => _$this._entityName;
  set entityName(String? entityName) => _$this._entityName = entityName;

  String? _portraitURL;
  String? get portraitURL => _$this._portraitURL;
  set portraitURL(String? portraitURL) => _$this._portraitURL = portraitURL;

  GNewsListData_newsList_nodes_relatedEntityBuilder() {
    GNewsListData_newsList_nodes_relatedEntity._initializeBuilder(this);
  }

  GNewsListData_newsList_nodes_relatedEntityBuilder get _$this {
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
  void replace(GNewsListData_newsList_nodes_relatedEntity other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GNewsListData_newsList_nodes_relatedEntity;
  }

  @override
  void update(
      void Function(GNewsListData_newsList_nodes_relatedEntityBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GNewsListData_newsList_nodes_relatedEntity build() {
    final _$result = _$v ??
        new _$GNewsListData_newsList_nodes_relatedEntity._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                'GNewsListData_newsList_nodes_relatedEntity', 'G__typename'),
            entityId: entityId,
            entityType: BuiltValueNullFieldError.checkNotNull(entityType,
                'GNewsListData_newsList_nodes_relatedEntity', 'entityType'),
            entityName: BuiltValueNullFieldError.checkNotNull(entityName,
                'GNewsListData_newsList_nodes_relatedEntity', 'entityName'),
            portraitURL: portraitURL);
    replace(_$result);
    return _$result;
  }
}

class _$GNewsListData_newsList_pageInfo
    extends GNewsListData_newsList_pageInfo {
  @override
  final String G__typename;
  @override
  final bool hasPreviousPage;
  @override
  final bool hasNextPage;
  @override
  final String? startCursor;
  @override
  final String? endCursor;

  factory _$GNewsListData_newsList_pageInfo(
          [void Function(GNewsListData_newsList_pageInfoBuilder)? updates]) =>
      (new GNewsListData_newsList_pageInfoBuilder()..update(updates)).build();

  _$GNewsListData_newsList_pageInfo._(
      {required this.G__typename,
      required this.hasPreviousPage,
      required this.hasNextPage,
      this.startCursor,
      this.endCursor})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GNewsListData_newsList_pageInfo', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        hasPreviousPage, 'GNewsListData_newsList_pageInfo', 'hasPreviousPage');
    BuiltValueNullFieldError.checkNotNull(
        hasNextPage, 'GNewsListData_newsList_pageInfo', 'hasNextPage');
  }

  @override
  GNewsListData_newsList_pageInfo rebuild(
          void Function(GNewsListData_newsList_pageInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GNewsListData_newsList_pageInfoBuilder toBuilder() =>
      new GNewsListData_newsList_pageInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GNewsListData_newsList_pageInfo &&
        G__typename == other.G__typename &&
        hasPreviousPage == other.hasPreviousPage &&
        hasNextPage == other.hasNextPage &&
        startCursor == other.startCursor &&
        endCursor == other.endCursor;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, G__typename.hashCode), hasPreviousPage.hashCode),
                hasNextPage.hashCode),
            startCursor.hashCode),
        endCursor.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GNewsListData_newsList_pageInfo')
          ..add('G__typename', G__typename)
          ..add('hasPreviousPage', hasPreviousPage)
          ..add('hasNextPage', hasNextPage)
          ..add('startCursor', startCursor)
          ..add('endCursor', endCursor))
        .toString();
  }
}

class GNewsListData_newsList_pageInfoBuilder
    implements
        Builder<GNewsListData_newsList_pageInfo,
            GNewsListData_newsList_pageInfoBuilder> {
  _$GNewsListData_newsList_pageInfo? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _hasPreviousPage;
  bool? get hasPreviousPage => _$this._hasPreviousPage;
  set hasPreviousPage(bool? hasPreviousPage) =>
      _$this._hasPreviousPage = hasPreviousPage;

  bool? _hasNextPage;
  bool? get hasNextPage => _$this._hasNextPage;
  set hasNextPage(bool? hasNextPage) => _$this._hasNextPage = hasNextPage;

  String? _startCursor;
  String? get startCursor => _$this._startCursor;
  set startCursor(String? startCursor) => _$this._startCursor = startCursor;

  String? _endCursor;
  String? get endCursor => _$this._endCursor;
  set endCursor(String? endCursor) => _$this._endCursor = endCursor;

  GNewsListData_newsList_pageInfoBuilder() {
    GNewsListData_newsList_pageInfo._initializeBuilder(this);
  }

  GNewsListData_newsList_pageInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _hasPreviousPage = $v.hasPreviousPage;
      _hasNextPage = $v.hasNextPage;
      _startCursor = $v.startCursor;
      _endCursor = $v.endCursor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GNewsListData_newsList_pageInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GNewsListData_newsList_pageInfo;
  }

  @override
  void update(void Function(GNewsListData_newsList_pageInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GNewsListData_newsList_pageInfo build() {
    final _$result = _$v ??
        new _$GNewsListData_newsList_pageInfo._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GNewsListData_newsList_pageInfo', 'G__typename'),
            hasPreviousPage: BuiltValueNullFieldError.checkNotNull(
                hasPreviousPage,
                'GNewsListData_newsList_pageInfo',
                'hasPreviousPage'),
            hasNextPage: BuiltValueNullFieldError.checkNotNull(
                hasNextPage, 'GNewsListData_newsList_pageInfo', 'hasNextPage'),
            startCursor: startCursor,
            endCursor: endCursor);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
