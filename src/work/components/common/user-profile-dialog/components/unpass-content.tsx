import { Box, Button, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React from "react";
import UserContainer from "../../../../containers/userContainer";
// import { ReviewStatus } from "../../../../generated/graphql";
import UserProfileContainer from "../userProfileContainer";
import DialogTitle from "./dialog-title";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    unpass: {
      textAlign: "center",
    },
    unpassText: {
      fontSize: 14,
    },
    redoneButton: {
      marginTop: 28,
    },
  }),
);

const UnpassContent: React.FunctionComponent<{}> = () => {
  const classes = useStyles();

  const { setUserProfileDialogOpen } = UserContainer.useContainer();
  const { setProcessStatus } = UserProfileContainer.useContainer();

  return (
    <Box>
      <DialogTitle
        title="身份认证未通过"
        closeButton
        onClickCloseButton={(): void => {
          setUserProfileDialogOpen(false);
        }}
      />
      <Box className={classes.unpass}>
        <Typography className={classes.unpassText}>您的身份认证申请未通过，具体原因请联系官方客服。</Typography>
        <Box>
          <Button
            className={classes.redoneButton}
            color="primary"
            variant="contained"
            size="small"
            onClick={(): void => {
              // setProcessStatus(ReviewStatus.NotCommit);
            }}
          >
            重新申请
          </Button>
        </Box>
      </Box>
    </Box>
  );
};

export default UnpassContent;
