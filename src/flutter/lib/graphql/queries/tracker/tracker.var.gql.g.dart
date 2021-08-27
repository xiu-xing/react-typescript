// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracker.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GTrackerRecommendationsVars>
    _$gTrackerRecommendationsVarsSerializer =
    new _$GTrackerRecommendationsVarsSerializer();
Serializer<GTrackedEntityCountVars> _$gTrackedEntityCountVarsSerializer =
    new _$GTrackedEntityCountVarsSerializer();
Serializer<GAppTrackerTimelineVars> _$gAppTrackerTimelineVarsSerializer =
    new _$GAppTrackerTimelineVarsSerializer();
Serializer<GAppTrackerTabsVars> _$gAppTrackerTabsVarsSerializer =
    new _$GAppTrackerTabsVarsSerializer();
Serializer<GTrackTagsVars> _$gTrackTagsVarsSerializer =
    new _$GTrackTagsVarsSerializer();
Serializer<GTrackedEntitiesVars> _$gTrackedEntitiesVarsSerializer =
    new _$GTrackedEntitiesVarsSerializer();
Serializer<GTrackableThemeVars> _$gTrackableThemeVarsSerializer =
    new _$GTrackableThemeVarsSerializer();
Serializer<GAppTimelineRowNodeFieldsVars>
    _$gAppTimelineRowNodeFieldsVarsSerializer =
    new _$GAppTimelineRowNodeFieldsVarsSerializer();

class _$GTrackerRecommendationsVarsSerializer
    implements StructuredSerializer<GTrackerRecommendationsVars> {
  @override
  final Iterable<Type> types = const [
    GTrackerRecommendationsVars,
    _$GTrackerRecommendationsVars
  ];
  @override
  final String wireName = 'GTrackerRecommendationsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GTrackerRecommendationsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'trackerTheme',
      serializers.serialize(object.trackerTheme,
          specifiedType: const FullType(_i1.GTrackerTheme)),
    ];

    return result;
  }

  @override
  GTrackerRecommendationsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTrackerRecommendationsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'trackerTheme':
          result.trackerTheme = serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GTrackerTheme))
              as _i1.GTrackerTheme;
          break;
      }
    }

    return result.build();
  }
}

class _$GTrackedEntityCountVarsSerializer
    implements StructuredSerializer<GTrackedEntityCountVars> {
  @override
  final Iterable<Type> types = const [
    GTrackedEntityCountVars,
    _$GTrackedEntityCountVars
  ];
  @override
  final String wireName = 'GTrackedEntityCountVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GTrackedEntityCountVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'trackerTheme',
      serializers.serialize(object.trackerTheme,
          specifiedType: const FullType(_i1.GTrackerTheme)),
    ];

    return result;
  }

  @override
  GTrackedEntityCountVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTrackedEntityCountVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'trackerTheme':
          result.trackerTheme = serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GTrackerTheme))
              as _i1.GTrackerTheme;
          break;
      }
    }

    return result.build();
  }
}

class _$GAppTrackerTimelineVarsSerializer
    implements StructuredSerializer<GAppTrackerTimelineVars> {
  @override
  final Iterable<Type> types = const [
    GAppTrackerTimelineVars,
    _$GAppTrackerTimelineVars
  ];
  @override
  final String wireName = 'GAppTrackerTimelineVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAppTrackerTimelineVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'timelineID',
      serializers.serialize(object.timelineID,
          specifiedType: const FullType(String)),
      'trackerTheme',
      serializers.serialize(object.trackerTheme,
          specifiedType: const FullType(_i1.GTrackerTheme)),
    ];
    Object? value;
    value = object.first;
    if (value != null) {
      result
        ..add('first')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.after;
    if (value != null) {
      result
        ..add('after')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.last;
    if (value != null) {
      result
        ..add('last')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.before;
    if (value != null) {
      result
        ..add('before')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.filters;
    if (value != null) {
      result
        ..add('filters')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i1.GFilterInputs)));
    }
    return result;
  }

  @override
  GAppTrackerTimelineVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAppTrackerTimelineVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'timelineID':
          result.timelineID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'first':
          result.first = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'after':
          result.after = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'last':
          result.last = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'before':
          result.before = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'trackerTheme':
          result.trackerTheme = serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GTrackerTheme))
              as _i1.GTrackerTheme;
          break;
        case 'filters':
          result.filters.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GFilterInputs))!
              as _i1.GFilterInputs);
          break;
      }
    }

    return result.build();
  }
}

