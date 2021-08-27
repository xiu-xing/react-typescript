import 'package:rime_app/graphql/queries/authorization/authorization.data.gql.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';

enum Role { simple, vip }

extension UserRole on GUserInfoData_user {
  Role getRole() {
    switch (this.role) {
      case GRole.INDIVIDUAL_FREE:
        return Role.simple;
      case GRole.INDIVIDUAL_PREMIUM:
        return Role.vip;
      case GRole.ACTIVE:
        return Role.vip;
      case GRole.BASIC:
        return Role.simple;
      case GRole.EXPIRED:
        return Role.simple;
      case GRole.TRIAL:
        return Role.vip;
      default:
        return Role.simple;
    }
  }
}
