import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React from "react";
import { TrealmImportResponse, TrealmImportType } from "../../../generated/graphql";
import { getUnit } from "./upload-histoty";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      padding: "16px 32px",
      display: "flex",
      alignItems: "center",
      maxWidth: 400,
    },
    infoBox: {
      display: "grid",
      gridAutoFlow: "row",
      gridRowGap: 12,
    },
    infoText: {
      color: theme.palette.grey[600],
      fontSize: 18,
      fontWeight: 500,
    },
    red: {
      color: "#E00000",
    },
  }),
);

interface UploadResultProps {
  uploadResult?: TrealmImportResponse;
  fileType: TrealmImportType;
}

const UploadResult: React.FunctionComponent<UploadResultProps> = (props) => {
  const classes = useStyles();
  const { uploadResult, fileType } = props;

  if (!uploadResult) return <></>;

  function infoContent() {
    let notFoundText = "未匹配";
    let notFoundInfoText = "";
    let unitText = "个直投项目";

    switch (fileType) {
      case TrealmImportType.ShareholderRecord:
        notFoundText = "未在机构全貌中找到";
        notFoundInfoText = "，请先添加相应的项目或基金";
        unitText = getUnit(fileType);
        break;
      default:
        unitText = getUnit(fileType);
        break;
    }

    return (
      <Box className={classes.infoBox}>
        <Typography className={classes.infoText}>成功匹配 {uploadResult?.matchCount} 条数据</Typography>
        <Typography className={classes.infoText}>
          {notFoundText} <span className={classes.red}>{uploadResult?.dismatchCount}</span> 条数据{notFoundInfoText}
        </Typography>
        <Typography className={classes.infoText}>
          将为您导入 {uploadResult?.importCount} {unitText}
        </Typography>
      </Box>
    );
  }

  return <div className={classes.root}>{infoContent()}</div>;
};

export default UploadResult;
