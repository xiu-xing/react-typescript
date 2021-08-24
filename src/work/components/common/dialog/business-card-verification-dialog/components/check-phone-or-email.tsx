import { Box, Button, TextField, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { setCookie } from "nookies";
import React, { ChangeEvent, useCallback, useState } from "react";
import { useClient } from "urql";
import {
  ContactType,
  IsRegisteredContactDocument,
  IsRegisteredContactQuery,
  IsRegisteredContactQueryVariables,
  useApproveInvitationMutation,
  useCreateVerificationCodeByJoinRequestMutation,
  useCreateVerificationCodeMutation,
  useUpdateAccessTokenMutation,
  useVerifyCodeAndApproveJoinRequestMutation,
  useVerifyCodeMutation,
} from "../../../../../generated/graphql";
import { REGEX } from "../../../../../utils/regex";
import EndAdornment, { ButtonType } from "../../../input-end-adornment/end-adornment";
import SnackbarContainer from "../../../snackbar/snackbarContainer";
import BusinessCardVerificationDialogContainer from "../container";
import checkingFail from "./assets/checking-fail.webp";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    title: {
      color: "#333",
      fontSize: "18px",
    },
    tips: {
      color: "#666",
      fontSize: "12px",
    },
    textFiled: {
      marginTop: "28px",
      marginBottom: "34px",
    },
    verifyArea: {
      padding: "16px 0",
      display: "flex",
      justifyContent: "center",
      flexDirection: "column",
    },
    verifyCode: {
      fontSize: "12px",
    },
    subDescription: {
      margin: "4px 0 16px 0",
      fontSize: 16,
      lineHeight: "24px",
      color: "#737373",
      fontWeight: 400,
    },
    retry: {
      // marginLeft: 4,
      color: theme.palette.primary.main,
      cursor: "pointer",
      fontWeight: 500,
    },
    fail: {
      height: 220,
      width: 416,
      backgroundRepeat: "no-repeat",
      backgroundSize: "contain",
      backgroundImage: `url(${checkingFail})`,
    },
  }),
);

