import { createStyles, makeStyles } from "@material-ui/core/styles";
import { DropzoneArea, DropzoneAreaProps } from "material-ui-dropzone";
import React from "react";
import { UploadWEBP } from "../../../../assets/index";
const useStyles = makeStyles(() =>
  createStyles({
    root: {
      width: 128,
      height: 128,
      marginBottom: 32,
    },
    dropzone: {
      minHeight: 128,
      border: "none",
      backgroundColor: "#F8F8F8",
      backgroundImage: `url(${UploadWEBP})`,
      borderRadius: "100%",
      backgroundRepeat: "no-repeat",
      backgroundPositionX: "center",
      backgroundPositionY: "center",
      "&:focus": {
        outline: "none",
      },
      overflow: "hidden",
    },
    dropzoneActive: {
      animation: "none !important",
    },
    dropzoneIcon: {
      display: "none",
    },
    icon: {
      color: "#666",
      fontSize: 56,
    },
  }),
);

type UploadProps = DropzoneAreaProps;

const ImgUploadFile: React.FunctionComponent<UploadProps> = (props) => {
  const classes = useStyles();

  return (
    <div className={classes.root}>
      <DropzoneArea
        classes={{ root: classes.dropzone, icon: classes.dropzoneIcon, active: classes.dropzoneActive }}
        showPreviews={false}
        showAlerts={false}
        filesLimit={1}
        dropzoneText=""
        inputProps={{
          name: "card",
        }}
        {...props}
      />
    </div>
  );
};

export default ImgUploadFile;
