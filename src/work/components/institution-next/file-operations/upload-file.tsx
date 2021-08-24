import { Box, Button, CircularProgress, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { useMemo, useRef, useState } from "react";
import {
  TrealmImportResponse,
  TrealmImportType,
  useTrealmImportMutation,
  useUploadMutation,
} from "../../../generated/graphql";
import theme from "../../../theme";
import { getResourceUrl } from "../../../utils/url";
import SnackbarContainer from "../../common/snackbar/snackbarContainer";
import { Docx, FileUpload } from "../assets";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      padding: 32,
      position: "relative",
      textAlign: "center",
    },
    fileInput: {
      width: 385,
      height: 170,
      opacity: 0,
      position: "absolute",
      top: 32,
      left: 32,
      cursor: "pointer",
    },
    labelBox: {
      width: 385,
      height: 170,
      textAlign: "center",
      border: `2px dashed ${theme.palette.primary.main}`,
      borderRadius: 8,
      display: "flex",
      flexDirection: "column",
      alignItems: "center",
      justifyContent: "center",
    },
    labelText: {
      fontWeight: 500,
      fontSize: 16,
      paddingLeft: 4,
    },
    primaryText: {
      fontWeight: 500,
      fontSize: 16,
      color: theme.palette.primary.main,
    },
    downloadButton: {
      marginTop: 24,
    },
    docxIcon: {
      fontSize: 24,
      marginRight: 4,
    },
  }),
);

interface UploadFileProps {
  fileType: TrealmImportType;
  onFileUploadFined: (response: TrealmImportResponse) => void;
}

const UploadFile: React.FunctionComponent<UploadFileProps> = ({ fileType, onFileUploadFined }) => {
  const classes = useStyles();
  const [fetching, setFetching] = useState(false);
  const { openSnackbar } = SnackbarContainer.useContainer();
  const [, executeTrealmImportMutation] = useTrealmImportMutation();
  const [, executeUploadMutation] = useUploadMutation();
  const inputRef = useRef<HTMLInputElement>(null);

  async function upload(file: File) {
    if (!file) return;
    setFetching(true);
    const uploadRes = await executeUploadMutation({
      file: file,
    });

    if (uploadRes.error || !uploadRes.data) {
      setFetching(false);
      if (inputRef.current) inputRef.current.value = "";
      return openSnackbar("上传失败！请使用规范文档上传", "error");
    }
    const resourceKey = uploadRes.data.upload;

    const trealmImportRes = await executeTrealmImportMutation({
      input: {
        resourceKey: resourceKey,
        importType: fileType,
      },
    });

    setFetching(false);
    if (trealmImportRes.error || !trealmImportRes.data) {
      if (inputRef.current) inputRef.current.value = "";
      return openSnackbar("上传失败！请使用规范文档上传", "error");
    }

    onFileUploadFined(trealmImportRes.data.trealmImport as TrealmImportResponse);
  }

  function downloadTemplate() {
    if (fileType === TrealmImportType.ShareholderRecord) return window.open(getResourceUrl("trealm_relation_template"));
    return window.open(getResourceUrl("trealm_entity_template"));
  }

  const contentComponent = useMemo(() => {
    if (fetching) return <CircularProgress size={30} />;

    return (
      <>
        <FileUpload fontSize={38} />
        <Box style={{ display: "flex" }}>
          <Typography className={classes.primaryText} style={{ color: theme.palette.primary.main }}>
            点击上传文件
          </Typography>
          <Typography className={classes.labelText}>或拖拽上传</Typography>
        </Box>
      </>
    );
  }, [classes.labelText, classes.primaryText, fetching]);

  return (
    <Box className={classes.root}>
      <input
        id="institutionFile"
        type="file"
        accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        className={classes.fileInput}
        ref={inputRef}
        onChange={(e) => e.target.files && upload(e.target.files[0])}
      />
      <Box className={classes.labelBox}>{contentComponent}</Box>
      <Button className={classes.downloadButton} variant="text" onClick={downloadTemplate}>
        <Docx className={classes.docxIcon} />
        <Typography className={classes.primaryText}>下载 Excel 文档模板</Typography>
      </Button>
    </Box>
  );
};

export default UploadFile;
