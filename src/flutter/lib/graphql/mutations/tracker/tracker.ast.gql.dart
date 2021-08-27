// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:gql/ast.dart' as _i1;

const TrackEntity = _i1.OperationDefinitionNode(
    type: _i1.OperationType.mutation,
    name: _i1.NameNode(value: 'TrackEntity'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'trackerTheme')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'TrackerTheme'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'entities')),
          type: _i1.ListTypeNode(
              type: _i1.NamedTypeNode(
                  name: _i1.NameNode(value: 'EntityInput'), isNonNull: false),
              isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'appTrackEntity'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'trackerTheme'),
                value: _i1.VariableNode(
                    name: _i1.NameNode(value: 'trackerTheme'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'entities'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'entities')))
          ],
          directives: [],
          selectionSet: null)
    ]));
const UnTrackEntityByEntityID = _i1.OperationDefinitionNode(
    type: _i1.OperationType.mutation,
    name: _i1.NameNode(value: 'UnTrackEntityByEntityID'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'entity')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'EntityInput'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'appUnTrackEntityByEntityID'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'entity'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'entity')))
          ],
          directives: [],
          selectionSet: null)
    ]));
const document =
    _i1.DocumentNode(definitions: [TrackEntity, UnTrackEntityByEntityID]);
