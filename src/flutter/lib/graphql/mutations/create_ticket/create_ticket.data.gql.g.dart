// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_ticket.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateTicketData> _$gCreateTicketDataSerializer =
    new _$GCreateTicketDataSerializer();

class _$GCreateTicketDataSerializer
    implements StructuredSerializer<GCreateTicketData> {
  @override
  final Iterable<Type> types = const [GCreateTicketData, _$GCreateTicketData];
  @override
  final String wireName = 'GCreateTicketData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCreateTicketData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'createTicket',
      serializers.serialize(object.createTicket,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GCreateTicketData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateTicketDataBuilder();

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
        case 'createTicket':
          result.createTicket = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateTicketData extends GCreateTicketData {
  @override
  final String G__typename;
  @override
  final bool createTicket;

  factory _$GCreateTicketData(
          [void Function(GCreateTicketDataBuilder)? updates]) =>
      (new GCreateTicketDataBuilder()..update(updates)).build();

  _$GCreateTicketData._({required this.G__typename, required this.createTicket})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GCreateTicketData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        createTicket, 'GCreateTicketData', 'createTicket');
  }

  @override
  GCreateTicketData rebuild(void Function(GCreateTicketDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateTicketDataBuilder toBuilder() =>
      new GCreateTicketDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateTicketData &&
        G__typename == other.G__typename &&
        createTicket == other.createTicket;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), createTicket.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GCreateTicketData')
          ..add('G__typename', G__typename)
          ..add('createTicket', createTicket))
        .toString();
  }
}

class GCreateTicketDataBuilder
    implements Builder<GCreateTicketData, GCreateTicketDataBuilder> {
  _$GCreateTicketData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _createTicket;
  bool? get createTicket => _$this._createTicket;
  set createTicket(bool? createTicket) => _$this._createTicket = createTicket;

  GCreateTicketDataBuilder() {
    GCreateTicketData._initializeBuilder(this);
  }

  GCreateTicketDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createTicket = $v.createTicket;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateTicketData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateTicketData;
  }

  @override
  void update(void Function(GCreateTicketDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCreateTicketData build() {
    final _$result = _$v ??
        new _$GCreateTicketData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GCreateTicketData', 'G__typename'),
            createTicket: BuiltValueNullFieldError.checkNotNull(
                createTicket, 'GCreateTicketData', 'createTicket'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
