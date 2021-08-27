// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_card.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateBusinessCardApprovalTicketData>
    _$gCreateBusinessCardApprovalTicketDataSerializer =
    new _$GCreateBusinessCardApprovalTicketDataSerializer();
Serializer<GCreateVerificationCodeData>
    _$gCreateVerificationCodeDataSerializer =
    new _$GCreateVerificationCodeDataSerializer();
Serializer<GVerifyCodeAndApproveJoinRequestData>
    _$gVerifyCodeAndApproveJoinRequestDataSerializer =
    new _$GVerifyCodeAndApproveJoinRequestDataSerializer();
Serializer<GCreateVerificationCodeByJoinRequestData>
    _$gCreateVerificationCodeByJoinRequestDataSerializer =
    new _$GCreateVerificationCodeByJoinRequestDataSerializer();

class _$GCreateBusinessCardApprovalTicketDataSerializer
    implements StructuredSerializer<GCreateBusinessCardApprovalTicketData> {
  @override
  final Iterable<Type> types = const [
    GCreateBusinessCardApprovalTicketData,
    _$GCreateBusinessCardApprovalTicketData
  ];
  @override
  final String wireName = 'GCreateBusinessCardApprovalTicketData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateBusinessCardApprovalTicketData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'createBussinessCardApprovalTicket',
      serializers.serialize(object.createBussinessCardApprovalTicket,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GCreateBusinessCardApprovalTicketData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateBusinessCardApprovalTicketDataBuilder();

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
        case 'createBussinessCardApprovalTicket':
          result.createBussinessCardApprovalTicket = serializers
              .deserialize(value, specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateVerificationCodeDataSerializer
    implements StructuredSerializer<GCreateVerificationCodeData> {
  @override
  final Iterable<Type> types = const [
    GCreateVerificationCodeData,
    _$GCreateVerificationCodeData
  ];
  @override
  final String wireName = 'GCreateVerificationCodeData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateVerificationCodeData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.createVerificationCode;
    if (value != null) {
      result
        ..add('createVerificationCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GCreateVerificationCodeData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateVerificationCodeDataBuilder();

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
        case 'createVerificationCode':
          result.createVerificationCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GVerifyCodeAndApproveJoinRequestDataSerializer
    implements StructuredSerializer<GVerifyCodeAndApproveJoinRequestData> {
  @override
  final Iterable<Type> types = const [
    GVerifyCodeAndApproveJoinRequestData,
    _$GVerifyCodeAndApproveJoinRequestData
  ];
  @override
  final String wireName = 'GVerifyCodeAndApproveJoinRequestData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GVerifyCodeAndApproveJoinRequestData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.verifyCodeAndApproveJoinRequest;
    if (value != null) {
      result
        ..add('verifyCodeAndApproveJoinRequest')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GVerifyCodeAndApproveJoinRequestData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GVerifyCodeAndApproveJoinRequestDataBuilder();

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
        case 'verifyCodeAndApproveJoinRequest':
          result.verifyCodeAndApproveJoinRequest = serializers
              .deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateVerificationCodeByJoinRequestDataSerializer
    implements StructuredSerializer<GCreateVerificationCodeByJoinRequestData> {
  @override
  final Iterable<Type> types = const [
    GCreateVerificationCodeByJoinRequestData,
    _$GCreateVerificationCodeByJoinRequestData
  ];
  @override
  final String wireName = 'GCreateVerificationCodeByJoinRequestData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateVerificationCodeByJoinRequestData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.createVerificationCodeByJoinRequest;
    if (value != null) {
      result
        ..add('createVerificationCodeByJoinRequest')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GCreateVerificationCodeByJoinRequestData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateVerificationCodeByJoinRequestDataBuilder();

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
        case 'createVerificationCodeByJoinRequest':
          result.createVerificationCodeByJoinRequest = serializers.deserialize(
              value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateBusinessCardApprovalTicketData
    extends GCreateBusinessCardApprovalTicketData {
  @override
  final String G__typename;
  @override
  final bool createBussinessCardApprovalTicket;

  factory _$GCreateBusinessCardApprovalTicketData(
          [void Function(GCreateBusinessCardApprovalTicketDataBuilder)?
              updates]) =>
      (new GCreateBusinessCardApprovalTicketDataBuilder()..update(updates))
          .build();

  _$GCreateBusinessCardApprovalTicketData._(
      {required this.G__typename,
      required this.createBussinessCardApprovalTicket})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GCreateBusinessCardApprovalTicketData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        createBussinessCardApprovalTicket,
        'GCreateBusinessCardApprovalTicketData',
        'createBussinessCardApprovalTicket');
  }

  @override
  GCreateBusinessCardApprovalTicketData rebuild(
          void Function(GCreateBusinessCardApprovalTicketDataBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateBusinessCardApprovalTicketDataBuilder toBuilder() =>
      new GCreateBusinessCardApprovalTicketDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateBusinessCardApprovalTicketData &&
        G__typename == other.G__typename &&
        createBussinessCardApprovalTicket ==
            other.createBussinessCardApprovalTicket;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode),
        createBussinessCardApprovalTicket.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GCreateBusinessCardApprovalTicketData')
          ..add('G__typename', G__typename)
          ..add('createBussinessCardApprovalTicket',
              createBussinessCardApprovalTicket))
        .toString();
  }
}

class GCreateBusinessCardApprovalTicketDataBuilder
    implements
        Builder<GCreateBusinessCardApprovalTicketData,
            GCreateBusinessCardApprovalTicketDataBuilder> {
  _$GCreateBusinessCardApprovalTicketData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _createBussinessCardApprovalTicket;
  bool? get createBussinessCardApprovalTicket =>
      _$this._createBussinessCardApprovalTicket;
  set createBussinessCardApprovalTicket(
          bool? createBussinessCardApprovalTicket) =>
      _$this._createBussinessCardApprovalTicket =
          createBussinessCardApprovalTicket;

  GCreateBusinessCardApprovalTicketDataBuilder() {
    GCreateBusinessCardApprovalTicketData._initializeBuilder(this);
  }

  GCreateBusinessCardApprovalTicketDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createBussinessCardApprovalTicket = $v.createBussinessCardApprovalTicket;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateBusinessCardApprovalTicketData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateBusinessCardApprovalTicketData;
  }

  @override
  void update(
      void Function(GCreateBusinessCardApprovalTicketDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCreateBusinessCardApprovalTicketData build() {
    final _$result = _$v ??
        new _$GCreateBusinessCardApprovalTicketData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                'GCreateBusinessCardApprovalTicketData', 'G__typename'),
            createBussinessCardApprovalTicket:
                BuiltValueNullFieldError.checkNotNull(
                    createBussinessCardApprovalTicket,
                    'GCreateBusinessCardApprovalTicketData',
                    'createBussinessCardApprovalTicket'));
    replace(_$result);
    return _$result;
  }
}

class _$GCreateVerificationCodeData extends GCreateVerificationCodeData {
  @override
  final String G__typename;
  @override
  final String? createVerificationCode;

  factory _$GCreateVerificationCodeData(
          [void Function(GCreateVerificationCodeDataBuilder)? updates]) =>
      (new GCreateVerificationCodeDataBuilder()..update(updates)).build();

  _$GCreateVerificationCodeData._(
      {required this.G__typename, this.createVerificationCode})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GCreateVerificationCodeData', 'G__typename');
  }

  @override
  GCreateVerificationCodeData rebuild(
          void Function(GCreateVerificationCodeDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateVerificationCodeDataBuilder toBuilder() =>
      new GCreateVerificationCodeDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateVerificationCodeData &&
        G__typename == other.G__typename &&
        createVerificationCode == other.createVerificationCode;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, G__typename.hashCode), createVerificationCode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GCreateVerificationCodeData')
          ..add('G__typename', G__typename)
          ..add('createVerificationCode', createVerificationCode))
        .toString();
  }
}

class GCreateVerificationCodeDataBuilder
    implements
        Builder<GCreateVerificationCodeData,
            GCreateVerificationCodeDataBuilder> {
  _$GCreateVerificationCodeData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _createVerificationCode;
  String? get createVerificationCode => _$this._createVerificationCode;
  set createVerificationCode(String? createVerificationCode) =>
      _$this._createVerificationCode = createVerificationCode;

  GCreateVerificationCodeDataBuilder() {
    GCreateVerificationCodeData._initializeBuilder(this);
  }

  GCreateVerificationCodeDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createVerificationCode = $v.createVerificationCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateVerificationCodeData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateVerificationCodeData;
  }

  @override
  void update(void Function(GCreateVerificationCodeDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCreateVerificationCodeData build() {
    final _$result = _$v ??
        new _$GCreateVerificationCodeData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GCreateVerificationCodeData', 'G__typename'),
            createVerificationCode: createVerificationCode);
    replace(_$result);
    return _$result;
  }
}

class _$GVerifyCodeAndApproveJoinRequestData
    extends GVerifyCodeAndApproveJoinRequestData {
  @override
  final String G__typename;
  @override
  final bool? verifyCodeAndApproveJoinRequest;

  factory _$GVerifyCodeAndApproveJoinRequestData(
          [void Function(GVerifyCodeAndApproveJoinRequestDataBuilder)?
              updates]) =>
      (new GVerifyCodeAndApproveJoinRequestDataBuilder()..update(updates))
          .build();

  _$GVerifyCodeAndApproveJoinRequestData._(
      {required this.G__typename, this.verifyCodeAndApproveJoinRequest})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GVerifyCodeAndApproveJoinRequestData', 'G__typename');
  }

  @override
  GVerifyCodeAndApproveJoinRequestData rebuild(
          void Function(GVerifyCodeAndApproveJoinRequestDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GVerifyCodeAndApproveJoinRequestDataBuilder toBuilder() =>
      new GVerifyCodeAndApproveJoinRequestDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GVerifyCodeAndApproveJoinRequestData &&
        G__typename == other.G__typename &&
        verifyCodeAndApproveJoinRequest ==
            other.verifyCodeAndApproveJoinRequest;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode),
        verifyCodeAndApproveJoinRequest.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GVerifyCodeAndApproveJoinRequestData')
          ..add('G__typename', G__typename)
          ..add('verifyCodeAndApproveJoinRequest',
              verifyCodeAndApproveJoinRequest))
        .toString();
  }
}

class GVerifyCodeAndApproveJoinRequestDataBuilder
    implements
        Builder<GVerifyCodeAndApproveJoinRequestData,
            GVerifyCodeAndApproveJoinRequestDataBuilder> {
  _$GVerifyCodeAndApproveJoinRequestData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _verifyCodeAndApproveJoinRequest;
  bool? get verifyCodeAndApproveJoinRequest =>
      _$this._verifyCodeAndApproveJoinRequest;
  set verifyCodeAndApproveJoinRequest(bool? verifyCodeAndApproveJoinRequest) =>
      _$this._verifyCodeAndApproveJoinRequest = verifyCodeAndApproveJoinRequest;

  GVerifyCodeAndApproveJoinRequestDataBuilder() {
    GVerifyCodeAndApproveJoinRequestData._initializeBuilder(this);
  }

  GVerifyCodeAndApproveJoinRequestDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _verifyCodeAndApproveJoinRequest = $v.verifyCodeAndApproveJoinRequest;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GVerifyCodeAndApproveJoinRequestData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GVerifyCodeAndApproveJoinRequestData;
  }

  @override
  void update(
      void Function(GVerifyCodeAndApproveJoinRequestDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GVerifyCodeAndApproveJoinRequestData build() {
    final _$result = _$v ??
        new _$GVerifyCodeAndApproveJoinRequestData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                'GVerifyCodeAndApproveJoinRequestData', 'G__typename'),
            verifyCodeAndApproveJoinRequest: verifyCodeAndApproveJoinRequest);
    replace(_$result);
    return _$result;
  }
}

class _$GCreateVerificationCodeByJoinRequestData
    extends GCreateVerificationCodeByJoinRequestData {
  @override
  final String G__typename;
  @override
  final String? createVerificationCodeByJoinRequest;

  factory _$GCreateVerificationCodeByJoinRequestData(
          [void Function(GCreateVerificationCodeByJoinRequestDataBuilder)?
              updates]) =>
      (new GCreateVerificationCodeByJoinRequestDataBuilder()..update(updates))
          .build();

  _$GCreateVerificationCodeByJoinRequestData._(
      {required this.G__typename, this.createVerificationCodeByJoinRequest})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GCreateVerificationCodeByJoinRequestData', 'G__typename');
  }

  @override
  GCreateVerificationCodeByJoinRequestData rebuild(
          void Function(GCreateVerificationCodeByJoinRequestDataBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateVerificationCodeByJoinRequestDataBuilder toBuilder() =>
      new GCreateVerificationCodeByJoinRequestDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateVerificationCodeByJoinRequestData &&
        G__typename == other.G__typename &&
        createVerificationCodeByJoinRequest ==
            other.createVerificationCodeByJoinRequest;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode),
        createVerificationCodeByJoinRequest.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GCreateVerificationCodeByJoinRequestData')
          ..add('G__typename', G__typename)
          ..add('createVerificationCodeByJoinRequest',
              createVerificationCodeByJoinRequest))
        .toString();
  }
}