const CheckPhoneOrEmail: React.FunctionComponent = () => {
  const classes = useStyles();
  const { openSnackbar } = SnackbarContainer.useContainer();
  const {
    bussinessCardDetail,
    setActiveStep,
    onClose,
    isInvitation,
    invitationCode,
  } = BusinessCardVerificationDialogContainer.useContainer();

  const [verificationCode, setVerificationCode] = useState("");
  const [token, setToken] = useState("");
  const [contactInfo, setContactInfo] = useState<string>(() => {
    if (isInvitation) return "";

    return bussinessCardDetail?.phone as string;
  });

  const [formErrors, setFormErrors] = useState<Record<string, string>>(Object.create(null));

  const [, executeCreateVerificationCodeByJoinRequestMutation] = useCreateVerificationCodeByJoinRequestMutation();
  const [, executeCreateVerificationCode] = useCreateVerificationCodeMutation();
  const [, executeVerifyCodeAndApproveJoinRequest] = useVerifyCodeAndApproveJoinRequestMutation();
  const [, executeVerifyCode] = useVerifyCodeMutation();
  const [, executeApproveInvitation] = useApproveInvitationMutation();
  const [, executeUpdateAccessToken] = useUpdateAccessTokenMutation();

  const client = useClient();

  const isRegisteredContact = useCallback(
    (args: IsRegisteredContactQueryVariables) => {
      return client
        .query<IsRegisteredContactQuery, IsRegisteredContactQueryVariables>(IsRegisteredContactDocument, args)
        .toPromise();
    },
    [client],
  );

  const validatePhone = useCallback(async (): Promise<Record<string, string>> => {
    if (!REGEX.phone.test(contactInfo)) {
      return {
        "phone": "请输入合法的手机号",
      };
    }

    const res = await isRegisteredContact({
      contactInfo: contactInfo,
      contactType: ContactType.Phone,
    });

    if (res.data?.isRegisteredContact) {
      return {
        "phone": "手机号被占用",
      };
    }

    return Object.create(null);
  }, [contactInfo, isRegisteredContact]);

  const onSendVerificationCodeClick = useCallback(
    async (callback?: (success: boolean) => void) => {
      const formErrors = await validatePhone();

      setFormErrors(formErrors);

      if (!("phone" in formErrors)) {
        if (isInvitation) {
          const res = await executeCreateVerificationCode({
            contactInfo: contactInfo,
            contactType: ContactType.Phone,
          });

          if (res.error) {
            callback?.(false);
            openSnackbar("验证码发送失败，请稍后再试！", "warning");
            return;
          }
          callback?.(true);
          setToken(res.data?.createVerificationCode as string);
        } else {
          const res = await executeCreateVerificationCodeByJoinRequestMutation({
            contactType: ContactType.Phone,
          });

          if (res.error) {
            callback?.(false);
            openSnackbar("验证码发送失败，请稍后再试！", "warning");
            return;
          }

          callback?.(true);
          setToken(res.data?.createVerificationCodeByJoinRequest as string);
        }
      } else {
        callback?.(false);
      }
    },
    [isInvitation, contactInfo, setToken, executeCreateVerificationCodeByJoinRequestMutation, validatePhone],
  );

  const onVerificationCodeChange = (event: ChangeEvent<HTMLInputElement>) => {
    const value = event.target.value.trim();
    setVerificationCode(value);
  };

  const onBusinessCardSubmit = async () => {
    if (contactInfo && verificationCode) {
      const verificationResult = await executeVerifyCodeAndApproveJoinRequest({
        input: {
          contactInfo: contactInfo,
          contactType: ContactType.Phone,
          verificationCode: verificationCode,
          tokenString: token,
        },
      });

      if (verificationResult.error) {
        if (verificationResult.error?.message.includes("验证码错误")) {
          openSnackbar(`验证码错误！`, "error");
          return;
        }
        if (verificationResult.error?.message.includes("验证码过期")) {
          openSnackbar(`验证码过期!`, "error");
          return;
        }
        if (verificationResult.error?.message.includes("频率限制")) {
          openSnackbar(`手机号接收超过频率限制!`, "error");
          return;
        }
        openSnackbar(`验证失败，请稍后再试！`, "warning");
        return;
      }
      openSnackbar(`验证成功！`, "success");
      onClose?.();

      const updateTokenResult = await executeUpdateAccessToken();
      if (updateTokenResult.data) {
        const token = updateTokenResult.data.updateAccessToken;
        token &&
          setCookie(null, "access_token", token, {
            maxAge: 7 * 24 * 60 * 60,
            path: "/",
          });
        window.location.reload();
      }
    }
  };

  const onInvitationSubmit = async () => {
    if (!!verificationCode) {
      const res = await executeVerifyCode({
        input: {
          contactInfo: contactInfo,
          contactType: ContactType.Phone,
          verificationCode: verificationCode,
          tokenString: token,
        },
      });

      if (res.error) {
        if (res.error?.message.includes("验证码错误")) {
          openSnackbar(`验证码错误！`, "error");
          return;
        }
        if (res.error?.message.includes("验证码过期")) {
          openSnackbar(`验证码过期!`, "error");
          return;
        }
        if (res.error?.message.includes("频率限制")) {
          openSnackbar(`手机号接收超过频率限制!`, "error");
          return;
        }
        openSnackbar(`验证失败，请稍后再试！`, "warning");
        return;
      }

      const approval = await executeApproveInvitation({
        code: invitationCode,
        phone: contactInfo,
      });

      if (approval.error) {
        openSnackbar("加入失败", "error");
        return;
      }

      if (approval.data?.approveInvitation.accessTokenString) {
        setCookie(null, "access_token", approval.data?.approveInvitation.accessTokenString, {
          maxAge: 7 * 24 * 60 * 60,
          path: "/",
        });

        onClose?.();
        openSnackbar("加入成功", "success");

        window.location.reload();
      } else {
        openSnackbar("加入失败", "error");
      }
    }
  };

  const handleContactInfoChange = (e: ChangeEvent<HTMLInputElement>) => {
    setContactInfo(e.target.value);
  };

  if (!isInvitation) {
    if (!bussinessCardDetail?.success || !bussinessCardDetail.phone) {
      return (
        <>
          <Typography className={classes.subDescription}>
            很抱歉，您的机构审核不通过
            <span className={classes.retry} style={{ marginLeft: 12 }} onClick={(): void => setActiveStep(0)}>
              请重新上传
            </span>
          </Typography>
          <Box className={classes.fail} />
          <Typography
            style={{
              fontSize: 16,
              color: "#333",
              fontWeight: 500,
              marginTop: 24,
            }}
          >
            不通过原因: {bussinessCardDetail?.msg}
          </Typography>
          <Box height={32} />
        </>
      );
    }

    if (!bussinessCardDetail || (!bussinessCardDetail.phone && !bussinessCardDetail.email)) {
      return (
        <Box style={{ height: "220px", display: "flex", alignItems: "center" }}>
          <Typography>
            名片信息审核不通过，
            <span className={classes.retry} onClick={(): void => setActiveStep(0)}>
              重新申请
            </span>
          </Typography>
        </Box>
      );
    }
  }

  return (
    <Box className={classes.root}>
      <Box>
        <Typography className={classes.subDescription}>请验证手机完成认证，解锁更多功能</Typography>
        <Box className={classes.verifyArea}>
          <TextField
            autoFocus={isInvitation}
            fullWidth
            label="手机"
            error={"phone" in formErrors}
            helperText={formErrors["phone"]}
            value={contactInfo}
            disabled={!isInvitation}
            onChange={handleContactInfoChange}
          />
          <TextField
            autoFocus={!isInvitation}
            fullWidth
            label="验证码"
            error={verificationCode == "" ? false : !REGEX.verificationCode.test(verificationCode)}
            helperText={
              verificationCode === "" ? "" : REGEX.verificationCode.test(verificationCode) ? "" : "请输入合法验证码"
            }
            className={classes.textFiled}
            value={verificationCode}
            InputProps={{
              endAdornment: (
                <EndAdornment
                  buttonType={ButtonType.VERIFICATION_CODE}
                  disabled={false}
                  sendVerificationCode={onSendVerificationCodeClick}
                />
              ),
            }}
            onChange={onVerificationCodeChange}
          />
        </Box>
      </Box>
      <Button
        color="primary"
        variant="contained"
        disableElevation
        onClick={isInvitation ? onInvitationSubmit : onBusinessCardSubmit}
        disabled={!verificationCode}
      >
        完成
      </Button>
      <Box height={32} />
    </Box>
  );
};

export default CheckPhoneOrEmail;
