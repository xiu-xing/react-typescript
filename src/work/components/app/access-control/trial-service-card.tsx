import { createStyles, makeStyles, Theme } from "@material-ui/core";
import React from "react";
import UserContainer from "../../../containers/userContainer";
import Active from "./assets/active.png";

const useStyle = makeStyles((theme: Theme) =>
  createStyles({
    card: {
      paddingTop: "10%",
      height: "386px",
      display: "flex",
      alignItems: "center",
      flexDirection: "column",
    },
    description: {
      marginLeft: "10px",
      fontSize: "16px",
      fontWeight: 500,
    },
    active: {
      fontSize: "16px",
      fontWeight: 500,
      cursor: "pointer",
      color: theme.palette.primary.main,
    },
  }),
);

const TrialServiceCard: React.FunctionComponent<{}> = () => {
  const { setTrailServiceDialogOpen } = UserContainer.useContainer();
  const classes = useStyle();
  return (
    <div className={classes.card}>
      <img src={Active} />
      <div>
        <span className={classes.active} onClick={() => setTrailServiceDialogOpen(true)}>
          申请试用账号
        </span>
        <span className={classes.description}> 查看全量数据，解锁更多功能</span>
      </div>
    </div>
  );
};

export default TrialServiceCard;
