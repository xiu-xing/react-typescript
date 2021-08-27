// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:gql/ast.dart' as _i1;
import 'package:rime_app/graphql/types/page_info/page_info.ast.gql.dart' as _i2;
import 'package:rime_app/graphql/types/permission/permission.ast.gql.dart'
    as _i3;

const ArticleDetail = _i1.OperationDefinitionNode(
    type: _i1.OperationType.query,
    name: _i1.NameNode(value: 'ArticleDetail'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'id')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable:
              _i1.VariableNode(name: _i1.NameNode(value: 'articleModuleID')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'appArticleDetail'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'id'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'id'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'articleModuleID'),
                value: _i1.VariableNode(
                    name: _i1.NameNode(value: 'articleModuleID')))
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
                name: _i1.NameNode(value: 'data'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null)
          ]))
    ]));
const ArticleUri = _i1.OperationDefinitionNode(
    type: _i1.OperationType.query,
    name: _i1.NameNode(value: 'ArticleUri'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'id')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'articleType')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'ArticleType'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable:
              _i1.VariableNode(name: _i1.NameNode(value: 'articleModuleID')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'fetchType')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'FetchType'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'appArticleUri'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'id'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'id'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'articleType'),
                value:
                    _i1.VariableNode(name: _i1.NameNode(value: 'articleType'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'articleModuleID'),
                value: _i1.VariableNode(
                    name: _i1.NameNode(value: 'articleModuleID'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'fetchType'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'fetchType')))
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
                name: _i1.NameNode(value: 'resourceURI'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null),
            _i1.FieldNode(
                name: _i1.NameNode(value: 'numOfUsedRead'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null),
            _i1.FieldNode(
                name: _i1.NameNode(value: 'numOfUnusedRead'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null),
            _i1.FieldNode(
                name: _i1.NameNode(value: 'numOfUsedDownload'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null),
            _i1.FieldNode(
                name: _i1.NameNode(value: 'numOfUnusedDownload'),
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
const ArticleList = _i1.OperationDefinitionNode(
    type: _i1.OperationType.query,
    name: _i1.NameNode(value: 'ArticleList'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable:
              _i1.VariableNode(name: _i1.NameNode(value: 'articleListID')),
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
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'filters')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'FilterInputs'), isNonNull: false),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable:
              _i1.VariableNode(name: _i1.NameNode(value: 'articleModuleID')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'appArticleList'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'articleListID'),
                value: _i1.VariableNode(
                    name: _i1.NameNode(value: 'articleListID'))),
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
                name: _i1.NameNode(value: 'filters'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'filters'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'articleModuleID'),
                value: _i1.VariableNode(
                    name: _i1.NameNode(value: 'articleModuleID')))
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
                      name: _i1.NameNode(value: 'articleID'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null),
                  _i1.FieldNode(
                      name: _i1.NameNode(value: 'articleType'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null),
                  _i1.FieldNode(
                      name: _i1.NameNode(value: 'data'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null)
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
const ArticleTabs = _i1.OperationDefinitionNode(
    type: _i1.OperationType.query,
    name: _i1.NameNode(value: 'ArticleTabs'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable:
              _i1.VariableNode(name: _i1.NameNode(value: 'articleModuleID')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'appArticleTabs'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'articleModuleID'),
                value: _i1.VariableNode(
                    name: _i1.NameNode(value: 'articleModuleID')))
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.InlineFragmentNode(
                typeCondition: _i1.TypeConditionNode(
                    on: _i1.NamedTypeNode(
                        name: _i1.NameNode(value: 'ArticleTab'),
                        isNonNull: false)),
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
                      name: _i1.NameNode(value: 'modifier'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: _i1.SelectionSetNode(selections: [
                        _i1.FieldNode(
                            name: _i1.NameNode(value: 'hasUpdatedContent'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null),
                        _i1.FieldNode(
                            name: _i1.NameNode(value: 'isNew'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null)
                      ])),
                  _i1.FieldNode(
                      name: _i1.NameNode(value: 'filters'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: _i1.SelectionSetNode(selections: [
                        _i1.InlineFragmentNode(
                            typeCondition: _i1.TypeConditionNode(
                                on: _i1.NamedTypeNode(
                                    name: _i1.NameNode(value: 'SelectorFilter'),
                                    isNonNull: false)),
                            directives: [],
                            selectionSet: _i1.SelectionSetNode(selections: [
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'id'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'icon'),
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
                                  name: _i1.NameNode(value: 'operator'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'multiple'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'options'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet:
                                      _i1.SelectionSetNode(selections: [
                                    _i1.FieldNode(
                                        name: _i1.NameNode(value: 'key'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null),
                                    _i1.FieldNode(
                                        name: _i1.NameNode(value: 'value'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null)
                                  ])),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'defaultValue'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'split'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null)
                            ])),
                        _i1.InlineFragmentNode(
                            typeCondition: _i1.TypeConditionNode(
                                on: _i1.NamedTypeNode(
                                    name: _i1.NameNode(value: 'DayFilter'),
                                    isNonNull: false)),
                            directives: [],
                            selectionSet: _i1.SelectionSetNode(selections: [
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'id'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'icon'),
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
                                  name: _i1.NameNode(value: 'min'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'max'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'operator'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null)
                            ])),
                        _i1.InlineFragmentNode(
                            typeCondition: _i1.TypeConditionNode(
                                on: _i1.NamedTypeNode(
                                    name: _i1.NameNode(value: 'YearFilter'),
                                    isNonNull: false)),
                            directives: [],
                            selectionSet: _i1.SelectionSetNode(selections: [
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'id'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'icon'),
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
                                  name: _i1.NameNode(value: 'min'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'max'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'operator'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null)
                            ])),
                        _i1.InlineFragmentNode(
                            typeCondition: _i1.TypeConditionNode(
                                on: _i1.NamedTypeNode(
                                    name: _i1.NameNode(value: 'MonthFilter'),
                                    isNonNull: false)),
                            directives: [],
                            selectionSet: _i1.SelectionSetNode(selections: [
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'id'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'icon'),
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
                                  name: _i1.NameNode(value: 'min'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'max'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'operator'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null)
                            ])),
                        _i1.InlineFragmentNode(
                            typeCondition: _i1.TypeConditionNode(
                                on: _i1.NamedTypeNode(
                                    name: _i1.NameNode(value: 'CheckboxFilter'),
                                    isNonNull: false)),
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
                                  name: _i1.NameNode(value: 'icon'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'options'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet:
                                      _i1.SelectionSetNode(selections: [
                                    _i1.FieldNode(
                                        name: _i1.NameNode(value: 'key'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null),
                                    _i1.FieldNode(
                                        name: _i1.NameNode(value: 'value'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null)
                                  ])),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'operator'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null)
                            ])),
                        _i1.InlineFragmentNode(
                            typeCondition: _i1.TypeConditionNode(
                                on: _i1.NamedTypeNode(
                                    name: _i1.NameNode(
                                        value: 'NestedCheckboxFilter'),
                                    isNonNull: false)),
                            directives: [],
                            selectionSet: _i1.SelectionSetNode(selections: [
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'id'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'icon'),
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
                                  name: _i1.NameNode(value: 'operator'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null)
                            ])),
                        _i1.InlineFragmentNode(
                            typeCondition: _i1.TypeConditionNode(
                                on: _i1.NamedTypeNode(
                                    name:
                                        _i1.NameNode(value: 'DateRangeFilter'),
                                    isNonNull: false)),
                            directives: [],
                            selectionSet: _i1.SelectionSetNode(selections: [
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'id'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'icon'),
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
                                  name: _i1.NameNode(value: 'min'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'max'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'precise'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'defaultEndDate'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'defaultStartDate'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null)
                            ])),
                        _i1.InlineFragmentNode(
                            typeCondition: _i1.TypeConditionNode(
                                on: _i1.NamedTypeNode(
                                    name: _i1.NameNode(
                                        value: 'DateRangeSelectorFilter'),
                                    isNonNull: false)),
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
                                  name: _i1.NameNode(value: 'options'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet:
                                      _i1.SelectionSetNode(selections: [
                                    _i1.FieldNode(
                                        name: _i1.NameNode(value: 'key'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null),
                                    _i1.FieldNode(
                                        name: _i1.NameNode(value: 'value'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null)
                                  ])),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'precise'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'min'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'max'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null)
                            ])),
                        _i1.InlineFragmentNode(
                            typeCondition: _i1.TypeConditionNode(
                                on: _i1.NamedTypeNode(
                                    name:
                                        _i1.NameNode(value: 'SuggestionFilter'),
                                    isNonNull: false)),
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
                                  name: _i1.NameNode(value: 'suggestionID'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'placeholder'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null)
                            ]))
                      ])),
                  _i1.FieldNode(
                      name: _i1.NameNode(value: 'permissions'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: _i1.SelectionSetNode(selections: [
                        _i1.InlineFragmentNode(
                            typeCondition: _i1.TypeConditionNode(
                                on: _i1.NamedTypeNode(
                                    name: _i1.NameNode(value: 'LockPermission'),
                                    isNonNull: false)),
                            directives: [],
                            selectionSet: _i1.SelectionSetNode(selections: [
                              _i1.FragmentSpreadNode(
                                  name: _i1.NameNode(
                                      value: 'LockPermissionFields'),
                                  directives: [])
                            ])),
                        _i1.InlineFragmentNode(
                            typeCondition: _i1.TypeConditionNode(
                                on: _i1.NamedTypeNode(
                                    name: _i1.NameNode(
                                        value: 'FrequencyPermission'),
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
                                    name: _i1.NameNode(
                                        value: 'PaginationPermission'),
                                    isNonNull: false)),
                            directives: [],
                            selectionSet: _i1.SelectionSetNode(selections: [
                              _i1.FragmentSpreadNode(
                                  name: _i1.NameNode(
                                      value: 'PaginationPermissionFields'),
                                  directives: [])
                            ]))
                      ])),
                  _i1.FieldNode(
                      name: _i1.NameNode(value: 'articleListID'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null),
                  _i1.FieldNode(
                      name: _i1.NameNode(value: 'articleType'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null)
                ]))
          ]))
    ]));
const document = _i1.DocumentNode(definitions: [
  ArticleDetail,
  ArticleUri,
  ArticleList,
  ArticleTabs,
  _i2.PageInfoFields,
  _i3.FrequencyPermissionFields,
  _i3.PaginationPermissionFields,
  _i3.LockPermissionFields
]);
