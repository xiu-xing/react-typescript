// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUserProfileFieldsData> _$gUserProfileFieldsDataSerializer =
    new _$GUserProfileFieldsDataSerializer();
Serializer<GUserProfileFieldsData_fields>
    _$gUserProfileFieldsDataFieldsSerializer =
    new _$GUserProfileFieldsData_fieldsSerializer();
Serializer<GUserProfileFieldsData_fields_options>
    _$gUserProfileFieldsDataFieldsOptionsSerializer =
    new _$GUserProfileFieldsData_fields_optionsSerializer();
Serializer<GUserProfileFieldsData_fields_selectedOptions>
    _$gUserProfileFieldsDataFieldsSelectedOptionsSerializer =
    new _$GUserProfileFieldsData_fields_selectedOptionsSerializer();

class _$GUserProfileFieldsDataSerializer
    implements StructuredSerializer<GUserProfileFieldsData> {
  @override
  final Iterable<Type> types = const [
    GUserProfileFieldsData,
    _$GUserProfileFieldsData
  ];
  @override
  final String wireName = 'GUserProfileFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserProfileFieldsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.fields;
    if (value != null) {
      result
        ..add('fields')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList,
                const [const FullType(GUserProfileFieldsData_fields)])));
    }
    return result;
  }

  @override
  GUserProfileFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserProfileFieldsDataBuilder();

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
        case 'fields':
          result.fields.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GUserProfileFieldsData_fields)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserProfileFieldsData_fieldsSerializer
    implements StructuredSerializer<GUserProfileFieldsData_fields> {
  @override
  final Iterable<Type> types = const [
    GUserProfileFieldsData_fields,
    _$GUserProfileFieldsData_fields
  ];
  @override
  final String wireName = 'GUserProfileFieldsData_fields';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserProfileFieldsData_fields object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.isRequired;
    if (value != null) {
      result
        ..add('isRequired')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.options;
    if (value != null) {
      result
        ..add('options')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(GUserProfileFieldsData_fields_options)
            ])));
    }
    value = object.selectedOptions;
    if (value != null) {
      result
        ..add('selectedOptions')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(GUserProfileFieldsData_fields_selectedOptions)
            ])));
    }
    value = object.isMultiple;
    if (value != null) {
      result
        ..add('isMultiple')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GUserProfileFieldsData_fields deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserProfileFieldsData_fieldsBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isRequired':
          result.isRequired = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'options':
          result.options.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GUserProfileFieldsData_fields_options)
              ]))! as BuiltList<Object?>);
          break;
        case 'selectedOptions':
          result.selectedOptions.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GUserProfileFieldsData_fields_selectedOptions)
              ]))! as BuiltList<Object?>);
          break;
        case 'isMultiple':
          result.isMultiple = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$GUserProfileFieldsData_fields_optionsSerializer
    implements StructuredSerializer<GUserProfileFieldsData_fields_options> {
  @override
  final Iterable<Type> types = const [
    GUserProfileFieldsData_fields_options,
    _$GUserProfileFieldsData_fields_options
  ];
  @override
  final String wireName = 'GUserProfileFieldsData_fields_options';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserProfileFieldsData_fields_options object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GUserProfileFieldsData_fields_options deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserProfileFieldsData_fields_optionsBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GUserProfileFieldsData_fields_selectedOptionsSerializer
    implements
        StructuredSerializer<GUserProfileFieldsData_fields_selectedOptions> {
  @override
  final Iterable<Type> types = const [
    GUserProfileFieldsData_fields_selectedOptions,
    _$GUserProfileFieldsData_fields_selectedOptions
  ];
  @override
  final String wireName = 'GUserProfileFieldsData_fields_selectedOptions';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GUserProfileFieldsData_fields_selectedOptions object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GUserProfileFieldsData_fields_selectedOptions deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserProfileFieldsData_fields_selectedOptionsBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GUserProfileFieldsData extends GUserProfileFieldsData {
  @override
  final String G__typename;
  @override
  final BuiltList<GUserProfileFieldsData_fields>? fields;

  factory _$GUserProfileFieldsData(
          [void Function(GUserProfileFieldsDataBuilder)? updates]) =>
      (new GUserProfileFieldsDataBuilder()..update(updates)).build();

  _$GUserProfileFieldsData._({required this.G__typename, this.fields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GUserProfileFieldsData', 'G__typename');
  }

  @override
  GUserProfileFieldsData rebuild(
          void Function(GUserProfileFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserProfileFieldsDataBuilder toBuilder() =>
      new GUserProfileFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserProfileFieldsData &&
        G__typename == other.G__typename &&
        fields == other.fields;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), fields.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUserProfileFieldsData')
          ..add('G__typename', G__typename)
          ..add('fields', fields))
        .toString();
  }
}

class GUserProfileFieldsDataBuilder
    implements Builder<GUserProfileFieldsData, GUserProfileFieldsDataBuilder> {
  _$GUserProfileFieldsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GUserProfileFieldsData_fields>? _fields;
  ListBuilder<GUserProfileFieldsData_fields> get fields =>
      _$this._fields ??= new ListBuilder<GUserProfileFieldsData_fields>();
  set fields(ListBuilder<GUserProfileFieldsData_fields>? fields) =>
      _$this._fields = fields;

  GUserProfileFieldsDataBuilder() {
    GUserProfileFieldsData._initializeBuilder(this);
  }

  GUserProfileFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _fields = $v.fields?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserProfileFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserProfileFieldsData;
  }

  @override
  void update(void Function(GUserProfileFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUserProfileFieldsData build() {
    _$GUserProfileFieldsData _$result;
    try {
      _$result = _$v ??
          new _$GUserProfileFieldsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GUserProfileFieldsData', 'G__typename'),
              fields: _fields?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'fields';
        _fields?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GUserProfileFieldsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserProfileFieldsData_fields extends GUserProfileFieldsData_fields {
  @override
  final String G__typename;
  @override
  final String name;
  @override
  final bool? isRequired;
  @override
  final String title;
  @override
  final BuiltList<GUserProfileFieldsData_fields_options>? options;
  @override
  final BuiltList<GUserProfileFieldsData_fields_selectedOptions>?
      selectedOptions;
  @override
  final bool? isMultiple;

  factory _$GUserProfileFieldsData_fields(
          [void Function(GUserProfileFieldsData_fieldsBuilder)? updates]) =>
      (new GUserProfileFieldsData_fieldsBuilder()..update(updates)).build();

  _$GUserProfileFieldsData_fields._(
      {required this.G__typename,
      required this.name,
      this.isRequired,
      required this.title,
      this.options,
      this.selectedOptions,
      this.isMultiple})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GUserProfileFieldsData_fields', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        name, 'GUserProfileFieldsData_fields', 'name');
    BuiltValueNullFieldError.checkNotNull(
        title, 'GUserProfileFieldsData_fields', 'title');
  }

  @override
  GUserProfileFieldsData_fields rebuild(
          void Function(GUserProfileFieldsData_fieldsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserProfileFieldsData_fieldsBuilder toBuilder() =>
      new GUserProfileFieldsData_fieldsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserProfileFieldsData_fields &&
        G__typename == other.G__typename &&
        name == other.name &&
        isRequired == other.isRequired &&
        title == other.title &&
        options == other.options &&
        selectedOptions == other.selectedOptions &&
        isMultiple == other.isMultiple;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, G__typename.hashCode), name.hashCode),
                        isRequired.hashCode),
                    title.hashCode),
                options.hashCode),
            selectedOptions.hashCode),
        isMultiple.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUserProfileFieldsData_fields')
          ..add('G__typename', G__typename)
          ..add('name', name)
          ..add('isRequired', isRequired)
          ..add('title', title)
          ..add('options', options)
          ..add('selectedOptions', selectedOptions)
          ..add('isMultiple', isMultiple))
        .toString();
  }
}

