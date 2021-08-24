import { createStyles, makeStyles } from "@material-ui/core";
import { AccountMultiple } from "mdi-material-ui";
import React from "react";
import UserContainer from "../../../userContainer";
import Card from "../../card";

const useStyles = makeStyles(() =>
  createStyles({
    icon: {
      color: "#66778B",
      fontSize: "56px",
    },
  }),
);

const Binding: React.FC = () => {
  const classes = useStyles();
  const { setDialogType: setDialogIndex } = UserContainer.useContainer();
  return (
    <>
      <Card
        icon={<AccountMultiple className={classes.icon} />}
        title="公共账号绑定"
        subTitle="绑定您的 微信、微博、领英 "
        onClick={(): void => setDialogIndex("binding")}
      />
    </>
  );
};

export default Binding;
