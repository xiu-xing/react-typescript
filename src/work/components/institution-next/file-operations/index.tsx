import { Button, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import EditIcon from "@material-ui/icons/Edit";
import { Download } from "mdi-material-ui";
import React, { useMemo, useState } from "react";
import { useClient } from "urql";
import {
  CreateTicketDocument,
  CreateTicketMutation,
  CreateTicketMutationVariables,
  TrealmCancelDocument,
  TrealmCancelMutation,
  TrealmCancelMutationVariables,
  TrealmFeedbackMessageDocument,
  TrealmFeedbackMessageQuery,
  TrealmFeedbackMessageQueryVariables,
  TrealmImportResponse,
  TrealmImportType,
  TrealmSubmitDocument,
  TrealmSubmitMutation,
  TrealmSubmitMutationVariables,
} from "../../../generated/graphql";
import SnackbarContainer from "../../common/snackbar/snackbarContainer";
import { FileUpload, UploadHistory as UploadHistoryIcon } from "../assets";
import CommonDialog from "../common-dialog";
import ChoseFileType from "./chose-file-type";
import FeedBack from "./feed-back";
import UploadFile from "./upload-file";
import UploadHistory from "./upload-histoty";
import UploadResult from "./upload-result";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    buttonIcon: {
      color: theme.palette.primary.main,
      fontSize: 24,
      marginRight: 4,
    },
    button: {
      color: theme.palette.primary.main,
      marginRight: 24,
      cursor: "pointer",
      display: "flex",
      alignItems: "center",
    },
    buttonText: {
      fontSize: 14,
      fontWeight: 500,
    },
    icon: {
      fontSize: 16,
      marginRight: 4,
    },
  }),
);

export enum FileUploadType {
  ChoseFileType,
  UploadFile,
  MatchResult,
}

