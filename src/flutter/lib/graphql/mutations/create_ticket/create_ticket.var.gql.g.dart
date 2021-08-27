// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_ticket.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateTicketVars> _$gCreateTicketVarsSerializer =
    new _$GCreateTicketVarsSerializer();

class _$GCreateTicketVarsSerializer
    implements StructuredSerializer<GCreateTicketVars> {
  @override
  final Iterable<Type> types = const [GCreateTicketVars, _$GCreateTicketVars];
  @override
  final String wireName = 'GCreateTicketVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCreateTicketVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.payload;
    if (value != null) {
      result
        ..add('payload')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GCreateTicketVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateTicketVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'payload':
          result.payload = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateTicketVars extends GCreateTicketVars {
  @override
  final String? payload;
  @override
  final String type;

  factory _$GCreateTicketVars(
          [void Function(GCreateTicketVarsBuilder)? updates]) =>
      (new GCreateTicketVarsBuilder()..update(updates)).build();

  _$GCreateTicketVars._({this.payload, required this.type}) : super._() {
    BuiltValueNullFieldError.checkNotNull(type, 'GCreateTicketVars', 'type');
  }

  @override
  GCreateTicketVars rebuild(void Function(GCreateTicketVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateTicketVarsBuilder toBuilder() =>
      new GCreateTicketVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateTicketVars &&
        payload == other.payload &&
        type == other.type;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, payload.hashCode), type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GCreateTicketVars')
          ..add('payload', payload)
          ..add('type', type))
        .toString();
  }
}

class GCreateTicketVarsBuilder
    implements Builder<GCreateTicketVars, GCreateTicketVarsBuilder> {
  _$GCreateTicketVars? _$v;

  String? _payload;
  String? get payload => _$this._payload;
  set payload(String? payload) => _$this._payload = payload;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  GCreateTicketVarsBuilder();

  GCreateTicketVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _payload = $v.payload;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateTicketVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateTicketVars;
  }

  @override
  void update(void Function(GCreateTicketVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCreateTicketVars build() {
    final _$result = _$v ??
        new _$GCreateTicketVars._(
            payload: payload,
            type: BuiltValueNullFieldError.checkNotNull(
                type, 'GCreateTicketVars', 'type'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