class _$GAppTrackerTabsVarsSerializer
    implements StructuredSerializer<GAppTrackerTabsVars> {
  @override
  final Iterable<Type> types = const [
    GAppTrackerTabsVars,
    _$GAppTrackerTabsVars
  ];
  @override
  final String wireName = 'GAppTrackerTabsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAppTrackerTabsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'trackerTheme',
      serializers.serialize(object.trackerTheme,
          specifiedType: const FullType(_i1.GTrackerTheme)),
    ];

    return result;
  }

  @override
  GAppTrackerTabsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAppTrackerTabsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'trackerTheme':
          result.trackerTheme = serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GTrackerTheme))
              as _i1.GTrackerTheme;
          break;
      }
    }

    return result.build();
  }
}

class _$GTrackTagsVarsSerializer
    implements StructuredSerializer<GTrackTagsVars> {
  @override
  final Iterable<Type> types = const [GTrackTagsVars, _$GTrackTagsVars];
  @override
  final String wireName = 'GTrackTagsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GTrackTagsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'trackerTheme',
      serializers.serialize(object.trackerTheme,
          specifiedType: const FullType(_i1.GTrackerTheme)),
    ];

    return result;
  }

  @override
  GTrackTagsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTrackTagsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'trackerTheme':
          result.trackerTheme = serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GTrackerTheme))
              as _i1.GTrackerTheme;
          break;
      }
    }

    return result.build();
  }
}

class _$GTrackedEntitiesVarsSerializer
    implements StructuredSerializer<GTrackedEntitiesVars> {
  @override
  final Iterable<Type> types = const [
    GTrackedEntitiesVars,
    _$GTrackedEntitiesVars
  ];
  @override
  final String wireName = 'GTrackedEntitiesVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GTrackedEntitiesVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'trackerTheme',
      serializers.serialize(object.trackerTheme,
          specifiedType: const FullType(_i1.GTrackerTheme)),
    ];
    Object? value;
    value = object.first;
    if (value != null) {
      result
        ..add('first')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.after;
    if (value != null) {
      result
        ..add('after')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GTrackedEntitiesVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTrackedEntitiesVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'trackerTheme':
          result.trackerTheme = serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GTrackerTheme))
              as _i1.GTrackerTheme;
          break;
        case 'first':
          result.first = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'after':
          result.after = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GTrackableThemeVarsSerializer
    implements StructuredSerializer<GTrackableThemeVars> {
  @override
  final Iterable<Type> types = const [
    GTrackableThemeVars,
    _$GTrackableThemeVars
  ];
  @override
  final String wireName = 'GTrackableThemeVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GTrackableThemeVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'entityID',
      serializers.serialize(object.entityID,
          specifiedType: const FullType(String)),
      'entityType',
      serializers.serialize(object.entityType,
          specifiedType: const FullType(_i1.GEntityType)),
    ];

    return result;
  }

  @override
  GTrackableThemeVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTrackableThemeVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'entityID':
          result.entityID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'entityType':
          result.entityType = serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GEntityType))
              as _i1.GEntityType;
          break;
      }
    }

    return result.build();
  }
}

class _$GAppTimelineRowNodeFieldsVarsSerializer
    implements StructuredSerializer<GAppTimelineRowNodeFieldsVars> {
  @override
  final Iterable<Type> types = const [
    GAppTimelineRowNodeFieldsVars,
    _$GAppTimelineRowNodeFieldsVars
  ];
  @override
  final String wireName = 'GAppTimelineRowNodeFieldsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAppTimelineRowNodeFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GAppTimelineRowNodeFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GAppTimelineRowNodeFieldsVarsBuilder().build();
  }
}

class _$GTrackerRecommendationsVars extends GTrackerRecommendationsVars {
  @override
  final _i1.GTrackerTheme trackerTheme;

  factory _$GTrackerRecommendationsVars(
          [void Function(GTrackerRecommendationsVarsBuilder)? updates]) =>
      (new GTrackerRecommendationsVarsBuilder()..update(updates)).build();

