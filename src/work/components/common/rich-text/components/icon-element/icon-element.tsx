import { Tooltip, Typography } from "@material-ui/core";
import { createStyles, makeStyles, StyledComponentProps } from "@material-ui/core/styles";
import clsx from "clsx";
import { Cellphone, Check, Email } from "mdi-material-ui";
import React, { HTMLProps, ReactNode } from "react";
import CopyToClipboard from "react-copy-to-clipboard";
import { RichTextModel } from "../../../../../models/richText/index";
import SnackbarContainer from "../../../snackbar/snackbarContainer";
import { SVGNew } from "./assets";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    newIcon: {
      display: "flex",
      alignItems: "center",
      justifyContent: "flex-end",
    },
    icon: {
      fontSize: 16,
      color: "#5F6064",
      margin: "0px 4px",
    },
    tooltip: {
      fontSize: 14,
    },
  }),
);

interface IconCellProps extends HTMLProps<HTMLElement>, StyledComponentProps {
  dataSource: RichTextModel;
}

const IconElement: React.FunctionComponent<IconCellProps> = (props) => {
  const classes = useStyles();
  const { openSnackbar } = SnackbarContainer.useContainer();

  function onCopy(value: string, result: boolean): void {
    if (result) {
      openSnackbar("复制成功", "success");
    }
  }

  function iconComponent(): React.ReactNode {
    switch (props.dataSource["icon"]) {
      case "phone":
        return props.dataSource["value"] ? (
          <Cellphone className={clsx(classes.icon, props.classes ? props.classes.icon : "")} />
        ) : (
          <Cellphone style={{ opacity: 0.4 }} className={clsx(classes.icon, props.classes ? props.classes.icon : "")} />
        );
      case "email":
        return props.dataSource["value"] ? (
          <Email className={clsx(classes.icon, props.classes ? props.classes.icon : "")} />
        ) : (
          <Email style={{ opacity: 0.4 }} className={clsx(classes.icon, props.classes ? props.classes.icon : "")} />
        );
      case "check":
        return <Check className={clsx(classes.icon, props.classes ? props.classes.icon : "")} />;
      case "new":
        return (
          <div className={classes.newIcon}>
            <SVGNew />
          </div>
        );
      default:
        return null;
    }
  }

  function contentComponent(): ReactNode {
    if (props.dataSource["value"]) {
      return (
        <Tooltip classes={{ tooltip: classes.tooltip }} title={props.dataSource["value"]}>
          <CopyToClipboard text={props.dataSource["value"]} onCopy={onCopy}>
            <Typography component="span" className={classes.root}>
              {iconComponent()}
            </Typography>
          </CopyToClipboard>
        </Tooltip>
      );
    } else {
      return (
        <Typography component="span" className={classes.root}>
          {iconComponent()}
        </Typography>
      );
    }
  }

  return <>{contentComponent()}</>;
};

export default IconElement;
