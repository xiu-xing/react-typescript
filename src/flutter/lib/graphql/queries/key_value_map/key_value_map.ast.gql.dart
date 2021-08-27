// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:gql/ast.dart' as _i1;
import 'package:rime_app/graphql/types/permission/permission.ast.gql.dart'
    as _i2;

const KeyValueMap = _i1.OperationDefinitionNode(
    type: _i1.OperationType.query,
    name: _i1.NameNode(value: 'KeyValueMap'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'funcID')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'requestBody')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'MaybeString'), isNonNull: false),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'platform')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NextPlatform'), isNonNull: false),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'keyValueMap'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'funcID'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'funcID'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'requestBody'),
                value:
                    _i1.VariableNode(name: _i1.NameNode(value: 'requestBody'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'platform'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'platform')))
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
                name: _i1.NameNode(value: 'data'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null),
            _i1.FieldNode(
                name: _i1.NameNode(value: 'permissions'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: _i1.SelectionSetNode(selections: [
                  _i1.FieldNode(
                      name: _i1.NameNode(value: '__typename'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null),
                  _i1.InlineFragmentNode(
                      typeCondition: _i1.TypeConditionNode(
                          on: _i1.NamedTypeNode(
                              name: _i1.NameNode(value: 'LockPermission'),
                              isNonNull: false)),
                      directives: [],
                      selectionSet: _i1.SelectionSetNode(selections: [
                        _i1.FragmentSpreadNode(
                            name: _i1.NameNode(value: 'LockPermissionFields'),
                            directives: [])
                      ])),
                  _i1.InlineFragmentNode(
                      typeCondition: _i1.TypeConditionNode(
                          on: _i1.NamedTypeNode(
                              name: _i1.NameNode(value: 'FrequencyPermission'),
                              isNonNull: false)),
                      directives: [],
                      selectionSet: _i1.SelectionSetNode(selections: [
                        _i1.FragmentSpreadNode(
                            name: _i1.NameNode(
                                value: 'FrequencyPermissionFields'),
                            directives: [])
                      ])),
                  _i1.InlineFragmentNode(
                      typeCondition: _i1.TypeConditionNode(
                          on: _i1.NamedTypeNode(
                              name: _i1.NameNode(value: 'PaginationPermission'),
                              isNonNull: false)),
                      directives: [],
                      selectionSet: _i1.SelectionSetNode(selections: [
                        _i1.FragmentSpreadNode(
                            name: _i1.NameNode(
                                value: 'PaginationPermissionFields'),
                            directives: [])
                      ]))
                ]))
          ]))
    ]));
const document = _i1.DocumentNode(definitions: [
  KeyValueMap,
  _i2.FrequencyPermissionFields,
  _i2.PaginationPermissionFields,
  _i2.LockPermissionFields
]);
