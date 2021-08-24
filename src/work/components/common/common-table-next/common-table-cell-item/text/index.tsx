import { Typography } from "@material-ui/core";
import { createStyles, makeStyles, StyledComponentProps } from "@material-ui/core/styles";
import clsx from "clsx";
import { Provider } from "jotai";
import nanoid from "nanoid";
import { useRouter } from "next/dist/client/router";
import React, { createContext, HTMLProps, useContext } from "react";
import { onAction } from "../../../../../models/action/action-next";
import { RichTextModel } from "../../../../../models/richText/index-next";
import Modal from "../../../modal";

const useStyles = makeStyles((theme) =>
  createStyles({
    root: {},
    link: {
      fontWeight: 500,
      color: theme.palette.primary.main,
      textDecoration: "none",
    },
    linkText: {
      fontWeight: 500,
    },
    text: {
      whiteSpace: "pre-wrap",
      wordBreak: "break-all",
      fontSize: 14,
      fontFamily: "Noto Sans SC",
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
  // const { customEventManager } = CustomEventContainer.useContainer();
  // const { setModalOpen } = ModalContainer.useContainer();
  const classes = useStyles();
  const router = useRouter();
  const actionEvent = useContext(ActionEvent);
  const dataSource = props.model;

  // Display text
  function textComponent(): React.ReactNode {
    const actionObject = dataSource.action;

    if (actionObject && actionObject.type && dataSource["value"] != "-") {
      return (
        <Typography
          onClick={onAction(actionObject)}
          style={{ cursor: "pointer" }}
          className={clsx(classes.link, classes.linkText, classes.text, props.classes ? props.classes.text : "")}
        >
          {dataSource["value"]}
        </Typography>
      );
    } else {
      return (
        <Typography
          component="span"
          className={clsx(classes.text, props.classes ? props.classes.text : "", dataSource.isBold ? classes.bold : "")}
        >
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

  return <React.Fragment>{contentComponent()}</React.Fragment>;
};

export default Text;
