import { Dialog } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import UserContainer from "../../../containers/userContainer";

const useStyles = makeStyles(() =>
  createStyles({
    paper: {
      minWidth: 450,
      maxWidth: 600,
      minHeight: 180,
      position: "relative",
    },
    loadingBox: {
      marginTop: 30,
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
    },
  }),
);

const UserProfileDialogDisplay: React.FunctionComponent<{}> = () => {
  const classes = useStyles();

  const userContainer = UserContainer.useContainer();

  // const { processStatus, executeSearchReviewProgressQuery } = UserProfileContainer.useContainer();

  // function dialogComponent(): ReactNode {
  //   switch (processStatus) {
  //     case "loading":
  //       return (
  //         <Box className={classes.loadingBox}>
  //           <Box>
  //             <CircularProgress color="primary" />
  //           </Box>
  //         </Box>
  //       );
  //     // case ReviewStatus.NotCommit:
  //     //   return <FormContent />;
  //     // case ReviewStatus.NotReviewed:
  //     //   return <OncheckingContent />;
  //     // case ReviewStatus.ReviewFailed:
  //     //   return <UnpassContent />;
  //     // case ReviewStatus.ReviewPassed:
  //     //   return <PassContent />;
  //     default:
  //       return <UnknownContent />;
  //   }
  // }

  // useEffect(() => {
  //   if (userContainer.userProfileDialogOpen) {
  //     executeSearchReviewProgressQuery();
  //   }
  //   // eslint-disable-next-line react-hooks/exhaustive-deps
  // }, [userContainer.userProfileDialogOpen]);

  return (
    <Dialog
      classes={{ paper: classes.paper }}
      open={userContainer.userProfileDialogOpen}
      onClose={(): void => {
        userContainer.setUserProfileDialogOpen(false);
      }}
    >
      {/* {dialogComponent()} */}
    </Dialog>
  );
};

export default UserProfileDialogDisplay;
