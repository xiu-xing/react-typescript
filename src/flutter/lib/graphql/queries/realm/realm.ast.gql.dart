// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:gql/ast.dart' as _i1;
import 'package:rime_app/graphql/types/page_info/page_info.ast.gql.dart' as _i2;
import 'package:rime_app/graphql/types/permission/permission.ast.gql.dart'
    as _i3;
import 'package:rime_app/graphql/types/tags/tags_fragment.ast.gql.dart' as _i4;

const AppRealm = _i1.OperationDefinitionNode(
    type: _i1.OperationType.query,
    name: _i1.NameNode(value: 'AppRealm'),
    variableDefinitions: [],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'appRealms'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
                name: _i1.NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null),
            _i1.FieldNode(
                name: _i1.NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null),
            _i1.FieldNode(
                name: _i1.NameNode(value: 'orderColumns'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: _i1.SelectionSetNode(selections: [
                  _i1.FieldNode(
                      name: _i1.NameNode(value: 'id'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null),
                  _i1.FieldNode(
                      name: _i1.NameNode(value: 'name'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null)
                ])),
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
const AppRealmSearchResult = _i1.OperationDefinitionNode(
    type: _i1.OperationType.query,
    name: _i1.NameNode(value: 'AppRealmSearchResult'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'realmID')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'first')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'MaybeInt32'), isNonNull: false),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'after')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'MaybeString'), isNonNull: false),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'last')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'MaybeInt32'), isNonNull: false),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'before')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'MaybeString'), isNonNull: false),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'conditions')),
          type: _i1.ListTypeNode(
              type: _i1.NamedTypeNode(
                  name: _i1.NameNode(value: 'NextSearchConditionInput'),
                  isNonNull: false),
              isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'orderColumns')),
          type: _i1.ListTypeNode(
              type: _i1.NamedTypeNode(
                  name: _i1.NameNode(value: 'OrderColumn'), isNonNull: false),
              isNonNull: false),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'appRealmSearchResult'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'realmID'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'realmID'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'first'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'first'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'after'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'after'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'last'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'last'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'before'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'before'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'conditions'),
                value:
                    _i1.VariableNode(name: _i1.NameNode(value: 'conditions'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'orderColumns'),
                value:
                    _i1.VariableNode(name: _i1.NameNode(value: 'orderColumns')))
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
                name: _i1.NameNode(value: 'totalCount'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null),
            _i1.FieldNode(
                name: _i1.NameNode(value: 'nodes'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: _i1.SelectionSetNode(selections: [
                  _i1.FieldNode(
                      name: _i1.NameNode(value: 'entityID'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null),
                  _i1.FieldNode(
                      name: _i1.NameNode(value: 'entityType'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null),
                  _i1.FieldNode(
                      name: _i1.NameNode(value: 'logoURI'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null),
                  _i1.FieldNode(
                      name: _i1.NameNode(value: 'primaryName'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null),
                  _i1.FieldNode(
                      name: _i1.NameNode(value: 'label'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null),
                  _i1.FieldNode(
                      name: _i1.NameNode(value: 'description'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null),
                  _i1.FieldNode(
                      name: _i1.NameNode(value: 'tags'),
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
                                    name: _i1.NameNode(value: 'TextTag'),
                                    isNonNull: false)),
                            directives: [],
                            selectionSet: _i1.SelectionSetNode(selections: [
                              _i1.FragmentSpreadNode(
                                  name: _i1.NameNode(value: 'TextTagFields'),
                                  directives: [])
                            ])),
                        _i1.InlineFragmentNode(
                            typeCondition: _i1.TypeConditionNode(
                                on: _i1.NamedTypeNode(
                                    name: _i1.NameNode(value: 'RiskTag'),
                                    isNonNull: false)),
                            directives: [],
                            selectionSet: _i1.SelectionSetNode(selections: [
                              _i1.FragmentSpreadNode(
                                  name: _i1.NameNode(value: 'RiskTagFields'),
                                  directives: [])
                            ])),
                        _i1.InlineFragmentNode(
                            typeCondition: _i1.TypeConditionNode(
                                on: _i1.NamedTypeNode(
                                    name: _i1.NameNode(value: 'QuickSearchTag'),
                                    isNonNull: false)),
                            directives: [],
                            selectionSet: _i1.SelectionSetNode(selections: [
                              _i1.FragmentSpreadNode(
                                  name: _i1.NameNode(
                                      value: 'QuickSearchTagFields'),
                                  directives: [])
                            ]))
                      ]))
                ])),
            _i1.FieldNode(
                name: _i1.NameNode(value: 'pageInfo'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: _i1.SelectionSetNode(selections: [
                  _i1.FragmentSpreadNode(
                      name: _i1.NameNode(value: 'PageInfoFields'),
                      directives: [])
                ])),
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
  AppRealm,
  AppRealmSearchResult,
  _i2.PageInfoFields,
  _i3.FrequencyPermissionFields,
  _i3.PaginationPermissionFields,
  _i3.LockPermissionFields,
  _i4.TextTagFields,
  _i4.RiskTagFields,
  _i4.QuickSearchTagFields
]);
