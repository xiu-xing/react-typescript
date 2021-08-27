// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGiveFeedbackData> _$gGiveFeedbackDataSerializer =
    new _$GGiveFeedbackDataSerializer();

class _$GGiveFeedbackDataSerializer
    implements StructuredSerializer<GGiveFeedbackData> {
  @override
  final Iterable<Type> types = const [GGiveFeedbackData, _$GGiveFeedbackData];
  @override
  final String wireName = 'GGiveFeedbackData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGiveFeedbackData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'giveFeedback',
      serializers.serialize(object.giveFeedback,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GGiveFeedbackData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGiveFeedbackDataBuilder();

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
        case 'giveFeedback':
          result.giveFeedback = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GGiveFeedbackData extends GGiveFeedbackData {
  @override
  final String G__typename;
  @override
  final bool giveFeedback;

  factory _$GGiveFeedbackData(
          [void Function(GGiveFeedbackDataBuilder)? updates]) =>
      (new GGiveFeedbackDataBuilder()..update(updates)).build();

  _$GGiveFeedbackData._({required this.G__typename, required this.giveFeedback})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GGiveFeedbackData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        giveFeedback, 'GGiveFeedbackData', 'giveFeedback');
  }

  @override
  GGiveFeedbackData rebuild(void Function(GGiveFeedbackDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGiveFeedbackDataBuilder toBuilder() =>
      new GGiveFeedbackDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGiveFeedbackData &&
        G__typename == other.G__typename &&
        giveFeedback == other.giveFeedback;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), giveFeedback.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GGiveFeedbackData')
          ..add('G__typename', G__typename)
          ..add('giveFeedback', giveFeedback))
        .toString();
  }
}

class GGiveFeedbackDataBuilder
    implements Builder<GGiveFeedbackData, GGiveFeedbackDataBuilder> {
  _$GGiveFeedbackData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _giveFeedback;
  bool? get giveFeedback => _$this._giveFeedback;
  set giveFeedback(bool? giveFeedback) => _$this._giveFeedback = giveFeedback;

  GGiveFeedbackDataBuilder() {
    GGiveFeedbackData._initializeBuilder(this);
  }

  GGiveFeedbackDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _giveFeedback = $v.giveFeedback;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGiveFeedbackData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGiveFeedbackData;
  }

  @override
  void update(void Function(GGiveFeedbackDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GGiveFeedbackData build() {
    final _$result = _$v ??
        new _$GGiveFeedbackData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GGiveFeedbackData', 'G__typename'),
            giveFeedback: BuiltValueNullFieldError.checkNotNull(
                giveFeedback, 'GGiveFeedbackData', 'giveFeedback'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
