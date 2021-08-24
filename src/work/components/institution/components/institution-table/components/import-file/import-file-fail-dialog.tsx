import { Box, Dialog, DialogContent, DialogTitle, IconButton, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import MoreHorizRounded from "@material-ui/icons/MoreHoriz";
import { Close } from "mdi-material-ui";
import React, { ReactNode } from "react";
import { getResourceUrl } from "../../../../../../utils/url";
import { FileExcel, ImportFailWEBP } from "../../../../assets/index";
import InstitutionContainer, { InstitutionType } from "../../../../institutionContainer";

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
      padding: "0px 24px",
    },
    titleClose: {
      position: "absolute",
      right: 8,
      top: 3,
    },
    downloadTemplate: {
      color: theme.palette.primary.main,
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
      marginBottom: 63,
      cursor: "pointer",
      textDecoration: "none",
    },
    importFail: {
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
      fontSize: 24,
      color: "#C62828",
    },
    importFailIcon: {
      height: 32,
      width: 32,
      marginRight: 8,
    },
    text: {
      marginTop: 27,
      marginBottom: 35,
      color: "#333",
      fontSize: 24,
    },
    excelTemplateText: {
      fontSize: 18,
      lineHeight: "32px",
    },
    cancelButton: {
      color: "#666",
    },
    confirm: {
      color: "#fff",
      background: theme.palette.primary.main,
      fontSize: 14,
      width: 160,
      height: 42,
      cursor: "pointer",
      borderRadius: 4,
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
      marginBottom: 50,
    },
    moreHorizIcon: {
      width: 24,
      height: 24,
      background: theme.palette.primary.main,
      color: "#fff",
      borderRadius: "100%",
    },
    moreHorizText: {
      fontSize: 24,
      lineHeight: "32px",
      marginLeft: 8,
    },
  }),
);

interface ImportFileFailDialogProps {
  groupCode: InstitutionType;
  open: boolean;
  close(): void;
  dialogTitle: string;
  fileUpload: boolean;
}

const ImportFileFailDialog: React.FunctionComponent<ImportFileFailDialogProps> = (props) => {
  const classes = useStyles();
  const { open, close, dialogTitle, fileUpload } = props;
  const { resourceKey, errorCode, errorMessage } = InstitutionContainer.useContainer();

  function getIconAndText(): ReactNode {
    return fileUpload == true ? (
      <Box className={classes.importFail}>
        <img src={ImportFailWEBP} className={classes.importFailIcon} />
        <Typography style={{ fontSize: 24 }}>导入不成功</Typography>
      </Box>
    ) : (
      <Box className={classes.importFail}>
        <MoreHorizRounded color="primary" className={classes.moreHorizIcon} />
        <Typography className={classes.moreHorizText} color="primary">
          仍需人工审核
        </Typography>
      </Box>
    );
  }
  return (
    <Dialog open={open} classes={{ paper: classes.paperRoot }} onClose={close}>
      <DialogTitle className={classes.dialogTitle}>
        <Typography>{dialogTitle}</Typography>
        <IconButton className={classes.titleClose} onClick={close}>
          <Close />
        </IconButton>
      </DialogTitle>
      <DialogContent className={classes.dialogContent}>
        {getIconAndText()}
        <Typography className={classes.text}>{errorMessage}</Typography>
        {errorCode == "201001" ? (
          <a href={getResourceUrl(resourceKey)} className={classes.downloadTemplate}>
            <img src={FileExcel} />
            <Typography className={classes.excelTemplateText}>下载 Excel 文档模板</Typography>
          </a>
        ) : null}
        {errorCode != "201001" ? (
          <Box
            className={classes.confirm}
            onClick={(): void => {
              close();
            }}
          >
            我已知晓
          </Box>
        ) : null}
      </DialogContent>
    </Dialog>
  );
};

export default ImportFileFailDialog;
