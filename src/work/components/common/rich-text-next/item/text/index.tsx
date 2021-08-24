import { Typography } from "@material-ui/core";
import { createStyles, makeStyles, StyledComponentProps } from "@material-ui/core/styles";
import clsx from "clsx";
import { Provider } from "jotai";
import nanoid from "nanoid";
import React, { createContext, HTMLProps } from "react";
import AppContainer from "../../../../../containers/appContainer";
import { onAction, onActionNext } from "../../../../../models/action/action-next";
import { RichTextModel } from "../../../../../models/richText/index-next";
import Modal from "../../../modal";

const useStyles = makeStyles((theme) =>
  createStyles({
    root: {},
    link: {
      fontWeight: 500,
      color: theme.palette.primary.main,
      textDecoration: "none",
      overflow: "hidden",
      textOverflow: "ellipsis",
    },
    linkText: {
      fontWeight: 500,
    },
    text: {
      verticalAlign: "middle",
      whiteSpace: "pre-wrap",
      fontSize: 14,
      fontFamily: "Noto Sans SC",
      wordBreak: "break-all",
    },
    bold: {
      color: "#333 !important",
    },
  }),
);

export const ActionEvent = createContext<HTMLDivElement | null>(null);

interface TextElementProps extends HTMLProps<HTMLElement>, StyledComponentProps {
  model: RichTextModel;
  showModal?: boolean;
}

const Text: React.FunctionComponent<TextElementProps> = (props) => {
  const appContainer = AppContainer.useContainer();
  const classes = useStyles();
  const dataSource = props.model;

  // Display text
  function textComponent(): React.ReactNode {
    const actionObject = dataSource.action;

    function onClickHandler(event: React.MouseEvent<HTMLSpanElement, MouseEvent>) {
      event.stopPropagation();
      onAction(actionObject);
    }

    if (actionObject && actionObject.type && dataSource["value"] != "-") {
      return (
        <Typography
          component="span"
          onClick={(event: { stopPropagation: () => void }) => {
            onActionNext(appContainer, actionObject);
            event.stopPropagation();
          }}
          style={{ cursor: "pointer" }}
          className={clsx(
            classes.root,
            classes.link,
            classes.linkText,
            classes.text,
            props.classes ? props.classes.text : "",
          )}
        >
          {dataSource["value"]}
        </Typography>
      );
    } else {
      return (
        <Typography component="span" className={classes.text}>
          {dataSource["value"]}
        </Typography>
      );
    }
  }

  function contentComponent(): React.ReactNode {
    if (props.showModal === false) {
      return textComponent();
    }
    const modal = dataSource.modal;
    if (modal && modal.type) {
      return (
        <Provider key={nanoid(8)}>
          <Modal key={modal.args.toString()} modal={modal}>
            {textComponent()}
          </Modal>
        </Provider>
      );
    } else {
      return textComponent();
    }
  }

  return <>{contentComponent()}</>;
};

export default Text;