  _$GTrackerRecommendationsVars._({required this.trackerTheme}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        trackerTheme, 'GTrackerRecommendationsVars', 'trackerTheme');
  }

  @override
  GTrackerRecommendationsVars rebuild(
          void Function(GTrackerRecommendationsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTrackerRecommendationsVarsBuilder toBuilder() =>
      new GTrackerRecommendationsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTrackerRecommendationsVars &&
        trackerTheme == other.trackerTheme;
  }

  @override
  int get hashCode {
    return $jf($jc(0, trackerTheme.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GTrackerRecommendationsVars')
          ..add('trackerTheme', trackerTheme))
        .toString();
  }
}

class GTrackerRecommendationsVarsBuilder
    implements
        Builder<GTrackerRecommendationsVars,
            GTrackerRecommendationsVarsBuilder> {
  _$GTrackerRecommendationsVars? _$v;

  _i1.GTrackerTheme? _trackerTheme;
  _i1.GTrackerTheme? get trackerTheme => _$this._trackerTheme;
  set trackerTheme(_i1.GTrackerTheme? trackerTheme) =>
      _$this._trackerTheme = trackerTheme;

  GTrackerRecommendationsVarsBuilder();

  GTrackerRecommendationsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _trackerTheme = $v.trackerTheme;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTrackerRecommendationsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTrackerRecommendationsVars;
  }

  @override
  void update(void Function(GTrackerRecommendationsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GTrackerRecommendationsVars build() {
    final _$result = _$v ??
        new _$GTrackerRecommendationsVars._(
            trackerTheme: BuiltValueNullFieldError.checkNotNull(
                trackerTheme, 'GTrackerRecommendationsVars', 'trackerTheme'));
    replace(_$result);
    return _$result;
  }
}

class _$GTrackedEntityCountVars extends GTrackedEntityCountVars {
  @override
  final _i1.GTrackerTheme trackerTheme;

  factory _$GTrackedEntityCountVars(
          [void Function(GTrackedEntityCountVarsBuilder)? updates]) =>
      (new GTrackedEntityCountVarsBuilder()..update(updates)).build();

  _$GTrackedEntityCountVars._({required this.trackerTheme}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        trackerTheme, 'GTrackedEntityCountVars', 'trackerTheme');
  }

  @override
  GTrackedEntityCountVars rebuild(
          void Function(GTrackedEntityCountVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTrackedEntityCountVarsBuilder toBuilder() =>
      new GTrackedEntityCountVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTrackedEntityCountVars &&
        trackerTheme == other.trackerTheme;
  }

  @override
  int get hashCode {
    return $jf($jc(0, trackerTheme.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GTrackedEntityCountVars')
          ..add('trackerTheme', trackerTheme))
        .toString();
  }
}

class GTrackedEntityCountVarsBuilder
    implements
        Builder<GTrackedEntityCountVars, GTrackedEntityCountVarsBuilder> {
  _$GTrackedEntityCountVars? _$v;

  _i1.GTrackerTheme? _trackerTheme;
  _i1.GTrackerTheme? get trackerTheme => _$this._trackerTheme;
  set trackerTheme(_i1.GTrackerTheme? trackerTheme) =>
      _$this._trackerTheme = trackerTheme;

  GTrackedEntityCountVarsBuilder();

  GTrackedEntityCountVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _trackerTheme = $v.trackerTheme;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTrackedEntityCountVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTrackedEntityCountVars;
  }

  @override
  void update(void Function(GTrackedEntityCountVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GTrackedEntityCountVars build() {
    final _$result = _$v ??
        new _$GTrackedEntityCountVars._(
            trackerTheme: BuiltValueNullFieldError.checkNotNull(
                trackerTheme, 'GTrackedEntityCountVars', 'trackerTheme'));
    replace(_$result);
    return _$result;
  }
}

class _$GAppTrackerTimelineVars extends GAppTrackerTimelineVars {
  @override
  final String timelineID;
  @override
  final int? first;
  @override
  final String? after;
  @override
  final int? last;
  @override
  final String? before;
  @override
  final _i1.GTrackerTheme trackerTheme;
  @override
  final _i1.GFilterInputs? filters;

  factory _$GAppTrackerTimelineVars(
          [void Function(GAppTrackerTimelineVarsBuilder)? updates]) =>
      (new GAppTrackerTimelineVarsBuilder()..update(updates)).build();

  _$GAppTrackerTimelineVars._(
      {required this.timelineID,
      this.first,
      this.after,
      this.last,
      this.before,
      required this.trackerTheme,
      this.filters})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        timelineID, 'GAppTrackerTimelineVars', 'timelineID');
    BuiltValueNullFieldError.checkNotNull(
        trackerTheme, 'GAppTrackerTimelineVars', 'trackerTheme');
  }

  @override
  GAppTrackerTimelineVars rebuild(
          void Function(GAppTrackerTimelineVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAppTrackerTimelineVarsBuilder toBuilder() =>
      new GAppTrackerTimelineVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAppTrackerTimelineVars &&
        timelineID == other.timelineID &&
        first == other.first &&
        after == other.after &&
        last == other.last &&
        before == other.before &&
        trackerTheme == other.trackerTheme &&
        filters == other.filters;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, timelineID.hashCode), first.hashCode),
                        after.hashCode),
                    last.hashCode),
                before.hashCode),
            trackerTheme.hashCode),
        filters.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GAppTrackerTimelineVars')
          ..add('timelineID', timelineID)
          ..add('first', first)
          ..add('after', after)
          ..add('last', last)
          ..add('before', before)
          ..add('trackerTheme', trackerTheme)
          ..add('filters', filters))
        .toString();
  }
}

