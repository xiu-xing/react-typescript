import { Box } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { useState } from "react";
import { DropzoneArea, DropzoneAreaProps } from "material-ui-dropzone";
import { withAlphaHex } from "with-alpha-hex";
import { PDFFileSVG, RARFileSVG, uploadWEBP, WordFileSVG, ZIPFileSVG, uploadedWEBP } from "../assets";
import SnackbarContainer from "../../../common/snackbar/snackbarContainer";
import { first } from "../../../../utils/tools";

interface StyleProps {
  isUploaded: boolean;
}

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      position: "relative",
      boxSizing: "content-box",
      height: 90,
      minHeight: 90,
      width: 90,
      borderRadius: 4,
      display: "grid",
      placeItems: "center",
      backgroundImage: (props: StyleProps) => (props.isUploaded ? "" : `url(${uploadWEBP})`),
      backgroundRepeat: "no-repeat",
      backgroundSize: "contain",
      "&:hover": {
        backgroundImage: (props: StyleProps) => (props.isUploaded ? "" : `url(${uploadedWEBP})`),
        filter: (props: StyleProps) => (props.isUploaded ? "opacity(0.5)" : ""),
      },
      "$ .MuiDropzoneArea-root": {
        minHeight: 90,
      },
    },

    bgImg: {
      position: "absolute",
    },
    dropzone: {
      width: 90,
      height: 90,
      minHeight: 90,
      border: "none",
      borderRadius: 0,
      background: "transparent",
      "&:focus": {
        outline: "none",
      },
      overflow: "hidden",
    },
    dropzoneActive: {
      animation: "none !important",
    },
    dropzoneIcon: {
      position: "absolute",
      top: "50%",
      left: "50%",
      display: "none",
    },
    previewContainer: {
      width: "100%",
      height: "100%",
      alignItems: "center",
      margin: "-24px 0 0 0",
    },
    previewItem: {
      width: "100%",
      maxWidth: "100%",
      height: "100%",
      flexBasis: "auto",
      padding: "0 !important",
      "& button": {
        height: 40,
        width: 40,
        top: "50%",
        left: "50%",
        transform: "translate(-20px,-20px)",
        background: "#666",
        color: "white",
        "&:hover": {
          background: withAlphaHex("#666", 0.8),
        },
      },
    },
    previewImage: {
      width: "100%",
      borderRadius: 0,
      height: "100%",
      display: "flex",
    },
  }),
);

type UploadProps = DropzoneAreaProps;

// 上传文件，背景图片无法修改
const UploadFile: React.FunctionComponent<UploadProps> = (props) => {
  const [upload, setUpload] = useState(false);
  const classes = useStyles({ isUploaded: upload });
  const { openSnackbar } = SnackbarContainer.useContainer();

  function getPreviewIcon(type: string, imageData?: string) {
    if (type.match(RegExp(/zip/))) return <ZIPFileSVG fontSize={32} />;

    if (type.match(RegExp(/doc/))) return <WordFileSVG fontSize={32} />;

    if (type.match(RegExp(/rar/))) return <RARFileSVG fontSize={32} />;

    if (type.match(RegExp(/pdf/))) return <PDFFileSVG fontSize={32} />;

    if (type.match(RegExp(/(png|jepg|jpg)/)) && imageData)
      return <img style={{ height: 92, width: 92 }} src={imageData} />;

    return <Box />;
  }

  return (
    <Box className={classes.root}>
      <DropzoneArea
        {...props}
        classes={{
          root: classes.dropzone,
          icon: classes.dropzoneIcon,
          active: classes.dropzoneActive,
        }}
        previewGridClasses={{
          container: classes.previewContainer,
          item: classes.previewItem,
          image: classes.previewImage,
        }}
        showPreviews={false}
        showAlerts={false}
        filesLimit={1}
        maxFileSize={10 * 1024 * 1024}
        dropzoneText=""
        inputProps={{
          name: "upload",
        }}
        disableRejectionFeedback
        onDropRejected={(files, event) => {
          if ((files?.length ?? 0) === 0) return;
          if (first(files)?.size > 10 * 1024 * 1024) {
            openSnackbar("文件过大！", "error");
            return;
          }
          openSnackbar("不支持该文件类型！", "error");
        }}
        getPreviewIcon={(fileObject) => (
          <Box display="flex" justifyContent="center" alignItems="center" height="100%" width="100%">
            {getPreviewIcon(fileObject.file.type, fileObject.data as string)}
          </Box>
        )}
        onChange={(files: File[]) => {
          setUpload(files.length > 0);
          props.onChange?.(files);
        }}
      />
    </Box>
  );
};

export default UploadFile;
