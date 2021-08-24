import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import Lock from "mdi-material-ui/Lock";
import React, { useMemo } from "react";
import { Tab } from "../../../../../generated/graphql";
import { getLockLimit } from "../../../../../utils/permission";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "inline-flex",
      alignItems: "center",
    },
    lock: {
      fontSize: 14,
      marginLeft: 2,
      color: "#CCCCCC",
      zIndex: 1,
    },
  }),
);

interface TabLabelProps {
  tab: Tab;
}

const TabLabel: React.FunctionComponent<TabLabelProps> = (props) => {
  const { tab } = props;
  const classes = useStyles();

  const icon = useMemo(() => {
    if (getLockLimit(tab?.permissions)) return <Lock className={classes.lock} />;
  }, [tab]);

  return (
    <span className={classes.root}>
      {tab?.name}
      {icon}
    </span>
  );
};

export default TabLabel;