class GAppTrackerTimelineVarsBuilder
    implements
        Builder<GAppTrackerTimelineVars, GAppTrackerTimelineVarsBuilder> {
  _$GAppTrackerTimelineVars? _$v;

  String? _timelineID;
  String? get timelineID => _$this._timelineID;
  set timelineID(String? timelineID) => _$this._timelineID = timelineID;

  int? _first;
  int? get first => _$this._first;
  set first(int? first) => _$this._first = first;

  String? _after;
  String? get after => _$this._after;
  set after(String? after) => _$this._after = after;

  int? _last;
  int? get last => _$this._last;
  set last(int? last) => _$this._last = last;

  String? _before;
  String? get before => _$this._before;
  set before(String? before) => _$this._before = before;

  _i1.GTrackerTheme? _trackerTheme;
  _i1.GTrackerTheme? get trackerTheme => _$this._trackerTheme;
  set trackerTheme(_i1.GTrackerTheme? trackerTheme) =>
      _$this._trackerTheme = trackerTheme;

  _i1.GFilterInputsBuilder? _filters;
  _i1.GFilterInputsBuilder get filters =>
      _$this._filters ??= new _i1.GFilterInputsBuilder();
  set filters(_i1.GFilterInputsBuilder? filters) => _$this._filters = filters;

  GAppTrackerTimelineVarsBuilder();

  GAppTrackerTimelineVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _timelineID = $v.timelineID;
      _first = $v.first;
      _after = $v.after;
      _last = $v.last;
      _before = $v.before;
      _trackerTheme = $v.trackerTheme;
      _filters = $v.filters?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAppTrackerTimelineVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAppTrackerTimelineVars;
  }

  @override
  void update(void Function(GAppTrackerTimelineVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAppTrackerTimelineVars build() {
    _$GAppTrackerTimelineVars _$result;
    try {
      _$result = _$v ??
          new _$GAppTrackerTimelineVars._(
              timelineID: BuiltValueNullFieldError.checkNotNull(
                  timelineID, 'GAppTrackerTimelineVars', 'timelineID'),
              first: first,
              after: after,
              last: last,
              before: before,
              trackerTheme: BuiltValueNullFieldError.checkNotNull(
                  trackerTheme, 'GAppTrackerTimelineVars', 'trackerTheme'),
              filters: _filters?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'filters';
        _filters?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GAppTrackerTimelineVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAppTrackerTabsVars extends GAppTrackerTabsVars {
  @override
  final _i1.GTrackerTheme trackerTheme;

  factory _$GAppTrackerTabsVars(
          [void Function(GAppTrackerTabsVarsBuilder)? updates]) =>
      (new GAppTrackerTabsVarsBuilder()..update(updates)).build();

  _$GAppTrackerTabsVars._({required this.trackerTheme}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        trackerTheme, 'GAppTrackerTabsVars', 'trackerTheme');
  }

  @override
  GAppTrackerTabsVars rebuild(
          void Function(GAppTrackerTabsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAppTrackerTabsVarsBuilder toBuilder() =>
      new GAppTrackerTabsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAppTrackerTabsVars && trackerTheme == other.trackerTheme;
  }

  @override
  int get hashCode {
    return $jf($jc(0, trackerTheme.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GAppTrackerTabsVars')
          ..add('trackerTheme', trackerTheme))
        .toString();
  }
}

class GAppTrackerTabsVarsBuilder
    implements Builder<GAppTrackerTabsVars, GAppTrackerTabsVarsBuilder> {
  _$GAppTrackerTabsVars? _$v;

  _i1.GTrackerTheme? _trackerTheme;
  _i1.GTrackerTheme? get trackerTheme => _$this._trackerTheme;
  set trackerTheme(_i1.GTrackerTheme? trackerTheme) =>
      _$this._trackerTheme = trackerTheme;

  GAppTrackerTabsVarsBuilder();

  GAppTrackerTabsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _trackerTheme = $v.trackerTheme;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAppTrackerTabsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAppTrackerTabsVars;
  }

  @override
  void update(void Function(GAppTrackerTabsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAppTrackerTabsVars build() {
    final _$result = _$v ??
        new _$GAppTrackerTabsVars._(
            trackerTheme: BuiltValueNullFieldError.checkNotNull(
                trackerTheme, 'GAppTrackerTabsVars', 'trackerTheme'));
    replace(_$result);
    return _$result;
  }
}

class _$GTrackTagsVars extends GTrackTagsVars {
  @override
  final _i1.GTrackerTheme trackerTheme;

  factory _$GTrackTagsVars([void Function(GTrackTagsVarsBuilder)? updates]) =>
      (new GTrackTagsVarsBuilder()..update(updates)).build();

  _$GTrackTagsVars._({required this.trackerTheme}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        trackerTheme, 'GTrackTagsVars', 'trackerTheme');
  }

  @override
  GTrackTagsVars rebuild(void Function(GTrackTagsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTrackTagsVarsBuilder toBuilder() =>
      new GTrackTagsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTrackTagsVars && trackerTheme == other.trackerTheme;
  }

  @override
  int get hashCode {
    return $jf($jc(0, trackerTheme.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GTrackTagsVars')
          ..add('trackerTheme', trackerTheme))
        .toString();
  }
}

class GTrackTagsVarsBuilder
    implements Builder<GTrackTagsVars, GTrackTagsVarsBuilder> {
  _$GTrackTagsVars? _$v;

  _i1.GTrackerTheme? _trackerTheme;
  _i1.GTrackerTheme? get trackerTheme => _$this._trackerTheme;
  set trackerTheme(_i1.GTrackerTheme? trackerTheme) =>
      _$this._trackerTheme = trackerTheme;

  GTrackTagsVarsBuilder();

  GTrackTagsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _trackerTheme = $v.trackerTheme;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTrackTagsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTrackTagsVars;
  }

  @override
  void update(void Function(GTrackTagsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GTrackTagsVars build() {
    final _$result = _$v ??
        new _$GTrackTagsVars._(
            trackerTheme: BuiltValueNullFieldError.checkNotNull(
                trackerTheme, 'GTrackTagsVars', 'trackerTheme'));
    replace(_$result);
    return _$result;
  }
}

class _$GTrackedEntitiesVars extends GTrackedEntitiesVars {
  @override
  final _i1.GTrackerTheme trackerTheme;
  @override
  final int? first;
  @override
  final String? after;

  factory _$GTrackedEntitiesVars(
          [void Function(GTrackedEntitiesVarsBuilder)? updates]) =>
      (new GTrackedEntitiesVarsBuilder()..update(updates)).build();

  _$GTrackedEntitiesVars._({required this.trackerTheme, this.first, this.after})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        trackerTheme, 'GTrackedEntitiesVars', 'trackerTheme');
  }

  @override
  GTrackedEntitiesVars rebuild(
          void Function(GTrackedEntitiesVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTrackedEntitiesVarsBuilder toBuilder() =>
      new GTrackedEntitiesVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTrackedEntitiesVars &&
        trackerTheme == other.trackerTheme &&
        first == other.first &&
        after == other.after;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, trackerTheme.hashCode), first.hashCode), after.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GTrackedEntitiesVars')
          ..add('trackerTheme', trackerTheme)
          ..add('first', first)
          ..add('after', after))
        .toString();
  }
}

class GTrackedEntitiesVarsBuilder
    implements Builder<GTrackedEntitiesVars, GTrackedEntitiesVarsBuilder> {
  _$GTrackedEntitiesVars? _$v;

  _i1.GTrackerTheme? _trackerTheme;
  _i1.GTrackerTheme? get trackerTheme => _$this._trackerTheme;
  set trackerTheme(_i1.GTrackerTheme? trackerTheme) =>
      _$this._trackerTheme = trackerTheme;

  int? _first;
  int? get first => _$this._first;
  set first(int? first) => _$this._first = first;

  String? _after;
  String? get after => _$this._after;
  set after(String? after) => _$this._after = after;

  GTrackedEntitiesVarsBuilder();

  GTrackedEntitiesVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _trackerTheme = $v.trackerTheme;
      _first = $v.first;
      _after = $v.after;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTrackedEntitiesVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTrackedEntitiesVars;
  }

  @override
  void update(void Function(GTrackedEntitiesVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GTrackedEntitiesVars build() {
    final _$result = _$v ??
        new _$GTrackedEntitiesVars._(
            trackerTheme: BuiltValueNullFieldError.checkNotNull(
                trackerTheme, 'GTrackedEntitiesVars', 'trackerTheme'),
            first: first,
            after: after);
    replace(_$result);
    return _$result;
  }
}

class _$GTrackableThemeVars extends GTrackableThemeVars {
  @override
  final String entityID;
  @override
  final _i1.GEntityType entityType;

  factory _$GTrackableThemeVars(
          [void Function(GTrackableThemeVarsBuilder)? updates]) =>
      (new GTrackableThemeVarsBuilder()..update(updates)).build();

  _$GTrackableThemeVars._({required this.entityID, required this.entityType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        entityID, 'GTrackableThemeVars', 'entityID');
    BuiltValueNullFieldError.checkNotNull(
        entityType, 'GTrackableThemeVars', 'entityType');
  }

  @override
  GTrackableThemeVars rebuild(
          void Function(GTrackableThemeVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTrackableThemeVarsBuilder toBuilder() =>
      new GTrackableThemeVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTrackableThemeVars &&
        entityID == other.entityID &&
        entityType == other.entityType;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, entityID.hashCode), entityType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GTrackableThemeVars')
          ..add('entityID', entityID)
          ..add('entityType', entityType))
        .toString();
  }
}

class GTrackableThemeVarsBuilder
    implements Builder<GTrackableThemeVars, GTrackableThemeVarsBuilder> {
  _$GTrackableThemeVars? _$v;

  String? _entityID;
  String? get entityID => _$this._entityID;
  set entityID(String? entityID) => _$this._entityID = entityID;

  _i1.GEntityType? _entityType;
  _i1.GEntityType? get entityType => _$this._entityType;
  set entityType(_i1.GEntityType? entityType) =>
      _$this._entityType = entityType;

  GTrackableThemeVarsBuilder();

  GTrackableThemeVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _entityID = $v.entityID;
      _entityType = $v.entityType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTrackableThemeVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTrackableThemeVars;
  }

  @override
  void update(void Function(GTrackableThemeVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GTrackableThemeVars build() {
    final _$result = _$v ??
        new _$GTrackableThemeVars._(
            entityID: BuiltValueNullFieldError.checkNotNull(
                entityID, 'GTrackableThemeVars', 'entityID'),
            entityType: BuiltValueNullFieldError.checkNotNull(
                entityType, 'GTrackableThemeVars', 'entityType'));
    replace(_$result);
    return _$result;
  }
}

class _$GAppTimelineRowNodeFieldsVars extends GAppTimelineRowNodeFieldsVars {
  factory _$GAppTimelineRowNodeFieldsVars(
          [void Function(GAppTimelineRowNodeFieldsVarsBuilder)? updates]) =>
      (new GAppTimelineRowNodeFieldsVarsBuilder()..update(updates)).build();

  _$GAppTimelineRowNodeFieldsVars._() : super._();

  @override
  GAppTimelineRowNodeFieldsVars rebuild(
          void Function(GAppTimelineRowNodeFieldsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAppTimelineRowNodeFieldsVarsBuilder toBuilder() =>
      new GAppTimelineRowNodeFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAppTimelineRowNodeFieldsVars;
  }

  @override
  int get hashCode {
    return 246261508;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GAppTimelineRowNodeFieldsVars')
        .toString();
  }
}

class GAppTimelineRowNodeFieldsVarsBuilder
    implements
        Builder<GAppTimelineRowNodeFieldsVars,
            GAppTimelineRowNodeFieldsVarsBuilder> {
  _$GAppTimelineRowNodeFieldsVars? _$v;

  GAppTimelineRowNodeFieldsVarsBuilder();

  @override
  void replace(GAppTimelineRowNodeFieldsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAppTimelineRowNodeFieldsVars;
  }

  @override
  void update(void Function(GAppTimelineRowNodeFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAppTimelineRowNodeFieldsVars build() {
    final _$result = _$v ?? new _$GAppTimelineRowNodeFieldsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
