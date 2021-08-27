// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_nodes_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GNewsFieldsData> _$gNewsFieldsDataSerializer =
    new _$GNewsFieldsDataSerializer();
Serializer<GNewsFieldsData_relatedEntity>
    _$gNewsFieldsDataRelatedEntitySerializer =
    new _$GNewsFieldsData_relatedEntitySerializer();

class _$GNewsFieldsDataSerializer
    implements StructuredSerializer<GNewsFieldsData> {
  @override
  final Iterable<Type> types = const [GNewsFieldsData, _$GNewsFieldsData];
  @override
  final String wireName = 'GNewsFieldsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GNewsFieldsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'relatedEntity',
      serializers.serialize(object.relatedEntity,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GNewsFieldsData_relatedEntity)])),
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
  GNewsFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GNewsFieldsDataBuilder();

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
                const FullType(GNewsFieldsData_relatedEntity)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GNewsFieldsData_relatedEntitySerializer
    implements StructuredSerializer<GNewsFieldsData_relatedEntity> {
  @override
  final Iterable<Type> types = const [
    GNewsFieldsData_relatedEntity,
    _$GNewsFieldsData_relatedEntity
  ];
  @override
  final String wireName = 'GNewsFieldsData_relatedEntity';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GNewsFieldsData_relatedEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'entityType',
      serializers.serialize(object.entityType,
          specifiedType: const FullType(_i2.GEntityType)),
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
  GNewsFieldsData_relatedEntity deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GNewsFieldsData_relatedEntityBuilder();

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
                  specifiedType: const FullType(_i2.GEntityType))
              as _i2.GEntityType;
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

class _$GNewsFieldsData extends GNewsFieldsData {
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
  final BuiltList<GNewsFieldsData_relatedEntity> relatedEntity;

  factory _$GNewsFieldsData([void Function(GNewsFieldsDataBuilder)? updates]) =>
      (new GNewsFieldsDataBuilder()..update(updates)).build();

  _$GNewsFieldsData._(
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
        G__typename, 'GNewsFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        relatedEntity, 'GNewsFieldsData', 'relatedEntity');
  }

  @override
  GNewsFieldsData rebuild(void Function(GNewsFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GNewsFieldsDataBuilder toBuilder() =>
      new GNewsFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GNewsFieldsData &&
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
    return (newBuiltValueToStringHelper('GNewsFieldsData')
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

class GNewsFieldsDataBuilder
    implements Builder<GNewsFieldsData, GNewsFieldsDataBuilder> {
  _$GNewsFieldsData? _$v;

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

  ListBuilder<GNewsFieldsData_relatedEntity>? _relatedEntity;
  ListBuilder<GNewsFieldsData_relatedEntity> get relatedEntity =>
      _$this._relatedEntity ??=
          new ListBuilder<GNewsFieldsData_relatedEntity>();
  set relatedEntity(
          ListBuilder<GNewsFieldsData_relatedEntity>? relatedEntity) =>
      _$this._relatedEntity = relatedEntity;

  GNewsFieldsDataBuilder() {
    GNewsFieldsData._initializeBuilder(this);
  }

  GNewsFieldsDataBuilder get _$this {
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
  void replace(GNewsFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GNewsFieldsData;
  }

  @override
  void update(void Function(GNewsFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GNewsFieldsData build() {
    _$GNewsFieldsData _$result;
    try {
      _$result = _$v ??
          new _$GNewsFieldsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GNewsFieldsData', 'G__typename'),
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
            'GNewsFieldsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GNewsFieldsData_relatedEntity extends GNewsFieldsData_relatedEntity {
  @override
  final String G__typename;
  @override
  final String? entityId;
  @override
  final _i2.GEntityType entityType;
  @override
  final String entityName;
  @override
  final String? portraitURL;

  factory _$GNewsFieldsData_relatedEntity(
          [void Function(GNewsFieldsData_relatedEntityBuilder)? updates]) =>
      (new GNewsFieldsData_relatedEntityBuilder()..update(updates)).build();

  _$GNewsFieldsData_relatedEntity._(
      {required this.G__typename,
      this.entityId,
      required this.entityType,
      required this.entityName,
      this.portraitURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GNewsFieldsData_relatedEntity', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        entityType, 'GNewsFieldsData_relatedEntity', 'entityType');
    BuiltValueNullFieldError.checkNotNull(
        entityName, 'GNewsFieldsData_relatedEntity', 'entityName');
  }

  @override
  GNewsFieldsData_relatedEntity rebuild(
          void Function(GNewsFieldsData_relatedEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GNewsFieldsData_relatedEntityBuilder toBuilder() =>
      new GNewsFieldsData_relatedEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GNewsFieldsData_relatedEntity &&
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
    return (newBuiltValueToStringHelper('GNewsFieldsData_relatedEntity')
          ..add('G__typename', G__typename)
          ..add('entityId', entityId)
          ..add('entityType', entityType)
          ..add('entityName', entityName)
          ..add('portraitURL', portraitURL))
        .toString();
  }
}

class GNewsFieldsData_relatedEntityBuilder
    implements
        Builder<GNewsFieldsData_relatedEntity,
            GNewsFieldsData_relatedEntityBuilder> {
  _$GNewsFieldsData_relatedEntity? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _entityId;
  String? get entityId => _$this._entityId;
  set entityId(String? entityId) => _$this._entityId = entityId;

  _i2.GEntityType? _entityType;
  _i2.GEntityType? get entityType => _$this._entityType;
  set entityType(_i2.GEntityType? entityType) =>
      _$this._entityType = entityType;

  String? _entityName;
  String? get entityName => _$this._entityName;
  set entityName(String? entityName) => _$this._entityName = entityName;

  String? _portraitURL;
  String? get portraitURL => _$this._portraitURL;
  set portraitURL(String? portraitURL) => _$this._portraitURL = portraitURL;

  GNewsFieldsData_relatedEntityBuilder() {
    GNewsFieldsData_relatedEntity._initializeBuilder(this);
  }

  GNewsFieldsData_relatedEntityBuilder get _$this {
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
  void replace(GNewsFieldsData_relatedEntity other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GNewsFieldsData_relatedEntity;
  }

  @override
  void update(void Function(GNewsFieldsData_relatedEntityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GNewsFieldsData_relatedEntity build() {
    final _$result = _$v ??
        new _$GNewsFieldsData_relatedEntity._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GNewsFieldsData_relatedEntity', 'G__typename'),
            entityId: entityId,
            entityType: BuiltValueNullFieldError.checkNotNull(
                entityType, 'GNewsFieldsData_relatedEntity', 'entityType'),
            entityName: BuiltValueNullFieldError.checkNotNull(
                entityName, 'GNewsFieldsData_relatedEntity', 'entityName'),
            portraitURL: portraitURL);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
