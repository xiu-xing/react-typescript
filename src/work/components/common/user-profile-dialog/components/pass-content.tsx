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

const PassContent: React.FunctionComponent<{}> = () => {
  const classes = useStyles();

  const { setUserProfileDialogOpen } = UserContainer.useContainer();

  return (
    <Box>
      <DialogTitle
        title="审核已通过"
        closeButton
        onClickCloseButton={(): void => {
          setUserProfileDialogOpen(false);
        }}
      />
      <Box className={classes.content}>
        <Typography className={classes.text}>您的审核已经通过。</Typography>
      </Box>
    </Box>
  );
};

export default PassContent;
