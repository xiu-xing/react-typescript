// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_card.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GBusinessCardDetailData> _$gBusinessCardDetailDataSerializer =
    new _$GBusinessCardDetailDataSerializer();
Serializer<GBusinessCardDetailData_bussinessCardDetail>
    _$gBusinessCardDetailDataBussinessCardDetailSerializer =
    new _$GBusinessCardDetailData_bussinessCardDetailSerializer();

class _$GBusinessCardDetailDataSerializer
    implements StructuredSerializer<GBusinessCardDetailData> {
  @override
  final Iterable<Type> types = const [
    GBusinessCardDetailData,
    _$GBusinessCardDetailData
  ];
  @override
  final String wireName = 'GBusinessCardDetailData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GBusinessCardDetailData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'bussinessCardDetail',
      serializers.serialize(object.bussinessCardDetail,
          specifiedType:
              const FullType(GBusinessCardDetailData_bussinessCardDetail)),
    ];

    return result;
  }

  @override
  GBusinessCardDetailData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GBusinessCardDetailDataBuilder();

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
        case 'bussinessCardDetail':
          result.bussinessCardDetail.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GBusinessCardDetailData_bussinessCardDetail))!
              as GBusinessCardDetailData_bussinessCardDetail);
          break;
      }
    }

    return result.build();
  }
}

class _$GBusinessCardDetailData_bussinessCardDetailSerializer
    implements
        StructuredSerializer<GBusinessCardDetailData_bussinessCardDetail> {
  @override
  final Iterable<Type> types = const [
    GBusinessCardDetailData_bussinessCardDetail,
    _$GBusinessCardDetailData_bussinessCardDetail
  ];
  @override
  final String wireName = 'GBusinessCardDetailData_bussinessCardDetail';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GBusinessCardDetailData_bussinessCardDetail object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
      'teamId',
      serializers.serialize(object.teamId,
          specifiedType: const FullType(String)),
      'joinStatus',
      serializers.serialize(object.joinStatus,
          specifiedType: const FullType(_i2.GJoinStatus)),
    ];
    Object? value;
    value = object.success;
    if (value != null) {
      result
        ..add('success')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.expireAt;
    if (value != null) {
      result
        ..add('expireAt')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.msg;
    if (value != null) {
      result
        ..add('msg')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GBusinessCardDetailData_bussinessCardDetail deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GBusinessCardDetailData_bussinessCardDetailBuilder();

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
              specifiedType: const FullType(String)) as String;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'teamId':
          result.teamId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'joinStatus':
          result.joinStatus = serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GJoinStatus))
              as _i2.GJoinStatus;
          break;
        case 'success':
          result.success = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'expireAt':
          result.expireAt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'msg':
          result.msg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GBusinessCardDetailData extends GBusinessCardDetailData {
  @override
  final String G__typename;
  @override
  final GBusinessCardDetailData_bussinessCardDetail bussinessCardDetail;

  factory _$GBusinessCardDetailData(
          [void Function(GBusinessCardDetailDataBuilder)? updates]) =>
      (new GBusinessCardDetailDataBuilder()..update(updates)).build();

  _$GBusinessCardDetailData._(
      {required this.G__typename, required this.bussinessCardDetail})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GBusinessCardDetailData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        bussinessCardDetail, 'GBusinessCardDetailData', 'bussinessCardDetail');
  }

  @override
  GBusinessCardDetailData rebuild(
          void Function(GBusinessCardDetailDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GBusinessCardDetailDataBuilder toBuilder() =>
      new GBusinessCardDetailDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GBusinessCardDetailData &&
        G__typename == other.G__typename &&
        bussinessCardDetail == other.bussinessCardDetail;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), bussinessCardDetail.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GBusinessCardDetailData')
          ..add('G__typename', G__typename)
          ..add('bussinessCardDetail', bussinessCardDetail))
        .toString();
  }
}

