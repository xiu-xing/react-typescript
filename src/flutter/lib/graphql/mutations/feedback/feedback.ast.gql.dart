// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:gql/ast.dart' as _i1;

const GiveFeedback = _i1.OperationDefinitionNode(
    type: _i1.OperationType.mutation,
    name: _i1.NameNode(value: 'GiveFeedback'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable:
              _i1.VariableNode(name: _i1.NameNode(value: 'problemDescription')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'phoneNumber')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'images')),
          type: _i1.ListTypeNode(
              type: _i1.NamedTypeNode(
                  name: _i1.NameNode(value: 'String'), isNonNull: true),
              isNonNull: false),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'giveFeedback'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'problemDescription'),
                value: _i1.VariableNode(
                    name: _i1.NameNode(value: 'problemDescription'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'phoneNumber'),
                value:
                    _i1.VariableNode(name: _i1.NameNode(value: 'phoneNumber'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'images'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'images')))
          ],
          directives: [],
          selectionSet: null)
    ]));
const document = _i1.DocumentNode(definitions: [GiveFeedback]);
