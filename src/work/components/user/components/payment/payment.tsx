import { Box, createStyles, makeStyles, Theme } from "@material-ui/core";
import { CreditCard, Lock } from "mdi-material-ui";
import React from "react";
import Card from "../card";
import Title from "../title";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      maxWidth: "1285px",
      margin: "auto",
    },
    cards: {
      display: "grid",
      gridTemplateColumns: "repeat(2,1fr)",
      gridGap: "10px 17px",
      [theme.breakpoints.down("sm")]: {
        gridTemplateColumns: "1fr",
      },
    },
    icon: {
      color: "#66778B",
      fontSize: "56px",
    },
  }),
);

const Payment: React.FC = () => {
  const classes = useStyles();

  return (
    <Box className={classes.root}>
      <Title title="付款信息" />
      <Box className={classes.cards}>
        <Card icon={<CreditCard className={classes.icon} />} title="信用卡 ****1571" subTitle="修改您的付款方式" />
        <Card icon={<Lock className={classes.icon} />} title="账单" subTitle="即将到来的账单和历史账单" />
      </Box>
    </Box>
  );
};

export default Payment;
