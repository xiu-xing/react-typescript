import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { CSSProperties } from "@material-ui/styles";
import clsx from "clsx";
import React, { ReactNode, ReactText } from "react";
import theme from "../../../theme";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      color: theme.palette.primary.main,
      background: "#F5F6F9",
      borderRadius: 4,
      padding: 16,
      display: "inline-flex",
      flexDirection: "column",
      justifyContent: "space-between",
    },
    title: {
      fontSize: 14,
      color: theme.palette.grey[600],
      lineHeight: 1.71,
      marginBottom: 4,
      whiteSpace: "nowrap",
    },
    content: (props) => ({
      fontSize: 22,
      lineHeight: 1.18,
      whiteSpace: "nowrap",
      fontWeight: theme.typography.fontWeightMedium,
      color: `${props["color"]}`,
    }),
    yoy: {
      marginTop: 8,
      fontSize: 12,
      color: theme.palette.grey[500],
    },
  }),
);

interface StatisticProps {
  title: ReactNode;
  content: ReactText;
  contentColor?: string;
  className?: string;
  style?: CSSProperties;
  sub?: ReactNode;
}

const Statistic: React.FunctionComponent<StatisticProps> = (props) => {
  const classes = useStyles({ color: props.contentColor ?? theme.palette.primary.main });
  const { className, style, title, content, sub } = props;
  return (
    <div className={clsx(classes.root, className)} style={style}>
      <div className={classes.title}>{title}</div>
      <div className={classes.content}>{content}</div>
      {sub && <div className={classes.yoy}>{sub}</div>}
    </div>
  );
};

export default Statistic;
