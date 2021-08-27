// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_card.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateBusinessCardApprovalTicketVars>
    _$gCreateBusinessCardApprovalTicketVarsSerializer =
    new _$GCreateBusinessCardApprovalTicketVarsSerializer();
Serializer<GCreateVerificationCodeVars>
    _$gCreateVerificationCodeVarsSerializer =
    new _$GCreateVerificationCodeVarsSerializer();
Serializer<GVerifyCodeAndApproveJoinRequestVars>
    _$gVerifyCodeAndApproveJoinRequestVarsSerializer =
    new _$GVerifyCodeAndApproveJoinRequestVarsSerializer();
Serializer<GCreateVerificationCodeByJoinRequestVars>
    _$gCreateVerificationCodeByJoinRequestVarsSerializer =
    new _$GCreateVerificationCodeByJoinRequestVarsSerializer();

class _$GCreateBusinessCardApprovalTicketVarsSerializer
    implements StructuredSerializer<GCreateBusinessCardApprovalTicketVars> {
  @override
  final Iterable<Type> types = const [
    GCreateBusinessCardApprovalTicketVars,
    _$GCreateBusinessCardApprovalTicketVars
  ];
  @override
  final String wireName = 'GCreateBusinessCardApprovalTicketVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateBusinessCardApprovalTicketVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'businessCardUrl',
      serializers.serialize(object.businessCardUrl,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GCreateBusinessCardApprovalTicketVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateBusinessCardApprovalTicketVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'businessCardUrl':
          result.businessCardUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateVerificationCodeVarsSerializer
    implements StructuredSerializer<GCreateVerificationCodeVars> {
  @override
  final Iterable<Type> types = const [
    GCreateVerificationCodeVars,
    _$GCreateVerificationCodeVars
  ];
  @override
  final String wireName = 'GCreateVerificationCodeVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateVerificationCodeVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'contactInfo',
      serializers.serialize(object.contactInfo,
          specifiedType: const FullType(String)),
      'contactType',
      serializers.serialize(object.contactType,
          specifiedType: const FullType(_i2.GContactType)),
    ];

    return result;
  }

  @override
  GCreateVerificationCodeVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateVerificationCodeVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'contactInfo':
          result.contactInfo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'contactType':
          result.contactType = serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GContactType))
              as _i2.GContactType;
          break;
      }
    }

    return result.build();
  }
}

