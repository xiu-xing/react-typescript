import { Box, createStyles, makeStyles, Typography } from "@material-ui/core";
import nanoid from "nanoid";
import React from "react";
import { ProgressNode } from "../../../../../generated/graphql";
import theme from "../../../../../theme";

const useStyles = makeStyles(() =>
  createStyles({
    textareaBox: {
      display: "flex",
      flexDirection: "column",
      alignItems: "center",
      justifyContent: "center",
    },
    text: {
      fontSize: 14,
    },
  }),
);

interface ProgressBarItemProp {
  hasArrow?: boolean;
  node: ProgressNode;
}

const ProgressBarItem: React.FunctionComponent<ProgressBarItemProp> = (props) => {
  const classes = useStyles();

  const arrowSVG = () => {
    let color = theme.palette.primary.main;
    let opacity = "1";
    switch (props.node.status) {
      case "PROGRESS_STATUS_ACTIVE":
        opacity = "0.54";
        break;
      case "PROGRESS_STATUS_INACTIVE":
        color = "#BBBBBB";
        break;
      case "PROGRESS_STATUS_FAIL":
        color = "#E00000";
        break;
    }
    return (
      <svg key={nanoid(8)} width="27px" height="25px" viewBox="0 0 27 25" version="1.1">
        <g id="详情页（上市）" stroke="none" strokeWidth="1" fill="none" fillRule="evenodd">
          <g
            id="上市流程"
            transform="translate(-548.000000, -333.000000)"
            fill={color}
            stroke={color}
            opacity={opacity}
            strokeWidth="5"
          >
            <g id="进度" transform="translate(258.000000, 249.000000)">
              <g id="编组-21备份-2" transform="translate(0.000000, 72.000000)">
                <polygon
                  id="路径-20备份-6"
                  points="297 15 306.906054 24.8652257 297 34 302.551333 34 313 24.8652257 302.551333 15"
                />
              </g>
            </g>
          </g>
        </g>
      </svg>
    );
  };

  const textareaComponent = () => {
    let titleTextColor = theme.palette.primary.main;
    let dateTextColor = theme.palette.primary.main;
    switch (props.node.status) {
      case "PROGRESS_STATUS_ACTIVE":
        titleTextColor = "#333333";
        dateTextColor = "#666666";
        break;
      case "PROGRESS_STATUS_INACTIVE":
        titleTextColor = "#999999";
        dateTextColor = "#999999";
        break;
      case "PROGRESS_STATUS_FAIL":
        titleTextColor = "#E00000";
        dateTextColor = "#E00000";
        break;
    }
    return (
      <Box key={nanoid(8)} className={classes.textareaBox}>
        {props.node.title && (
          <Typography style={{ fontSize: 14, color: titleTextColor }}>{props.node.title}</Typography>
        )}
        {props.node.subtitle && (
          <Typography style={{ fontSize: 14, color: titleTextColor }}>{props.node.subtitle}</Typography>
        )}
        {props.node.date && <Typography style={{ fontSize: 14, color: dateTextColor }}>{props.node.date}</Typography>}
      </Box>
    );
  };

  return (
    <>
      {props.hasArrow ? arrowSVG() : null}
      {textareaComponent()}
    </>
  );
};

export default ProgressBarItem;