const FileOperations: React.FunctionComponent = () => {
  const classes = useStyles();
  const client = useClient();
  const { openSnackbar } = SnackbarContainer.useContainer();

  const [step, setStep] = useState<FileUploadType>(FileUploadType.ChoseFileType);
  const [showUploadDialog, setShowUploadDialog] = useState(false);
  const [showHistoryDialog, setShowHistoryDialog] = useState(false);
  const [showFeedBackDialog, setShowFeedBackDialog] = useState(false);
  const [phone, setPhone] = useState<string>();
  const [error, setError] = useState(true);
  const [taskId, setTaskId] = useState<string>();
  const [fileType, setFileType] = useState<TrealmImportType>();
  const [uploadResult, setUploadResult] = useState<TrealmImportResponse>();

  function innitState() {
    setShowUploadDialog(false);
    setTaskId(undefined);
    setFileType(undefined);
    setUploadResult(undefined);
    setPhone(undefined);
    setError(true);
    setStep(FileUploadType.ChoseFileType);
  }

  function closeFeedBackDialog() {
    setShowFeedBackDialog(false);
  }

  async function confirmUpload() {
    if (!taskId) return openSnackbar("上传失败！", "error");
    const res = await client
      .mutation<TrealmSubmitMutation, TrealmSubmitMutationVariables>(TrealmSubmitDocument, {
        taskID: taskId,
      })
      .toPromise();
    if (res.error) {
      return openSnackbar("上传失败！", "error");
    }
    openSnackbar("已提交，导入数据需要15分钟，请稍后返回页面查看", "success");
  }

  const prefixButton = useMemo(
    () => (
      <div style={{ display: "flex" }}>
        <span
          className={classes.button}
          onClick={() => {
            setShowFeedBackDialog(true);
          }}
        >
          <EditIcon className={classes.icon} />
          <Typography className={classes.buttonText}>反馈</Typography>
        </span>
        {uploadResult?.dismatchResource && (
          <span
            className={classes.button}
            onClick={() => uploadResult?.dismatchResource && window.open(uploadResult?.dismatchResource)}
          >
            <Download className={classes.icon} style={{ fontSize: 18 }} />

            <Typography className={classes.buttonText}>
              {fileType === TrealmImportType.ShareholderRecord ? "下载未导入" : "下载未匹配"}
            </Typography>
          </span>
        )}
      </div>
    ),
    [classes.button, classes.buttonText, classes.icon, fileType, uploadResult],
  );

  function onFileUploadFined(response: TrealmImportResponse) {
    setTaskId(response.taskID);
    setUploadResult(response);
    setStep(FileUploadType.MatchResult);
  }

  async function feedBack() {
    if (!phone) return;
    if (!taskId) return openSnackbar("反馈失败！", "error");
    const trealmFeedBackRes = await client
      .query<TrealmFeedbackMessageQuery, TrealmFeedbackMessageQueryVariables>(TrealmFeedbackMessageDocument, {
        taskID: taskId,
      })
      .toPromise();

    if (trealmFeedBackRes.error || !trealmFeedBackRes.data?.trealmFeedbackMessage) {
      closeFeedBackDialog();
      return openSnackbar("反馈失败！", "error");
    }

    const payload = JSON.parse(trealmFeedBackRes.data.trealmFeedbackMessage);
    const createTicketRes = await client
      .mutation<CreateTicketMutation, CreateTicketMutationVariables>(CreateTicketDocument, {
        type: "Feedback",
        payload: JSON.stringify({
          ...payload,
          user_phone: phone,
        }),
      })
      .toPromise();

    if (createTicketRes.error) return openSnackbar("反馈失败！", "error");
    closeFeedBackDialog();
    openSnackbar("已收到您的数据反馈，稍后将有客服联系您", "success");
  }

  function onConfirmButtonClick() {
    switch (step) {
      case FileUploadType.ChoseFileType:
        if (!fileType) break;
        setStep(FileUploadType.UploadFile);
        break;
      case FileUploadType.MatchResult:
        confirmUpload();
        innitState();
        break;
      default:
        return;
    }
  }

  async function onCancelButtonClick() {
    if (taskId) {
      const res = await client
        .mutation<TrealmCancelMutation, TrealmCancelMutationVariables>(TrealmCancelDocument, {
          taskID: taskId,
        })
        .toPromise();

      if (!res.error) {
        innitState();
        return;
      }
    }

    innitState();
  }

  function getDialogContent() {
    switch (step) {
      case FileUploadType.ChoseFileType:
        return <ChoseFileType onClick={setFileType} />;
      case FileUploadType.UploadFile:
        return <UploadFile fileType={fileType!} onFileUploadFined={onFileUploadFined} />;
      case FileUploadType.MatchResult:
        return <UploadResult fileType={fileType!} uploadResult={uploadResult} />;
      default:
        return <></>;
    }
  }

  return (
    <div className={classes.root}>
      <Button variant="text" style={{ marginRight: 16 }} onClick={() => setShowUploadDialog(true)}>
        <FileUpload className={classes.buttonIcon} />
        文件导入
      </Button>
      <Button variant="text" onClick={() => setShowHistoryDialog(true)}>
        <UploadHistoryIcon className={classes.buttonIcon} />
        导入历史
      </Button>
      <CommonDialog
        open={showUploadDialog}
        transitionDuration={{ exit: 0 }}
        title={"文件导入"}
        content={getDialogContent()}
        closeDialog={onCancelButtonClick}
        showCancelButton={step !== FileUploadType.UploadFile}
        showConfirmButton={step !== FileUploadType.UploadFile}
        actionsPrefixButton={step === FileUploadType.MatchResult ? prefixButton : undefined}
        onConfirmButtonClick={onConfirmButtonClick}
        onCancelButtonClick={onCancelButtonClick}
      />
      <CommonDialog
        open={showHistoryDialog}
        width={500}
        title={"导入历史"}
        content={<UploadHistory />}
        closeDialog={() => setShowHistoryDialog(false)}
      />
      <CommonDialog
        open={showFeedBackDialog}
        title={"反馈"}
        content={
          <FeedBack
            onPhoneChange={(phone) => {
              setPhone(phone);
            }}
            onErrorChange={(error) => setError(error)}
          />
        }
        disableConfirmButton={error}
        closeDialog={closeFeedBackDialog}
        showCancelButton
        showConfirmButton
        onConfirmButtonClick={feedBack}
        onCancelButtonClick={closeFeedBackDialog}
      />
    </div>
  );
};

export default FileOperations;