class GUserProfileFieldsData_fieldsBuilder
    implements
        Builder<GUserProfileFieldsData_fields,
            GUserProfileFieldsData_fieldsBuilder> {
  _$GUserProfileFieldsData_fields? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  bool? _isRequired;
  bool? get isRequired => _$this._isRequired;
  set isRequired(bool? isRequired) => _$this._isRequired = isRequired;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  ListBuilder<GUserProfileFieldsData_fields_options>? _options;
  ListBuilder<GUserProfileFieldsData_fields_options> get options =>
      _$this._options ??=
          new ListBuilder<GUserProfileFieldsData_fields_options>();
  set options(ListBuilder<GUserProfileFieldsData_fields_options>? options) =>
      _$this._options = options;

  ListBuilder<GUserProfileFieldsData_fields_selectedOptions>? _selectedOptions;
  ListBuilder<GUserProfileFieldsData_fields_selectedOptions>
      get selectedOptions => _$this._selectedOptions ??=
          new ListBuilder<GUserProfileFieldsData_fields_selectedOptions>();
  set selectedOptions(
          ListBuilder<GUserProfileFieldsData_fields_selectedOptions>?
              selectedOptions) =>
      _$this._selectedOptions = selectedOptions;

  bool? _isMultiple;
  bool? get isMultiple => _$this._isMultiple;
  set isMultiple(bool? isMultiple) => _$this._isMultiple = isMultiple;

  GUserProfileFieldsData_fieldsBuilder() {
    GUserProfileFieldsData_fields._initializeBuilder(this);
  }

  GUserProfileFieldsData_fieldsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _name = $v.name;
      _isRequired = $v.isRequired;
      _title = $v.title;
      _options = $v.options?.toBuilder();
      _selectedOptions = $v.selectedOptions?.toBuilder();
      _isMultiple = $v.isMultiple;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserProfileFieldsData_fields other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserProfileFieldsData_fields;
  }

  @override
  void update(void Function(GUserProfileFieldsData_fieldsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUserProfileFieldsData_fields build() {
    _$GUserProfileFieldsData_fields _$result;
    try {
      _$result = _$v ??
          new _$GUserProfileFieldsData_fields._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GUserProfileFieldsData_fields', 'G__typename'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, 'GUserProfileFieldsData_fields', 'name'),
              isRequired: isRequired,
              title: BuiltValueNullFieldError.checkNotNull(
                  title, 'GUserProfileFieldsData_fields', 'title'),
              options: _options?.build(),
              selectedOptions: _selectedOptions?.build(),
              isMultiple: isMultiple);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'options';
        _options?.build();
        _$failedField = 'selectedOptions';
        _selectedOptions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GUserProfileFieldsData_fields', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserProfileFieldsData_fields_options
    extends GUserProfileFieldsData_fields_options {
  @override
  final String G__typename;
  @override
  final String name;
  @override
  final String value;

  factory _$GUserProfileFieldsData_fields_options(
          [void Function(GUserProfileFieldsData_fields_optionsBuilder)?
              updates]) =>
      (new GUserProfileFieldsData_fields_optionsBuilder()..update(updates))
          .build();

  _$GUserProfileFieldsData_fields_options._(
      {required this.G__typename, required this.name, required this.value})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GUserProfileFieldsData_fields_options', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        name, 'GUserProfileFieldsData_fields_options', 'name');
    BuiltValueNullFieldError.checkNotNull(
        value, 'GUserProfileFieldsData_fields_options', 'value');
  }

  @override
  GUserProfileFieldsData_fields_options rebuild(
          void Function(GUserProfileFieldsData_fields_optionsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserProfileFieldsData_fields_optionsBuilder toBuilder() =>
      new GUserProfileFieldsData_fields_optionsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserProfileFieldsData_fields_options &&
        G__typename == other.G__typename &&
        name == other.name &&
        value == other.value;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, G__typename.hashCode), name.hashCode), value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUserProfileFieldsData_fields_options')
          ..add('G__typename', G__typename)
          ..add('name', name)
          ..add('value', value))
        .toString();
  }
}