class GBusinessCardDetailDataBuilder
    implements
        Builder<GBusinessCardDetailData, GBusinessCardDetailDataBuilder> {
  _$GBusinessCardDetailData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GBusinessCardDetailData_bussinessCardDetailBuilder? _bussinessCardDetail;
  GBusinessCardDetailData_bussinessCardDetailBuilder get bussinessCardDetail =>
      _$this._bussinessCardDetail ??=
          new GBusinessCardDetailData_bussinessCardDetailBuilder();
  set bussinessCardDetail(
          GBusinessCardDetailData_bussinessCardDetailBuilder?
              bussinessCardDetail) =>
      _$this._bussinessCardDetail = bussinessCardDetail;

  GBusinessCardDetailDataBuilder() {
    GBusinessCardDetailData._initializeBuilder(this);
  }

  GBusinessCardDetailDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _bussinessCardDetail = $v.bussinessCardDetail.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GBusinessCardDetailData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GBusinessCardDetailData;
  }

  @override
  void update(void Function(GBusinessCardDetailDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GBusinessCardDetailData build() {
    _$GBusinessCardDetailData _$result;
    try {
      _$result = _$v ??
          new _$GBusinessCardDetailData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GBusinessCardDetailData', 'G__typename'),
              bussinessCardDetail: bussinessCardDetail.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'bussinessCardDetail';
        bussinessCardDetail.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GBusinessCardDetailData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GBusinessCardDetailData_bussinessCardDetail
    extends GBusinessCardDetailData_bussinessCardDetail {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String userId;
  @override
  final String teamId;
  @override
  final _i2.GJoinStatus joinStatus;
  @override
  final bool? success;
  @override
  final int? expireAt;
  @override
  final String? msg;
  @override
  final String? email;
  @override
  final String? phone;

  factory _$GBusinessCardDetailData_bussinessCardDetail(
          [void Function(GBusinessCardDetailData_bussinessCardDetailBuilder)?
              updates]) =>
      (new GBusinessCardDetailData_bussinessCardDetailBuilder()
            ..update(updates))
          .build();

  _$GBusinessCardDetailData_bussinessCardDetail._(
      {required this.G__typename,
      required this.id,
      required this.userId,
      required this.teamId,
      required this.joinStatus,
      this.success,
      this.expireAt,
      this.msg,
      this.email,
      this.phone})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GBusinessCardDetailData_bussinessCardDetail', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, 'GBusinessCardDetailData_bussinessCardDetail', 'id');
    BuiltValueNullFieldError.checkNotNull(
        userId, 'GBusinessCardDetailData_bussinessCardDetail', 'userId');
    BuiltValueNullFieldError.checkNotNull(
        teamId, 'GBusinessCardDetailData_bussinessCardDetail', 'teamId');
    BuiltValueNullFieldError.checkNotNull(joinStatus,
        'GBusinessCardDetailData_bussinessCardDetail', 'joinStatus');
  }

  @override
  GBusinessCardDetailData_bussinessCardDetail rebuild(
          void Function(GBusinessCardDetailData_bussinessCardDetailBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GBusinessCardDetailData_bussinessCardDetailBuilder toBuilder() =>
      new GBusinessCardDetailData_bussinessCardDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GBusinessCardDetailData_bussinessCardDetail &&
        G__typename == other.G__typename &&
        id == other.id &&
        userId == other.userId &&
        teamId == other.teamId &&
        joinStatus == other.joinStatus &&
        success == other.success &&
        expireAt == other.expireAt &&
        msg == other.msg &&
        email == other.email &&
        phone == other.phone;
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
                                    userId.hashCode),
                                teamId.hashCode),
                            joinStatus.hashCode),
                        success.hashCode),
                    expireAt.hashCode),
                msg.hashCode),
            email.hashCode),
        phone.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GBusinessCardDetailData_bussinessCardDetail')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('userId', userId)
          ..add('teamId', teamId)
          ..add('joinStatus', joinStatus)
          ..add('success', success)
          ..add('expireAt', expireAt)
          ..add('msg', msg)
          ..add('email', email)
          ..add('phone', phone))
        .toString();
  }
}

class GBusinessCardDetailData_bussinessCardDetailBuilder
    implements
        Builder<GBusinessCardDetailData_bussinessCardDetail,
            GBusinessCardDetailData_bussinessCardDetailBuilder> {
  _$GBusinessCardDetailData_bussinessCardDetail? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _teamId;
  String? get teamId => _$this._teamId;
  set teamId(String? teamId) => _$this._teamId = teamId;

  _i2.GJoinStatus? _joinStatus;
  _i2.GJoinStatus? get joinStatus => _$this._joinStatus;
  set joinStatus(_i2.GJoinStatus? joinStatus) =>
      _$this._joinStatus = joinStatus;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  int? _expireAt;
  int? get expireAt => _$this._expireAt;
  set expireAt(int? expireAt) => _$this._expireAt = expireAt;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  GBusinessCardDetailData_bussinessCardDetailBuilder() {
    GBusinessCardDetailData_bussinessCardDetail._initializeBuilder(this);
  }

  GBusinessCardDetailData_bussinessCardDetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _userId = $v.userId;
      _teamId = $v.teamId;
      _joinStatus = $v.joinStatus;
      _success = $v.success;
      _expireAt = $v.expireAt;
      _msg = $v.msg;
      _email = $v.email;
      _phone = $v.phone;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GBusinessCardDetailData_bussinessCardDetail other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GBusinessCardDetailData_bussinessCardDetail;
  }

  @override
  void update(
      void Function(GBusinessCardDetailData_bussinessCardDetailBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GBusinessCardDetailData_bussinessCardDetail build() {
    final _$result = _$v ??
        new _$GBusinessCardDetailData_bussinessCardDetail._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                'GBusinessCardDetailData_bussinessCardDetail', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, 'GBusinessCardDetailData_bussinessCardDetail', 'id'),
            userId: BuiltValueNullFieldError.checkNotNull(userId,
                'GBusinessCardDetailData_bussinessCardDetail', 'userId'),
            teamId: BuiltValueNullFieldError.checkNotNull(teamId,
                'GBusinessCardDetailData_bussinessCardDetail', 'teamId'),
            joinStatus: BuiltValueNullFieldError.checkNotNull(joinStatus,
                'GBusinessCardDetailData_bussinessCardDetail', 'joinStatus'),
            success: success,
            expireAt: expireAt,
            msg: msg,
            email: email,
            phone: phone);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
