import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React from "react";
import UserContainer from "../../../../containers/userContainer";
import DialogTitle from "./dialog-title";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    content: {
      textAlign: "center",
    },
    text: {
      fontSize: 14,
    },
  }),
);

const UnknownContent: React.FunctionComponent<{}> = () => {
  const classes = useStyles();

  const { setUserProfileDialogOpen } = UserContainer.useContainer();

  return (
    <Box>
      <DialogTitle
        title="未知错误"
        closeButton
        onClickCloseButton={(): void => {
          setUserProfileDialogOpen(false);
        }}
      />
      <Box className={classes.content}>
        <Typography className={classes.text}>未知错误，请联系官方客服。</Typography>
      </Box>
    </Box>
  );
};

export default UnknownContent;
