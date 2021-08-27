// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:gql/ast.dart' as _i1;
import 'package:rime_app/graphql/types/entity/entity_fragment.ast.gql.dart'
    as _i3;
import 'package:rime_app/graphql/types/page_info/page_info.ast.gql.dart' as _i4;
import 'package:rime_app/graphql/types/permission/permission.ast.gql.dart'
    as _i5;
import 'package:rime_app/graphql/types/tags/tags_fragment.ast.gql.dart' as _i2;

const TrackerRecommendations = _i1.OperationDefinitionNode(
    type: _i1.OperationType.query,
    name: _i1.NameNode(value: 'TrackerRecommendations'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'trackerTheme')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'TrackerTheme'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'appTrackerRecommendations'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'trackerTheme'),
                value:
                    _i1.VariableNode(name: _i1.NameNode(value: 'trackerTheme')))
          ],
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
                name: _i1.NameNode(value: 'primaryName'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null),
            _i1.FieldNode(
                name: _i1.NameNode(value: 'logoURI'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null)
          ]))
    ]));
const TrackedEntityCount = _i1.OperationDefinitionNode(
    type: _i1.OperationType.query,
    name: _i1.NameNode(value: 'TrackedEntityCount'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'trackerTheme')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'TrackerTheme'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'appTrackedEntityCount'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'trackerTheme'),
                value:
                    _i1.VariableNode(name: _i1.NameNode(value: 'trackerTheme')))
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
                name: _i1.NameNode(value: 'count'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null)
          ]))
    ]));
const AppTrackerTimeline = _i1.OperationDefinitionNode(
    type: _i1.OperationType.query,
    name: _i1.NameNode(value: 'AppTrackerTimeline'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'timelineID')),
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
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'trackerTheme')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'TrackerTheme'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'filters')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'FilterInputs'), isNonNull: false),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'appTrackerTimeline'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'timelineID'),
                value:
                    _i1.VariableNode(name: _i1.NameNode(value: 'timelineID'))),
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
                name: _i1.NameNode(value: 'trackerTheme'),
                value: _i1.VariableNode(
                    name: _i1.NameNode(value: 'trackerTheme'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'filters'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'filters')))
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
                  _i1.FragmentSpreadNode(
                      name: _i1.NameNode(value: 'AppTimelineRowNodeFields'),
                      directives: [])
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
                name: _i1.NameNode(value: 'isNeedFolded'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null)
          ]))
    ]));
const AppTrackerTabs = _i1.OperationDefinitionNode(
    type: _i1.OperationType.query,
    name: _i1.NameNode(value: 'AppTrackerTabs'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'trackerTheme')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'TrackerTheme'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'appTrackerTabs'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'trackerTheme'),
                value:
                    _i1.VariableNode(name: _i1.NameNode(value: 'trackerTheme')))
          ],
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
                        name: _i1.NameNode(value: 'TimelineTab'),
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
                      name: _i1.NameNode(value: 'timelineID'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null),
                  _i1.FieldNode(
                      name: _i1.NameNode(value: 'timelineType'),
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
                                  name: _i1.NameNode(
                                      value: 'LockPermissionFields'),
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
                            ]))
                      ]))
                ]))
          ]))
    ]));
const TrackTags = _i1.OperationDefinitionNode(
    type: _i1.OperationType.query,
    name: _i1.NameNode(value: 'TrackTags'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'trackerTheme')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'TrackerTheme'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'appTrackerTags'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'trackerTheme'),
                value:
                    _i1.VariableNode(name: _i1.NameNode(value: 'trackerTheme')))
          ],
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
          ]))
    ]));
const AppTimelineRowNodeFields = _i1.FragmentDefinitionNode(
    name: _i1.NameNode(value: 'AppTimelineRowNodeFields'),
    typeCondition: _i1.TypeConditionNode(
        on: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'AppTimelineRowNode'), isNonNull: false)),
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'time'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      _i1.FieldNode(
          name: _i1.NameNode(value: 'data'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      _i1.FieldNode(
          name: _i1.NameNode(value: 'entity'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FragmentSpreadNode(
                name: _i1.NameNode(value: 'EntityFields'), directives: [])
          ])),
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
                        name: _i1.NameNode(value: 'QuickSearchTag'),
                        isNonNull: false)),
                directives: [],
                selectionSet: _i1.SelectionSetNode(selections: [
                  _i1.FragmentSpreadNode(
                      name: _i1.NameNode(value: 'QuickSearchTagFields'),
                      directives: [])
                ])),
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
                ]))
          ]))
    ]));
const TrackedEntities = _i1.OperationDefinitionNode(
    type: _i1.OperationType.query,
    name: _i1.NameNode(value: 'TrackedEntities'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'trackerTheme')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'TrackerTheme'), isNonNull: true),
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
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'trackedEntities'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'trackerTheme'),
                value: _i1.VariableNode(
                    name: _i1.NameNode(value: 'trackerTheme'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'first'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'first'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'after'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'after')))
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
                  _i1.FragmentSpreadNode(
                      name: _i1.NameNode(value: 'EntityFields'), directives: [])
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
const TrackableTheme = _i1.OperationDefinitionNode(
    type: _i1.OperationType.query,
    name: _i1.NameNode(value: 'TrackableTheme'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'entityID')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'entityType')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'EntityType'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'appTrackableTheme'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'entityID'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'entityID'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'entityType'),
                value:
                    _i1.VariableNode(name: _i1.NameNode(value: 'entityType')))
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
                name: _i1.NameNode(value: 'trackerTheme'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null),
            _i1.FieldNode(
                name: _i1.NameNode(value: 'isTracked'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null)
          ]))
    ]));
const document = _i1.DocumentNode(definitions: [
  TrackerRecommendations,
  TrackedEntityCount,
  AppTrackerTimeline,
  AppTrackerTabs,
  TrackTags,
  AppTimelineRowNodeFields,
  TrackedEntities,
  TrackableTheme,
  _i2.TextTagFields,
  _i2.RiskTagFields,
  _i2.QuickSearchTagFields,
  _i3.EntityFields,
  _i4.PageInfoFields,
  _i5.FrequencyPermissionFields,
  _i5.PaginationPermissionFields,
  _i5.LockPermissionFields
]);