class GCreateVerificationCodeByJoinRequestDataBuilder
    implements
        Builder<GCreateVerificationCodeByJoinRequestData,
            GCreateVerificationCodeByJoinRequestDataBuilder> {
  _$GCreateVerificationCodeByJoinRequestData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _createVerificationCodeByJoinRequest;
  String? get createVerificationCodeByJoinRequest =>
      _$this._createVerificationCodeByJoinRequest;
  set createVerificationCodeByJoinRequest(
          String? createVerificationCodeByJoinRequest) =>
      _$this._createVerificationCodeByJoinRequest =
          createVerificationCodeByJoinRequest;

  GCreateVerificationCodeByJoinRequestDataBuilder() {
    GCreateVerificationCodeByJoinRequestData._initializeBuilder(this);
  }

  GCreateVerificationCodeByJoinRequestDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createVerificationCodeByJoinRequest =
          $v.createVerificationCodeByJoinRequest;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateVerificationCodeByJoinRequestData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateVerificationCodeByJoinRequestData;
  }

  @override
  void update(
      void Function(GCreateVerificationCodeByJoinRequestDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCreateVerificationCodeByJoinRequestData build() {
    final _$result = _$v ??
        new _$GCreateVerificationCodeByJoinRequestData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                'GCreateVerificationCodeByJoinRequestData', 'G__typename'),
            createVerificationCodeByJoinRequest:
                createVerificationCodeByJoinRequest);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
