// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'key_value_map.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GKeyValueMapVars> _$gKeyValueMapVarsSerializer =
    new _$GKeyValueMapVarsSerializer();

class _$GKeyValueMapVarsSerializer
    implements StructuredSerializer<GKeyValueMapVars> {
  @override
  final Iterable<Type> types = const [GKeyValueMapVars, _$GKeyValueMapVars];
  @override
  final String wireName = 'GKeyValueMapVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GKeyValueMapVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'funcID',
      serializers.serialize(object.funcID,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.requestBody;
    if (value != null) {
      result
        ..add('requestBody')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.platform;
    if (value != null) {
      result
        ..add('platform')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i1.GNextPlatform)));
    }
    return result;
  }

  @override
  GKeyValueMapVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GKeyValueMapVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'funcID':
          result.funcID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'requestBody':
          result.requestBody = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'platform':
          result.platform = serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GNextPlatform))
              as _i1.GNextPlatform?;
          break;
      }
    }

    return result.build();
  }
}

class _$GKeyValueMapVars extends GKeyValueMapVars {
  @override
  final String funcID;
  @override
  final String? requestBody;
  @override
  final _i1.GNextPlatform? platform;

  factory _$GKeyValueMapVars(
          [void Function(GKeyValueMapVarsBuilder)? updates]) =>
      (new GKeyValueMapVarsBuilder()..update(updates)).build();

  _$GKeyValueMapVars._({required this.funcID, this.requestBody, this.platform})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(funcID, 'GKeyValueMapVars', 'funcID');
  }

  @override
  GKeyValueMapVars rebuild(void Function(GKeyValueMapVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GKeyValueMapVarsBuilder toBuilder() =>
      new GKeyValueMapVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GKeyValueMapVars &&
        funcID == other.funcID &&
        requestBody == other.requestBody &&
        platform == other.platform;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, funcID.hashCode), requestBody.hashCode), platform.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GKeyValueMapVars')
          ..add('funcID', funcID)
          ..add('requestBody', requestBody)
          ..add('platform', platform))
        .toString();
  }
}

class GKeyValueMapVarsBuilder
    implements Builder<GKeyValueMapVars, GKeyValueMapVarsBuilder> {
  _$GKeyValueMapVars? _$v;

  String? _funcID;
  String? get funcID => _$this._funcID;
  set funcID(String? funcID) => _$this._funcID = funcID;

  String? _requestBody;
  String? get requestBody => _$this._requestBody;
  set requestBody(String? requestBody) => _$this._requestBody = requestBody;

  _i1.GNextPlatform? _platform;
  _i1.GNextPlatform? get platform => _$this._platform;
  set platform(_i1.GNextPlatform? platform) => _$this._platform = platform;

  GKeyValueMapVarsBuilder();

  GKeyValueMapVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _funcID = $v.funcID;
      _requestBody = $v.requestBody;
      _platform = $v.platform;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GKeyValueMapVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GKeyValueMapVars;
  }

  @override
  void update(void Function(GKeyValueMapVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GKeyValueMapVars build() {
    final _$result = _$v ??
        new _$GKeyValueMapVars._(
            funcID: BuiltValueNullFieldError.checkNotNull(
                funcID, 'GKeyValueMapVars', 'funcID'),
            requestBody: requestBody,
            platform: platform);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