class _$GVerifyCodeAndApproveJoinRequestVarsSerializer
    implements StructuredSerializer<GVerifyCodeAndApproveJoinRequestVars> {
  @override
  final Iterable<Type> types = const [
    GVerifyCodeAndApproveJoinRequestVars,
    _$GVerifyCodeAndApproveJoinRequestVars
  ];
  @override
  final String wireName = 'GVerifyCodeAndApproveJoinRequestVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GVerifyCodeAndApproveJoinRequestVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i2.GVerifyCodeInput)),
    ];

    return result;
  }

  @override
  GVerifyCodeAndApproveJoinRequestVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GVerifyCodeAndApproveJoinRequestVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GVerifyCodeInput))!
              as _i2.GVerifyCodeInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateVerificationCodeByJoinRequestVarsSerializer
    implements StructuredSerializer<GCreateVerificationCodeByJoinRequestVars> {
  @override
  final Iterable<Type> types = const [
    GCreateVerificationCodeByJoinRequestVars,
    _$GCreateVerificationCodeByJoinRequestVars
  ];
  @override
  final String wireName = 'GCreateVerificationCodeByJoinRequestVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateVerificationCodeByJoinRequestVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'contactType',
      serializers.serialize(object.contactType,
          specifiedType: const FullType(_i2.GContactType)),
    ];

    return result;
  }

  @override
  GCreateVerificationCodeByJoinRequestVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateVerificationCodeByJoinRequestVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'contactType':
          result.contactType = serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GContactType))
              as _i2.GContactType;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateBusinessCardApprovalTicketVars
    extends GCreateBusinessCardApprovalTicketVars {
  @override
  final String businessCardUrl;

  factory _$GCreateBusinessCardApprovalTicketVars(
          [void Function(GCreateBusinessCardApprovalTicketVarsBuilder)?
              updates]) =>
      (new GCreateBusinessCardApprovalTicketVarsBuilder()..update(updates))
          .build();

  _$GCreateBusinessCardApprovalTicketVars._({required this.businessCardUrl})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(businessCardUrl,
        'GCreateBusinessCardApprovalTicketVars', 'businessCardUrl');
  }

  @override
  GCreateBusinessCardApprovalTicketVars rebuild(
          void Function(GCreateBusinessCardApprovalTicketVarsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateBusinessCardApprovalTicketVarsBuilder toBuilder() =>
      new GCreateBusinessCardApprovalTicketVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateBusinessCardApprovalTicketVars &&
        businessCardUrl == other.businessCardUrl;
  }

  @override
  int get hashCode {
    return $jf($jc(0, businessCardUrl.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GCreateBusinessCardApprovalTicketVars')
          ..add('businessCardUrl', businessCardUrl))
        .toString();
  }
}

class GCreateBusinessCardApprovalTicketVarsBuilder
    implements
        Builder<GCreateBusinessCardApprovalTicketVars,
            GCreateBusinessCardApprovalTicketVarsBuilder> {
  _$GCreateBusinessCardApprovalTicketVars? _$v;

  String? _businessCardUrl;
  String? get businessCardUrl => _$this._businessCardUrl;
  set businessCardUrl(String? businessCardUrl) =>
      _$this._businessCardUrl = businessCardUrl;

  GCreateBusinessCardApprovalTicketVarsBuilder();

  GCreateBusinessCardApprovalTicketVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _businessCardUrl = $v.businessCardUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateBusinessCardApprovalTicketVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateBusinessCardApprovalTicketVars;
  }

  @override
  void update(
      void Function(GCreateBusinessCardApprovalTicketVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCreateBusinessCardApprovalTicketVars build() {
    final _$result = _$v ??
        new _$GCreateBusinessCardApprovalTicketVars._(
            businessCardUrl: BuiltValueNullFieldError.checkNotNull(
                businessCardUrl,
                'GCreateBusinessCardApprovalTicketVars',
                'businessCardUrl'));
    replace(_$result);
    return _$result;
  }
}

class _$GCreateVerificationCodeVars extends GCreateVerificationCodeVars {
  @override
  final String contactInfo;
  @override
  final _i2.GContactType contactType;

  factory _$GCreateVerificationCodeVars(
          [void Function(GCreateVerificationCodeVarsBuilder)? updates]) =>
      (new GCreateVerificationCodeVarsBuilder()..update(updates)).build();

  _$GCreateVerificationCodeVars._(
      {required this.contactInfo, required this.contactType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        contactInfo, 'GCreateVerificationCodeVars', 'contactInfo');
    BuiltValueNullFieldError.checkNotNull(
        contactType, 'GCreateVerificationCodeVars', 'contactType');
  }

  @override
  GCreateVerificationCodeVars rebuild(
          void Function(GCreateVerificationCodeVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateVerificationCodeVarsBuilder toBuilder() =>
      new GCreateVerificationCodeVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateVerificationCodeVars &&
        contactInfo == other.contactInfo &&
        contactType == other.contactType;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, contactInfo.hashCode), contactType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GCreateVerificationCodeVars')
          ..add('contactInfo', contactInfo)
          ..add('contactType', contactType))
        .toString();
  }
}

class GCreateVerificationCodeVarsBuilder
    implements
        Builder<GCreateVerificationCodeVars,
            GCreateVerificationCodeVarsBuilder> {
  _$GCreateVerificationCodeVars? _$v;

  String? _contactInfo;
  String? get contactInfo => _$this._contactInfo;
  set contactInfo(String? contactInfo) => _$this._contactInfo = contactInfo;

  _i2.GContactType? _contactType;
  _i2.GContactType? get contactType => _$this._contactType;
  set contactType(_i2.GContactType? contactType) =>
      _$this._contactType = contactType;

  GCreateVerificationCodeVarsBuilder();

  GCreateVerificationCodeVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _contactInfo = $v.contactInfo;
      _contactType = $v.contactType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateVerificationCodeVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateVerificationCodeVars;
  }

  @override
  void update(void Function(GCreateVerificationCodeVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCreateVerificationCodeVars build() {
    final _$result = _$v ??
        new _$GCreateVerificationCodeVars._(
            contactInfo: BuiltValueNullFieldError.checkNotNull(
                contactInfo, 'GCreateVerificationCodeVars', 'contactInfo'),
            contactType: BuiltValueNullFieldError.checkNotNull(
                contactType, 'GCreateVerificationCodeVars', 'contactType'));
    replace(_$result);
    return _$result;
  }
}

class _$GVerifyCodeAndApproveJoinRequestVars
    extends GVerifyCodeAndApproveJoinRequestVars {
  @override
  final _i2.GVerifyCodeInput input;

  factory _$GVerifyCodeAndApproveJoinRequestVars(
          [void Function(GVerifyCodeAndApproveJoinRequestVarsBuilder)?
              updates]) =>
      (new GVerifyCodeAndApproveJoinRequestVarsBuilder()..update(updates))
          .build();

  _$GVerifyCodeAndApproveJoinRequestVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        input, 'GVerifyCodeAndApproveJoinRequestVars', 'input');
  }

  @override
  GVerifyCodeAndApproveJoinRequestVars rebuild(
          void Function(GVerifyCodeAndApproveJoinRequestVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GVerifyCodeAndApproveJoinRequestVarsBuilder toBuilder() =>
      new GVerifyCodeAndApproveJoinRequestVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GVerifyCodeAndApproveJoinRequestVars &&
        input == other.input;
  }

  @override
  int get hashCode {
    return $jf($jc(0, input.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GVerifyCodeAndApproveJoinRequestVars')
          ..add('input', input))
        .toString();
  }
}

class GVerifyCodeAndApproveJoinRequestVarsBuilder
    implements
        Builder<GVerifyCodeAndApproveJoinRequestVars,
            GVerifyCodeAndApproveJoinRequestVarsBuilder> {
  _$GVerifyCodeAndApproveJoinRequestVars? _$v;

  _i2.GVerifyCodeInputBuilder? _input;
  _i2.GVerifyCodeInputBuilder get input =>
      _$this._input ??= new _i2.GVerifyCodeInputBuilder();
  set input(_i2.GVerifyCodeInputBuilder? input) => _$this._input = input;

  GVerifyCodeAndApproveJoinRequestVarsBuilder();

  GVerifyCodeAndApproveJoinRequestVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GVerifyCodeAndApproveJoinRequestVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GVerifyCodeAndApproveJoinRequestVars;
  }

  @override
  void update(
      void Function(GVerifyCodeAndApproveJoinRequestVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GVerifyCodeAndApproveJoinRequestVars build() {
    _$GVerifyCodeAndApproveJoinRequestVars _$result;
    try {
      _$result = _$v ??
          new _$GVerifyCodeAndApproveJoinRequestVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GVerifyCodeAndApproveJoinRequestVars',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateVerificationCodeByJoinRequestVars
    extends GCreateVerificationCodeByJoinRequestVars {
  @override
  final _i2.GContactType contactType;

  factory _$GCreateVerificationCodeByJoinRequestVars(
          [void Function(GCreateVerificationCodeByJoinRequestVarsBuilder)?
              updates]) =>
      (new GCreateVerificationCodeByJoinRequestVarsBuilder()..update(updates))
          .build();

  _$GCreateVerificationCodeByJoinRequestVars._({required this.contactType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        contactType, 'GCreateVerificationCodeByJoinRequestVars', 'contactType');
  }

  @override
  GCreateVerificationCodeByJoinRequestVars rebuild(
          void Function(GCreateVerificationCodeByJoinRequestVarsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateVerificationCodeByJoinRequestVarsBuilder toBuilder() =>
      new GCreateVerificationCodeByJoinRequestVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateVerificationCodeByJoinRequestVars &&
        contactType == other.contactType;
  }

  @override
  int get hashCode {
    return $jf($jc(0, contactType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GCreateVerificationCodeByJoinRequestVars')
          ..add('contactType', contactType))
        .toString();
  }
}

class GCreateVerificationCodeByJoinRequestVarsBuilder
    implements
        Builder<GCreateVerificationCodeByJoinRequestVars,
            GCreateVerificationCodeByJoinRequestVarsBuilder> {
  _$GCreateVerificationCodeByJoinRequestVars? _$v;

  _i2.GContactType? _contactType;
  _i2.GContactType? get contactType => _$this._contactType;
  set contactType(_i2.GContactType? contactType) =>
      _$this._contactType = contactType;

  GCreateVerificationCodeByJoinRequestVarsBuilder();

  GCreateVerificationCodeByJoinRequestVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _contactType = $v.contactType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateVerificationCodeByJoinRequestVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateVerificationCodeByJoinRequestVars;
  }

  @override
  void update(
      void Function(GCreateVerificationCodeByJoinRequestVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCreateVerificationCodeByJoinRequestVars build() {
    final _$result = _$v ??
        new _$GCreateVerificationCodeByJoinRequestVars._(
            contactType: BuiltValueNullFieldError.checkNotNull(contactType,
                'GCreateVerificationCodeByJoinRequestVars', 'contactType'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
