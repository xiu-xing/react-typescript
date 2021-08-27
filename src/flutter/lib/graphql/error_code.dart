class ApiError {
  // ErrCodeSystemError 系统错误
  static const ErrCodeSystemError = "100000";

  // ErrCodeDataBaseError 数据库错误
  static const ErrCodeDataBaseError = "100001";

  // ErrCodeTokenGeneratorError  token 生成器错误
  static const ErrCodeTokenGeneratorError = "100002";

  // ErrCodeIllegalOperation 非法操作 => 无效令牌
  static const ErrCodeIllegalOperation = "101000";

  // ErrCodeAccountExistence 账号存在
  static const ErrCodeAccountExistence = "109100";

  // ErrCodeAccountNotExistence 账号不存在
  static const ErrCodeAccountNotExistence = "109101";

  // ErrCodeAccountFormatError 账号格式错误
  static const ErrCodeAccountFormatError = "109102";

  // ErrCodeAccountInputNULL 账号输入为空
  static const ErrCodeAccountInputNULL = "109103";

  // ErrorCodeWrongAccountOrPassword 账号或密码错误
  static const ErrorCodeWrongAccountOrPassword = "109104";

  // ErrorCodeAccountNotActivated 账号未激活
  static const ErrorCodeAccountNotActivated = "109105";

  // ErrorCodeAccountHasActivated 账号已激活
  static const ErrorCodeAccountHasActivated = "109106";

  // ErrorCodeWrongAccountOrInvitationCode 账号或邀请码错误
  static const ErrorCodeWrongAccountOrInvitationCode = "109107";

  // ErrorCodeWrongNoPassword 密码为空
  static const ErrorCodeWrongNoPassword = "109108";

  // ErrorCodeAccountLocked 账号被锁定
  static const ErrorCodeAccountLocked = "109109";

  // ErrorCodeWrongVerificationCode 验证码错误
  static const ErrorCodeWrongVerificationCode = "109201";

  // ErrorCodeSendingVerificationCodeFailed 验证码发送失败
  static const ErrorCodeSendingVerificationCodeFailed = "109202";

  // ErrorCodeSendingVerificationCodeFrequencyLimit 手机号接收超过频率限制
  static const ErrorCodeSendingVerificationCodeFrequencyLimit = "109203";

  // ErrorCodeVerificationCodeExpired  验证码过期
  static const ErrorCodeVerificationCodeExpired = "109204";

  // ErrorCodeReservedEmailNotMatch 预留邮箱不匹配
  static const ErrorCodeReservedEmailNotMatch = "109205";

  // ErrorCodeReservedPhoneNotMatch 预留手机不匹配
  static const ErrorCodeReservedPhoneNotMatch = "109206";

  // ErrorCodeNotReview 信息审核中
  static const ErrorCodeNotReview = "109301";

  // ErrorCodeReviewPassed 信息已审核
  static const ErrorCodeReviewPassed = "109302";

  // ErrorCodeTheNumberOfRequestsOutOfCount 今日单个资源访问次数已达上限
  static const ErrorCodeTheNumberOfRequestsOutOfCount = "109401";

  // ErrorCodeTheNumberOfRequestsOutOfTotalCount 今日资源访问总次数已达上限
  static const ErrorCodeTheNumberOfRequestsOutOfTotalCount = "109402";

  // ErrorCodeResourceCreateTemplatesLimit 创建搜索模板已达上限
  static const ErrorCodeResourceCreateTemplatesLimit = "109403";

  // ErrorCodeResourceRecommendLimit 查看智能推荐权限不足
  static const ErrorCodeResourceRecommendLimit = "109404";

  // ErrorCodeResourceFollowEntitiesCountLimit 我的关注已达上限
  static const ErrorCodeResourceFollowEntitiesCountLimit = "109405";

  // ErrorCodeResourceFilterLimit 条件筛选权限不足
  static const ErrorCodeResourceFilterLimit = "109406";

  // ErrorCodeResourceTableRowLimit 查看更多分页数据权限不足
  static const ErrorCodeResourceTableRowLimit = "109407";

  // ErrorCodeResourceAccessLimit 权限不足
  static const ErrorCodeResourceAccessLimit = "109408";

  // ErrorCodeResourceDeleteUserLimit 删除用户权限不足
  static const ErrorCodeResourceDeleteUserLimit = "109409";

  // ErrorCodeResourceInviteUserLimit 邀请用户权限不足
  static const ErrorCodeResourceInviteUserLimit = "109410";

  final String code;
  final String message;

  ApiError(this.code, this.message);
}
