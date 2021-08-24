import { Box, Dialog, DialogContent, DialogTitle, IconButton, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { Close } from "mdi-material-ui";
import React, { useEffect, useState } from "react";
import { useMatchRecordsFromImportedFileMutation, useSingleUploadMutation } from "../../../../../../generated/graphql";
import { errorParse } from "../../../../../../utils/errorHandler";
import { getResourceUrl } from "../../../../../../utils/url";
import SnackbarContainer from "../../../../../common/snackbar/snackbarContainer";
import { FileExcel } from "../../../../assets/index";
import InstitutionContainer, { InstitutionType } from "../../../../institutionContainer";
import ImgUploadFile from "./img-upload";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    paperRoot: {
      minWidth: 480,
      maxWidth: 480,
    },
    dialogTitle: {
      display: "flex",
      justifyContent: "space-between",
    },
    dialogContent: {
      display: "flex",
      alignItems: "center",
      flexDirection: "column",
      marginTop: 30,
      padding: "0px 24px",
    },
    title: {},
    titleClose: {
      position: "absolute",
      right: 8,
      top: 3,
    },
    textBox: {
      fontSize: 20,
      display: "flex",
      justifyContent: "center",
    },
    text: {
      color: theme.palette.primary.main,
      cursor: "pointer",
    },
    downloadTemplate: {
      color: theme.palette.primary.main,
      display: "flex",
      justifyContent: "center",
      textDecoration: "none",
      marginTop: 32,
      marginBottom: 68,
      cursor: "pointer",
    },
    input: {
      display: "none",
    },
    excelTemplateText: {
      fontSize: 18,
      lineHeight: "32px",
    },
  }),
);

interface ImportFileDialogProps {
  groupCode: InstitutionType;
  open: boolean;
  close(): void;
  dialogTitle: string;
  onSuccess(): void;
}

const ImportFileDialog: React.FunctionComponent<ImportFileDialogProps> = (props) => {
  const classes = useStyles();
  const { open, groupCode, close, dialogTitle, onSuccess } = props;
  const [files, setFiles] = useState<Array<File>>([]);
  const [, setFetching] = useState(false);
  const { openSnackbar } = SnackbarContainer.useContainer();
  const {
    setTaskID,
    resourceKey,
    setIsCallLittleBell,
    setErrorCode,
    setErrorMessage,
    setFailDialogOpen,
    setFileUpload,
  } = InstitutionContainer.useContainer();
  const [, executeSingleUploadMutation] = useSingleUploadMutation();
  const [, executeMatchRecordsFromImportedFileMutation] = useMatchRecordsFromImportedFileMutation();
  function onFileChange(files: File[]): void {
    setFiles(files);
  }

  async function uploadFile(): Promise<void> {
    if (!files.length) {
      return;
    }
    setFetching(true);
    const fileUploadResult = await executeSingleUploadMutation({
      file: files[0],
    });
    if (fileUploadResult.error) {
      openSnackbar(fileUploadResult.error.message || "文件上传失败!", "error");
      close();
      setFetching(false);
      return;
    }
    if (!fileUploadResult.data) {
      openSnackbar("文件上传失败!", "error");
      setFetching(false);
      return;
    }

    const matchImportedRecordResult = await executeMatchRecordsFromImportedFileMutation({
      input: {
        resourceKey: fileUploadResult.data.singleUpload,
        groupCode: groupCode,
      },
    });

    if (matchImportedRecordResult.data?.matchRecordsFromImportedFile) {
      setFetching(false);
      close();
      setTaskID(matchImportedRecordResult.data.matchRecordsFromImportedFile);
      onSuccess();
      return;
    }
    if (matchImportedRecordResult.error) {
      const err = errorParse(matchImportedRecordResult.error);
      setErrorCode(err.Code);
      setErrorMessage(err.Message);
      setFileUpload(true);
      setFailDialogOpen(true);
      close();
      setFetching(false);
      return;
    }
  }

  useEffect(() => {
    uploadFile();
    setIsCallLittleBell(true);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [files]);

  function textUploadFile(event: React.ChangeEvent<HTMLInputElement>): void {
    const files = event.target.files;
    if (files) {
      setFiles([files[files.length - 1]]);
    }
  }

  return (
    <Dialog open={open} classes={{ paper: classes.paperRoot }} onClose={close}>
      <DialogTitle className={classes.dialogTitle}>
        <Typography className={classes.title}>{dialogTitle}</Typography>
        <IconButton className={classes.titleClose} onClick={close}>
          <Close />
        </IconButton>
      </DialogTitle>

      <DialogContent className={classes.dialogContent}>
        <ImgUploadFile onChange={onFileChange} acceptedFiles={[".xlsx"]} />
        <Box className={classes.textBox}>
          <input
            accept=".xlsx"
            className={classes.input}
            id="contained-button-file"
            multiple
            type="file"
            onChange={textUploadFile}
          />
          <label htmlFor="contained-button-file">
            <Typography className={classes.text}>点击上传文件</Typography>
          </label>
          <Typography>或拖拽上传</Typography>
        </Box>

        <a href={getResourceUrl(resourceKey)} className={classes.downloadTemplate}>
          <img src={FileExcel} />
          <Typography className={classes.excelTemplateText}>下载 Excel 文档模板</Typography>
        </a>
      </DialogContent>
    </Dialog>
  );
};

export default ImportFileDialog;
