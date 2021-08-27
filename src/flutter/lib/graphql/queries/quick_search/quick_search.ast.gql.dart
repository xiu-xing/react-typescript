// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:gql/ast.dart' as _i1;
import 'package:rime_app/graphql/types/entity/entity_fragment.ast.gql.dart'
    as _i6;
import 'package:rime_app/graphql/types/page_info/page_info.ast.gql.dart' as _i2;
import 'package:rime_app/graphql/types/permission/permission.ast.gql.dart'
    as _i3;
import 'package:rime_app/graphql/types/quick_search/quick_search_fragment.ast.gql.dart'
    as _i4;
import 'package:rime_app/graphql/types/tags/tags_fragment.ast.gql.dart' as _i5;

const QuickSearchTrending = _i1.OperationDefinitionNode(
    type: _i1.OperationType.query,
    name: _i1.NameNode(value: 'QuickSearchTrending'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'first')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: false),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'last')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: false),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'after')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'before')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'quickSearchTrending'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'first'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'first'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'last'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'last'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'after'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'after'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'before'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'before'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'platform'),
                value: _i1.EnumValueNode(
                    name: _i1.NameNode(value: 'PLATFORM_MOBILE')))
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
                name: _i1.NameNode(value: '__typename'),
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
                              name: _i1.NameNode(value: 'PaginationPermission'),
                              isNonNull: false)),
                      directives: [],
                      selectionSet: _i1.SelectionSetNode(selections: [
                        _i1.FragmentSpreadNode(
                            name: _i1.NameNode(
                                value: 'PaginationPermissionFields'),
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
                      ]))
                ])),
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
                      name: _i1.NameNode(value: '__typename'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null),
                  _i1.InlineFragmentNode(
                      typeCondition: _i1.TypeConditionNode(
                          on: _i1.NamedTypeNode(
                              name:
                                  _i1.NameNode(value: 'QuickSearchEntityNode'),
                              isNonNull: false)),
                      directives: [],
                      selectionSet: _i1.SelectionSetNode(selections: [
                        _i1.FragmentSpreadNode(
                            name: _i1.NameNode(
                                value: 'QuickSearchEntityNodeFields'),
                            directives: [])
                      ])),
                  _i1.InlineFragmentNode(
                      typeCondition: _i1.TypeConditionNode(
                          on: _i1.NamedTypeNode(
                              name: _i1.NameNode(
                                  value: 'QuickSearchInfoFlowNode'),
                              isNonNull: false)),
                      directives: [],
                      selectionSet: _i1.SelectionSetNode(selections: [
                        _i1.FragmentSpreadNode(
                            name: _i1.NameNode(
                                value: 'QuickSearchInfoFlowNodeFields'),
                            directives: [])
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
                ]))
          ]))
    ]));
const QuickSearchLatestView = _i1.OperationDefinitionNode(
    type: _i1.OperationType.query,
    name: _i1.NameNode(value: 'QuickSearchLatestView'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'first')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: false),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'last')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: false),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'after')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'before')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'quickSearchLatestView'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'first'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'first'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'last'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'last'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'after'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'after'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'before'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'before'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'platform'),
                value: _i1.EnumValueNode(
                    name: _i1.NameNode(value: 'PLATFORM_MOBILE')))
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
                name: _i1.NameNode(value: '__typename'),
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
                              name: _i1.NameNode(value: 'PaginationPermission'),
                              isNonNull: false)),
                      directives: [],
                      selectionSet: _i1.SelectionSetNode(selections: [
                        _i1.FragmentSpreadNode(
                            name: _i1.NameNode(
                                value: 'PaginationPermissionFields'),
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
                      ]))
                ])),
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
                      name: _i1.NameNode(value: '__typename'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null),
                  _i1.InlineFragmentNode(
                      typeCondition: _i1.TypeConditionNode(
                          on: _i1.NamedTypeNode(
                              name:
                                  _i1.NameNode(value: 'QuickSearchEntityNode'),
                              isNonNull: false)),
                      directives: [],
                      selectionSet: _i1.SelectionSetNode(selections: [
                        _i1.FragmentSpreadNode(
                            name: _i1.NameNode(
                                value: 'QuickSearchEntityNodeFields'),
                            directives: [])
                      ])),
                  _i1.InlineFragmentNode(
                      typeCondition: _i1.TypeConditionNode(
                          on: _i1.NamedTypeNode(
                              name: _i1.NameNode(
                                  value: 'QuickSearchInfoFlowNode'),
                              isNonNull: false)),
                      directives: [],
                      selectionSet: _i1.SelectionSetNode(selections: [
                        _i1.FragmentSpreadNode(
                            name: _i1.NameNode(
                                value: 'QuickSearchInfoFlowNodeFields'),
                            directives: [])
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
                ]))
          ]))
    ]));
