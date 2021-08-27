// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_info.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPageInfoFieldsData> _$gPageInfoFieldsDataSerializer =
    new _$GPageInfoFieldsDataSerializer();

class _$GPageInfoFieldsDataSerializer
    implements StructuredSerializer<GPageInfoFieldsData> {
  @override
  final Iterable<Type> types = const [
    GPageInfoFieldsData,
    _$GPageInfoFieldsData
  ];
  @override
  final String wireName = 'GPageInfoFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPageInfoFieldsData object,
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
  GPageInfoFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPageInfoFieldsDataBuilder();

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

class _$GPageInfoFieldsData extends GPageInfoFieldsData {
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

  factory _$GPageInfoFieldsData(
          [void Function(GPageInfoFieldsDataBuilder)? updates]) =>
      (new GPageInfoFieldsDataBuilder()..update(updates)).build();

  _$GPageInfoFieldsData._(
      {required this.G__typename,
      required this.hasPreviousPage,
      required this.hasNextPage,
      this.startCursor,
      this.endCursor})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GPageInfoFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        hasPreviousPage, 'GPageInfoFieldsData', 'hasPreviousPage');
    BuiltValueNullFieldError.checkNotNull(
        hasNextPage, 'GPageInfoFieldsData', 'hasNextPage');
  }

  @override
  GPageInfoFieldsData rebuild(
          void Function(GPageInfoFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPageInfoFieldsDataBuilder toBuilder() =>
      new GPageInfoFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPageInfoFieldsData &&
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
    return (newBuiltValueToStringHelper('GPageInfoFieldsData')
          ..add('G__typename', G__typename)
          ..add('hasPreviousPage', hasPreviousPage)
          ..add('hasNextPage', hasNextPage)
          ..add('startCursor', startCursor)
          ..add('endCursor', endCursor))
        .toString();
  }
}

class GPageInfoFieldsDataBuilder
    implements Builder<GPageInfoFieldsData, GPageInfoFieldsDataBuilder> {
  _$GPageInfoFieldsData? _$v;

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

  GPageInfoFieldsDataBuilder() {
    GPageInfoFieldsData._initializeBuilder(this);
  }

  GPageInfoFieldsDataBuilder get _$this {
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
  void replace(GPageInfoFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPageInfoFieldsData;
  }

  @override
  void update(void Function(GPageInfoFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GPageInfoFieldsData build() {
    final _$result = _$v ??
        new _$GPageInfoFieldsData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GPageInfoFieldsData', 'G__typename'),
            hasPreviousPage: BuiltValueNullFieldError.checkNotNull(
                hasPreviousPage, 'GPageInfoFieldsData', 'hasPreviousPage'),
            hasNextPage: BuiltValueNullFieldError.checkNotNull(
                hasNextPage, 'GPageInfoFieldsData', 'hasNextPage'),
            startCursor: startCursor,
            endCursor: endCursor);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
