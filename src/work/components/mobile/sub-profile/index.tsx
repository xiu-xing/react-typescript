import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { useEffect } from "react";
import Placeholder from "../common/placeholder";
import { useProfileLock } from "../profile/states";
import Header from "./header";
import Tabs from "./tabs";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
  }),
);

const MobileSubProfile: React.FunctionComponent = () => {
  const classes = useStyles();

  const [lock] = useProfileLock();

  useEffect(() => {
    if (window.flutter_inappwebview && lock) window.flutter_inappwebview.callHandler("showACDialog");
  }, [lock]);

  return lock ? (
    <Placeholder />
  ) : (
    <div className={classes.root}>
      <Header />
      <Tabs />
    </div>
  );
};

export default MobileSubProfile;