class GUserProfileFieldsData_fields_optionsBuilder
    implements
        Builder<GUserProfileFieldsData_fields_options,
            GUserProfileFieldsData_fields_optionsBuilder> {
  _$GUserProfileFieldsData_fields_options? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  GUserProfileFieldsData_fields_optionsBuilder() {
    GUserProfileFieldsData_fields_options._initializeBuilder(this);
  }

  GUserProfileFieldsData_fields_optionsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _name = $v.name;
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserProfileFieldsData_fields_options other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserProfileFieldsData_fields_options;
  }

  @override
  void update(
      void Function(GUserProfileFieldsData_fields_optionsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUserProfileFieldsData_fields_options build() {
    final _$result = _$v ??
        new _$GUserProfileFieldsData_fields_options._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                'GUserProfileFieldsData_fields_options', 'G__typename'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'GUserProfileFieldsData_fields_options', 'name'),
            value: BuiltValueNullFieldError.checkNotNull(
                value, 'GUserProfileFieldsData_fields_options', 'value'));
    replace(_$result);
    return _$result;
  }
}

class _$GUserProfileFieldsData_fields_selectedOptions
    extends GUserProfileFieldsData_fields_selectedOptions {
  @override
  final String G__typename;
  @override
  final String name;
  @override
  final String value;

  factory _$GUserProfileFieldsData_fields_selectedOptions(
          [void Function(GUserProfileFieldsData_fields_selectedOptionsBuilder)?
              updates]) =>
      (new GUserProfileFieldsData_fields_selectedOptionsBuilder()
            ..update(updates))
          .build();

  _$GUserProfileFieldsData_fields_selectedOptions._(
      {required this.G__typename, required this.name, required this.value})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GUserProfileFieldsData_fields_selectedOptions', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        name, 'GUserProfileFieldsData_fields_selectedOptions', 'name');
    BuiltValueNullFieldError.checkNotNull(
        value, 'GUserProfileFieldsData_fields_selectedOptions', 'value');
  }

  @override
  GUserProfileFieldsData_fields_selectedOptions rebuild(
          void Function(GUserProfileFieldsData_fields_selectedOptionsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserProfileFieldsData_fields_selectedOptionsBuilder toBuilder() =>
      new GUserProfileFieldsData_fields_selectedOptionsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserProfileFieldsData_fields_selectedOptions &&
        G__typename == other.G__typename &&
        name == other.name &&
        value == other.value;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, G__typename.hashCode), name.hashCode), value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GUserProfileFieldsData_fields_selectedOptions')
          ..add('G__typename', G__typename)
          ..add('name', name)
          ..add('value', value))
        .toString();
  }
}

class GUserProfileFieldsData_fields_selectedOptionsBuilder
    implements
        Builder<GUserProfileFieldsData_fields_selectedOptions,
            GUserProfileFieldsData_fields_selectedOptionsBuilder> {
  _$GUserProfileFieldsData_fields_selectedOptions? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  GUserProfileFieldsData_fields_selectedOptionsBuilder() {
    GUserProfileFieldsData_fields_selectedOptions._initializeBuilder(this);
  }

  GUserProfileFieldsData_fields_selectedOptionsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _name = $v.name;
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserProfileFieldsData_fields_selectedOptions other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserProfileFieldsData_fields_selectedOptions;
  }

  @override
  void update(
      void Function(GUserProfileFieldsData_fields_selectedOptionsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUserProfileFieldsData_fields_selectedOptions build() {
    final _$result = _$v ??
        new _$GUserProfileFieldsData_fields_selectedOptions._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                'GUserProfileFieldsData_fields_selectedOptions', 'G__typename'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'GUserProfileFieldsData_fields_selectedOptions', 'name'),
            value: BuiltValueNullFieldError.checkNotNull(value,
                'GUserProfileFieldsData_fields_selectedOptions', 'value'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
