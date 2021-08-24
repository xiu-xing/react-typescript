import { createStyles, makeStyles } from "@material-ui/core/styles";
import { DropzoneArea, DropzoneAreaProps } from "material-ui-dropzone";
import React, { useMemo, useState } from "react";
import { withAlphaHex } from "with-alpha-hex";
import tip from "./assets/tip.webp";
import upload from "./assets/upload.webp";
import uploaded from "./assets/uploaded.webp";

interface StyleProps {
  isUploaded: boolean;
}

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      position: "relative",
      border: (props: StyleProps) => (props.isUploaded ? "" : "1px dashed #CFDCE7"),
      boxSizing: "content-box",
      height: 220,
      width: "100%",
      borderRadius: 2,
      display: "grid",
      placeItems: "center",
      backgroundImage: (props: StyleProps) => (props.isUploaded ? `url(${uploaded})` : `url(${tip}),url(${upload})`),
      backgroundRepeat: "no-repeat",
      backgroundSize: (props: StyleProps) => (props.isUploaded ? "contain" : "195px 43px,contain"),
      backgroundPosition: (props: StyleProps) => (props.isUploaded ? "0 0" : "97.5px 84px,0 0"),
      "&:hover": {
        filter: (props: StyleProps) => (props.isUploaded ? "opacity(0.5)" : ""),
      },
    },
    bgImg: {
      position: "absolute",
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
      },
      "& button": {
        // minHeight: 24,
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

const Upload: React.FunctionComponent<UploadProps> = (props) => {
  const [file, setFile] = useState<File[]>([]);
  const uploaded = useMemo(() => file.length > 0, [file]);
  const classes = useStyles({ isUploaded: uploaded });

  return (
    <div className={classes.root}>
      <DropzoneArea
        {...props}
        classes={{ root: classes.dropzone, icon: classes.dropzoneIcon, active: classes.dropzoneActive }}
        previewGridClasses={{
          container: classes.previewContainer,
          item: classes.previewItem,
          image: classes.previewImage,
        }}
        showPreviews={false}
        showAlerts={false}
        filesLimit={1}
        dropzoneText=""
        inputProps={{
          name: "card",
        }}
        previewText="asdasdasd"
        onChange={(files: File[]) => {
          setFile(files);
          props.onChange?.(files);
        }}
      />
      {/* <img src={ImageUploadPlaceholder} className={classes.bgImg} /> */}
    </div>
  );
};

export default Upload;
