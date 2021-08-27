// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:gql/ast.dart' as _i1;

const FrequencyPermissionFields = _i1.FragmentDefinitionNode(
    name: _i1.NameNode(value: 'FrequencyPermissionFields'),
    typeCondition: _i1.TypeConditionNode(
        on: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'FrequencyPermission'),
            isNonNull: false)),
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'used'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      _i1.FieldNode(
          name: _i1.NameNode(value: 'total'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      _i1.FieldNode(
          name: _i1.NameNode(value: 'remaining'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null)
    ]));
const PaginationPermissionFields = _i1.FragmentDefinitionNode(
    name: _i1.NameNode(value: 'PaginationPermissionFields'),
    typeCondition: _i1.TypeConditionNode(
        on: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'PaginationPermission'),
            isNonNull: false)),
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'rowLimit'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      _i1.FieldNode(
          name: _i1.NameNode(value: 'lockNextPage'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      _i1.FieldNode(
          name: _i1.NameNode(value: 'lockPreviousPage'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null)
    ]));
const LockPermissionFields = _i1.FragmentDefinitionNode(
    name: _i1.NameNode(value: 'LockPermissionFields'),
    typeCondition: _i1.TypeConditionNode(
        on: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'LockPermission'), isNonNull: false)),
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'locked'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null)
    ]));
const document = _i1.DocumentNode(definitions: [
  FrequencyPermissionFields,
  PaginationPermissionFields,
  LockPermissionFields
]);
