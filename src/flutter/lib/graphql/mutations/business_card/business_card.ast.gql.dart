// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:gql/ast.dart' as _i1;

const CreateBusinessCardApprovalTicket = _i1.OperationDefinitionNode(
    type: _i1.OperationType.mutation,
    name: _i1.NameNode(value: 'CreateBusinessCardApprovalTicket'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable:
              _i1.VariableNode(name: _i1.NameNode(value: 'businessCardUrl')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'createBussinessCardApprovalTicket'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'bussinessCardUrl'),
                value: _i1.VariableNode(
                    name: _i1.NameNode(value: 'businessCardUrl')))
          ],
          directives: [],
          selectionSet: null)
    ]));
const CreateVerificationCode = _i1.OperationDefinitionNode(
    type: _i1.OperationType.mutation,
    name: _i1.NameNode(value: 'CreateVerificationCode'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'contactInfo')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'contactType')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'ContactType'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'createVerificationCode'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'contactInfo'),
                value:
                    _i1.VariableNode(name: _i1.NameNode(value: 'contactInfo'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'contactType'),
                value:
                    _i1.VariableNode(name: _i1.NameNode(value: 'contactType')))
          ],
          directives: [],
          selectionSet: null)
    ]));
const VerifyCodeAndApproveJoinRequest = _i1.OperationDefinitionNode(
    type: _i1.OperationType.mutation,
    name: _i1.NameNode(value: 'VerifyCodeAndApproveJoinRequest'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'input')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'VerifyCodeInput'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'verifyCodeAndApproveJoinRequest'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'input'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'input')))
          ],
          directives: [],
          selectionSet: null)
    ]));
const CreateVerificationCodeByJoinRequest = _i1.OperationDefinitionNode(
    type: _i1.OperationType.mutation,
    name: _i1.NameNode(value: 'CreateVerificationCodeByJoinRequest'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'contactType')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'ContactType'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'createVerificationCodeByJoinRequest'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'contactType'),
                value:
                    _i1.VariableNode(name: _i1.NameNode(value: 'contactType')))
          ],
          directives: [],
          selectionSet: null)
    ]));
const document = _i1.DocumentNode(definitions: [
  CreateBusinessCardApprovalTicket,
  CreateVerificationCode,
  VerifyCodeAndApproveJoinRequest,
  CreateVerificationCodeByJoinRequest
]);