const QuickSearchTabs = _i1.OperationDefinitionNode(
    type: _i1.OperationType.query,
    name: _i1.NameNode(value: 'QuickSearchTabs'),
    variableDefinitions: [],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'quickSearchTabs'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
                name: _i1.NameNode(value: 'title'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null),
            _i1.FieldNode(
                name: _i1.NameNode(value: 'searchType'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null),
            _i1.FieldNode(
                name: _i1.NameNode(value: 'lockPermission'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: _i1.SelectionSetNode(selections: [
                  _i1.FieldNode(
                      name: _i1.NameNode(value: 'locked'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null)
                ]))
          ]))
    ]));
const QuickSearch = _i1.OperationDefinitionNode(
    type: _i1.OperationType.query,
    name: _i1.NameNode(value: 'QuickSearch'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'query')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'searchType')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'first')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: false),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'last')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: false),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'after')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'before')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'quickSearch'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'query'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'query'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'searchType'),
                value:
                    _i1.VariableNode(name: _i1.NameNode(value: 'searchType'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'first'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'first'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'last'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'last'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'after'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'after'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'before'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'before'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'platform'),
                value: _i1.EnumValueNode(
                    name: _i1.NameNode(value: 'PLATFORM_MOBILE')))
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
                              name: _i1.NameNode(value: 'PaginationPermission'),
                              isNonNull: false)),
                      directives: [],
                      selectionSet: _i1.SelectionSetNode(selections: [
                        _i1.FragmentSpreadNode(
                            name: _i1.NameNode(
                                value: 'PaginationPermissionFields'),
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
                      ]))
                ])),
            _i1.FieldNode(
                name: _i1.NameNode(value: 'nodes'),
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
                              name:
                                  _i1.NameNode(value: 'QuickSearchEntityNode'),
                              isNonNull: false)),
                      directives: [],
                      selectionSet: _i1.SelectionSetNode(selections: [
                        _i1.FragmentSpreadNode(
                            name: _i1.NameNode(
                                value: 'QuickSearchEntityNodeFields'),
                            directives: [])
                      ])),
                  _i1.InlineFragmentNode(
                      typeCondition: _i1.TypeConditionNode(
                          on: _i1.NamedTypeNode(
                              name: _i1.NameNode(
                                  value: 'QuickSearchInfoFlowNode'),
                              isNonNull: false)),
                      directives: [],
                      selectionSet: _i1.SelectionSetNode(selections: [
                        _i1.FragmentSpreadNode(
                            name: _i1.NameNode(
                                value: 'QuickSearchInfoFlowNodeFields'),
                            directives: [])
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
                ]))
          ]))
    ]));
const IncrementEntityClickThrough = _i1.OperationDefinitionNode(
    type: _i1.OperationType.query,
    name: _i1.NameNode(value: 'IncrementEntityClickThrough'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'nodeId')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'searchType')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'incrementEntityClickThrough'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'nodeId'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'nodeId'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'searchType'),
                value:
                    _i1.VariableNode(name: _i1.NameNode(value: 'searchType')))
          ],
          directives: [],
          selectionSet: null)
    ]));
const document = _i1.DocumentNode(definitions: [
  QuickSearchTrending,
  QuickSearchLatestView,
  QuickSearchTabs,
  QuickSearch,
  IncrementEntityClickThrough,
  _i2.PageInfoFields,
  _i3.FrequencyPermissionFields,
  _i3.PaginationPermissionFields,
  _i3.LockPermissionFields,
  _i4.QuickSearchEntityNodeFields,
  _i4.QuickSearchInfoFlowNodeFields,
  _i5.TextTagFields,
  _i5.RiskTagFields,
  _i5.QuickSearchTagFields,
  _i6.EntityFields
]);
