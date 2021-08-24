import { Button, List, ListItem, ListItemSecondaryAction, ListItemText, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { useState } from "react";
import UserContainer from "../../../../../../containers/userContainer";
import { Role } from "../../../../../../generated/graphql";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      padding: "8px 32px",
    },
    action: {
      right: "32px",
    },
    subTitle: {
      fontSize: "14px",
      color: "#666",
    },
  }),
);

const Verification: React.FunctionComponent = () => {
  const classes = useStyles();
  const { user, setInstitutionAuthenticationDialog } = UserContainer.useContainer();
  const [open, setOpen] = useState(false);

  const onClose = (): void => {
    setOpen(false);
  };

  return (
    <>
      {(user?.role === Role.IndividualFree || user?.role === Role.IndividualPremium) && (
        <List disablePadding>
          <ListItem className={classes.root}>
            <ListItemText
              primary={<Typography>我的机构</Typography>}
              secondary={<Typography className={classes.subTitle}>认证机构，解锁更多功能</Typography>}
            />
            <ListItemSecondaryAction className={classes.action}>
              <Button
                size="small"
                variant="contained"
                disableElevation
                color="primary"
                onClick={(): void => setInstitutionAuthenticationDialog(true)}
              >
                立即认证
              </Button>
            </ListItemSecondaryAction>
          </ListItem>
        </List>
      )}
      {/* <BusinessCardVerificationDialog initialStep={0} onClose={onClose} open={open} /> */}
    </>
  );
};

export default Verification;
