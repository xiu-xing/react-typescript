import { createStyles, makeStyles } from "@material-ui/core/styles";
import { DropzoneArea, DropzoneAreaProps } from "material-ui-dropzone";
import React, { useState } from "react";
import { withAlphaHex } from "with-alpha-hex";
import { uploadCardWEBP, uploadCardHoverWEBP, BackgroundWEBP } from "../assets";
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
      height: 220,
      minHeight: 220,
      width: 418,
      borderRadius: 2,
      display: "grid",
      placeItems: "center",
      backgroundSize: "contain",
      backgroundImage: (props: StyleProps) => (props.isUploaded ? `url(${BackgroundWEBP})` : `url(${uploadCardWEBP})`),
      backgroundRepeat: "no-repeat",
      "&:hover": {
        backgroundImage: (props: StyleProps) =>
          props.isUploaded ? `url(${BackgroundWEBP})` : `url(${uploadCardHoverWEBP})`,
        filter: (props: StyleProps) => (props.isUploaded ? "opacity(0.5)" : ""),
      },
    },
    dropzone: {
      width: 211,
      height: 126,
      minHeight: 126,
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
      "& img": {
        height: "100%",
        objectFit: "cover",
        objectPosition: "center",
      },
      "& button": {
        height: 40,
        width: 40,
        top: "50%",
        left: "50%",
        transform: "translate(-20px,-20px)",
        background: "#333",
        color: "white",
        "&:hover": {
          background: withAlphaHex("#333", 1),
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

type UploadCardProps = DropzoneAreaProps;

const UploadCard: React.FunctionComponent<UploadCardProps> = (props) => {
  const [upload, setUpload] = useState(false);
  const classes = useStyles({ isUploaded: upload });
  const { openSnackbar } = SnackbarContainer.useContainer();
  return (
    <div className={classes.root}>
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
        maxFileSize={5 * 1024 * 1024}
        dropzoneText=""
        inputProps={{
          name: "card",
        }}
        onDropRejected={(files, event) => {
          if ((files?.length ?? 0) === 0) return;
          if (first(files)?.size > 5 * 1024 * 1024) {
            openSnackbar("文件过大！", "error");
            return;
          }
         
          openSnackbar("不支持该文件类型！", "error");
        }}
        onChange={(files: File[]) => {
          setUpload(files.length > 0);
          props.onChange?.(files);
        }}
      />
    </div>
  );
};

export default UploadCard;
