import 'package:rime_app/graphql/types/permission/permission.data.gql.dart';

class PermissionUtils {
  static bool getPermission<T>(T permission) {
    String runTimeType = permission.runtimeType.toString();
    if (!runTimeType.contains("permissions")) return false;
    dynamic p;
    if (runTimeType.contains("LockPermission")) {
      p = permission as GLockPermissionFields;
      return getLock(p);
    }
    if (runTimeType.contains("FrequencyPermission")) {
      p = permission as GFrequencyPermissionFields;
      return getFrequency(p);
    }
    // if (runTimeType.contains("PaginationPermission")) {
    //   p = permission as GPaginationPermissionFields;
    //   return getPagination(p);
    // }
    return false;
  }

  static bool getLock(GLockPermissionFields permission) {
    return permission.locked;
  }

  static bool getFrequency(GFrequencyPermissionFields permission) {
    return permission.remaining == 0;
  }

  static bool getPagination(GPaginationPermissionFields permission) {
    return permission.lockNextPage;
  }

  static int getPaginationLimit(
    GPaginationPermissionFields permission,
    int first,
  ) {
    if (permission.rowLimit > first) {
      return first;
    }
    return permission.rowLimit;
  }
}
