import { ButtonBase, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { ReactNode } from "react";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      width: "100%",
      height: 94,
      padding: "16px 24px",
      justifyContent: "start",
      background: "rgba(255,255,255,1)",
      borderRadius: "4px",
      boxShadow: "0px 1px 3px 0px rgba(0,0,0,0.2),0px 2px 1px -1px rgba(0,0,0,0.12),0px 1px 1px 0px rgba(0,0,0,0.14);",
    },
    message: {
      display: "flex",
      flexDirection: "column",
      marginLeft: "20px",
      marginRight: "20px",
      height: "100%",
    },
    title: {
      flex: 1,
      display: "flex",
      color: "#333",
      fontSize: "14px",
      alignItems: "center",
    },
    subTitle: {
      marginTop: 4,
      flex: 1,
      display: "flex",
      color: "#333",
      fontSize: "12px",
      alignItems: "center",
    },
  }),
);

interface CardProps {
  icon: ReactNode;
  title?: string | null;
  subTitle?: string | null;
  showSubtitle?: boolean;
  onClick?: VoidFunction;
}

const Card: React.FC<CardProps> = props => {
  const classes = useStyles();

  return (
    <>
      <ButtonBase
        className={classes.root}
        onClick={(): void => {
          if (props.onClick) {
            props.onClick();
          }
        }}
      >
        {props.icon}
        <div className={classes.message}>
          <Typography className={classes.title}>{props.title || "-"}</Typography>
          {(props.showSubtitle === undefined || props.showSubtitle === true) && (
            <Typography className={classes.subTitle}>{props.subTitle || "-"}</Typography>
          )}
        </div>
      </ButtonBase>
    </>
  );
};

export default Card;
