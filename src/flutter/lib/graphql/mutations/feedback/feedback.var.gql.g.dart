// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGiveFeedbackVars> _$gGiveFeedbackVarsSerializer =
    new _$GGiveFeedbackVarsSerializer();

class _$GGiveFeedbackVarsSerializer
    implements StructuredSerializer<GGiveFeedbackVars> {
  @override
  final Iterable<Type> types = const [GGiveFeedbackVars, _$GGiveFeedbackVars];
  @override
  final String wireName = 'GGiveFeedbackVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGiveFeedbackVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'problemDescription',
      serializers.serialize(object.problemDescription,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phoneNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.images;
    if (value != null) {
      result
        ..add('images')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  GGiveFeedbackVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGiveFeedbackVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'problemDescription':
          result.problemDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phoneNumber':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGiveFeedbackVars extends GGiveFeedbackVars {
  @override
  final String problemDescription;
  @override
  final String? phoneNumber;
  @override
  final BuiltList<String>? images;

  factory _$GGiveFeedbackVars(
          [void Function(GGiveFeedbackVarsBuilder)? updates]) =>
      (new GGiveFeedbackVarsBuilder()..update(updates)).build();

  _$GGiveFeedbackVars._(
      {required this.problemDescription, this.phoneNumber, this.images})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        problemDescription, 'GGiveFeedbackVars', 'problemDescription');
  }

  @override
  GGiveFeedbackVars rebuild(void Function(GGiveFeedbackVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGiveFeedbackVarsBuilder toBuilder() =>
      new GGiveFeedbackVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGiveFeedbackVars &&
        problemDescription == other.problemDescription &&
        phoneNumber == other.phoneNumber &&
        images == other.images;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, problemDescription.hashCode), phoneNumber.hashCode),
        images.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GGiveFeedbackVars')
          ..add('problemDescription', problemDescription)
          ..add('phoneNumber', phoneNumber)
          ..add('images', images))
        .toString();
  }
}

class GGiveFeedbackVarsBuilder
    implements Builder<GGiveFeedbackVars, GGiveFeedbackVarsBuilder> {
  _$GGiveFeedbackVars? _$v;

  String? _problemDescription;
  String? get problemDescription => _$this._problemDescription;
  set problemDescription(String? problemDescription) =>
      _$this._problemDescription = problemDescription;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  ListBuilder<String>? _images;
  ListBuilder<String> get images =>
      _$this._images ??= new ListBuilder<String>();
  set images(ListBuilder<String>? images) => _$this._images = images;

  GGiveFeedbackVarsBuilder();

  GGiveFeedbackVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _problemDescription = $v.problemDescription;
      _phoneNumber = $v.phoneNumber;
      _images = $v.images?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGiveFeedbackVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGiveFeedbackVars;
  }

  @override
  void update(void Function(GGiveFeedbackVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GGiveFeedbackVars build() {
    _$GGiveFeedbackVars _$result;
    try {
      _$result = _$v ??
          new _$GGiveFeedbackVars._(
              problemDescription: BuiltValueNullFieldError.checkNotNull(
                  problemDescription,
                  'GGiveFeedbackVars',
                  'problemDescription'),
              phoneNumber: phoneNumber,
              images: _images?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'images';
        _images?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GGiveFeedbackVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
