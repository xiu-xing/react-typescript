import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import UserContainer from "../../../../containers/userContainer";
import DialogTitle from "./dialog-title";

const useStyles = makeStyles(() =>
  createStyles({
    content: {
      textAlign: "center",
    },
    text: {
      fontSize: 14,
    },
  }),
);

const OncheckingContent: React.FunctionComponent<{}> = () => {
  const classes = useStyles();

  const { setUserProfileDialogOpen } = UserContainer.useContainer();

  return (
    <Box>
      <DialogTitle
        title="正在审核中"
        closeButton
        onClickCloseButton={(): void => {
          setUserProfileDialogOpen(false);
        }}
      />
      <Box className={classes.content}>
        <Typography className={classes.text}>您的材料正在审核中...</Typography>
      </Box>
    </Box>
  );
};

export default OncheckingContent;
