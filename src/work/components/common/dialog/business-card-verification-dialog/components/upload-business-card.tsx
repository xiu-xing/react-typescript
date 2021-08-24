import { Box, Button, CircularProgress, IconButton, TextField, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import { setCookie } from "nookies";
import React, { useCallback, useState } from "react";
import { useClient } from "urql";
import UserContainer from "../../../../../containers/userContainer";
import {
  InvitationDetailDocument,
  InvitationDetailQuery,
  InvitationDetailQueryVariables,
  useApproveInvitationMutation,
  useCreateBussinessCardApprovalTicketMutation,
  useSingleUploadMutation,
} from "../../../../../generated/graphql";
import SnackbarContainer from "../../../snackbar/snackbarContainer";
import Upload from "../../../upload/upload";
import BusinessCardVerificationDialogContainer from "../container";
import { ReactComponent as Cutover } from "./assets/cutover.svg";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      minHeight: 220,
    },
    tips: {
      color: "#666",
      fontSize: "12px",
    },
    loadingIcon: {
      width: 16,
      marginLeft: 6,
      color: "#fff",
    },
    subDescription: {
      fontSize: 16,
      lineHeight: "24px",
      color: "#737373",
      fontWeight: theme.typography.fontWeightRegular,
    },
    textHighlight: {
      color: theme.palette.primary.main,
      fontWeight: theme.typography.fontWeightMedium,
    },
    input: {
      "& .MuiInputBase-root": {
        fontSize: 14,
        lineHeight: "24px",
        maxWidth: "80%",
      },
      "& .MuiInputBase-root>input": {
        padding: "16px 14px",
      },
      "& .MuiFormHelperText-contained": {
        marginLeft: 0,
        marginTop: 8,
      },
    },
  }),
);

const UploadBusinessCard: React.FunctionComponent = () => {
  const classes = useStyles();
  const { openSnackbar } = SnackbarContainer.useContainer();
  const {
    handleNext,
    setActiveStep,
    setInvitationCode,
    invitationCode,
    isInvitation,
    setIsInvitation,
  } = BusinessCardVerificationDialogContainer.useContainer();
  const { user } = UserContainer.useContainer();
  const [files, setFiles] = useState<Array<File>>([]);
  const [fetching, setFetching] = useState(false);
  const [, executeSingleUploadMutation] = useSingleUploadMutation();
  const [, executeCreateBussinessCardApprovalTicketMutation] = useCreateBussinessCardApprovalTicketMutation();
  const client = useClient();
  const [helpText, setHelpText] = useState<string>();
  const [, executeApproveInvitation] = useApproveInvitationMutation();

  const invitationDetailQuery = useCallback(
    (code: string) => {
      return client
        .query<InvitationDetailQuery, InvitationDetailQueryVariables>(InvitationDetailDocument, {
          invitationCode: code,
        })
        .toPromise();
    },
    [client],
  );

  function onFileChange(files: File[]): void {
    setFiles(files);
  }

  const onBusinessCardSubmit = async () => {
    if (!files.length) {
      return;
    }

    setFetching(true);

    const fileUploadResult = await executeSingleUploadMutation({
      file: files[0],
    });

    if (fileUploadResult.error) {
      openSnackbar(fileUploadResult.error.message || "名片上传失败！", "error");
      setFetching(false);
      return;
    }

    if (!fileUploadResult.data) {
      openSnackbar("名片上传失败！", "error");
      setFetching(false);
      return;
    }

    const createApprovalTaskResult = await executeCreateBussinessCardApprovalTicketMutation({
      bussinessCardUrl: fileUploadResult.data.singleUpload,
    });

    if (createApprovalTaskResult.data?.createBussinessCardApprovalTicket) {
      setFetching(false);
      handleNext();
      return;
    }

    openSnackbar("审核失败，请重新提交！", "error");
    setFetching(false);
  };

  const onInvitationSubmit = async () => {
    const res = await invitationDetailQuery(invitationCode);

    if (res.error) {
      setHelpText("请输入正确的邀请码！");
      return;
    }

    const approval = await executeApproveInvitation({
      code: invitationCode,
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
      openSnackbar("加入成功", "success");

      window.location.reload();
    }

    // if (!!user?.phone) {
    //   const approval = await executeApproveInvitation({
    //     code: invitationCode,
    //   });

    //   if (approval.error) {
    //     openSnackbar("加入失败", "error");
    //     return;
    //   }

    //   if (approval.data?.approveInvitation.accessTokenString) {
    //     setCookie(null, "access_token", approval.data?.approveInvitation.accessTokenString, {
    //       maxAge: 7 * 24 * 60 * 60,
    //       path: "/",
    //     });
    //     openSnackbar("加入成功", "success");

    //     window.location.reload();
    //   }

    //   return;
    // }

    // return setActiveStep(2);
  };

  return (
    <Box className={classes.root}>
      <Box display="flex" alignItems="center" justifyContent="space-between">
        <Box display="grid" gridAutoFlow="column" gridColumnGap="4px">
          <Typography
            noWrap
            onClick={() => setIsInvitation(true)}
            className={clsx(classes.subDescription, { [classes.textHighlight]: !isInvitation })}
            style={{
              cursor: "pointer",
            }}
          >
            输入邀请码
          </Typography>
          <Typography noWrap className={classes.subDescription}>
            或
          </Typography>
          <Typography
            noWrap
            onClick={() => setIsInvitation(false)}
            className={clsx(classes.subDescription, { [classes.textHighlight]: isInvitation })}
            style={{
              cursor: "pointer",
            }}
          >
            上传名片
          </Typography>
          <Typography noWrap className={classes.subDescription}>
            完成机构认证
          </Typography>
        </Box>
        <IconButton size="small" onClick={() => setIsInvitation((prev) => !prev)}>
          <Cutover />
        </IconButton>
      </Box>
      <Box height={12} />
      {isInvitation ? (
        <>
          <Box height={12} />
          <TextField
            fullWidth
            error={!!helpText}
            helperText={helpText}
            variant="outlined"
            className={classes.input}
            placeholder="输入邀请码"
            value={invitationCode}
            onChange={(e) => setInvitationCode(e.target.value)}
          />
        </>
      ) : (
        <Upload onChange={onFileChange} acceptedFiles={["image/*"]} />
      )}
      <Box padding="32px 0">
        <Button
          color="primary"
          variant="contained"
          disableElevation
          onClick={isInvitation ? onInvitationSubmit : onBusinessCardSubmit}
          disabled={isInvitation ? !(invitationCode.length > 0) : !files.length}
        >
          下一步
          {fetching && <CircularProgress className={classes.loadingIcon} size="small" />}
        </Button>
      </Box>
    </Box>
  );
};

export default UploadBusinessCard;
