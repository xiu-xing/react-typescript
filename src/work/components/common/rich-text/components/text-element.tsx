import { Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles, StyledComponentProps } from "@material-ui/core/styles";
import clsx from "clsx";
import nanoid from "nanoid";
import { useRouter } from "next/dist/client/router";
import React, { createContext, HTMLProps, useContext } from "react";
import { getRoutePathByAction } from "../../../../models/action/action";
import { RichTextModel } from "../../../../models/richText/";
import Modal from "./modal/modal";
import ModalContainer from "./modal/modalContainer";

const useStyles = makeStyles((theme: Theme) =>
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
      whiteSpace: "pre-line",
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
  dataSource: RichTextModel;
  showModal?: boolean;
}

const TextElement: React.FunctionComponent<TextElementProps> = (props) => {
  // const { customEventManager } = CustomEventContainer.useContainer();
  // const { setModalOpen } = ModalContainer.useContainer();
  const classes = useStyles();
  const router = useRouter();
  const actionEvent = useContext(ActionEvent);

  // Display text
  function textComponent(): React.ReactNode {
    const dataSource = props.dataSource;
    const actionObject = dataSource.action;
    const actionType = dataSource.action?.type;
    const entityID = dataSource.action?.args?.[0];
    const entityType = dataSource.action?.args?.[1];
    if (actionObject && actionObject.type && dataSource["value"] != "-") {
      const url = getRoutePathByAction(actionObject);
      const currentUrl = router.asPath;

      const self = currentUrl.split("#")[0] === url.split("#")[0];

      return (
        <a
          className={clsx(classes.link, props.classes ? props.classes.link : "")}
          href={url}
          target={self ? "_self" : "_blank"}
          onClick={(event): void => {
            //阻止其他点击事件
            // setModalOpen(false);
            event.stopPropagation();
            currentUrl === url && event.preventDefault();
            if (actionEvent) {
              const newCustomEvent = new CustomEvent("hashchange", { detail: { hash: url.split("#")[1] } });

              actionEvent.dispatchEvent(newCustomEvent);
            }
          }}
        >
          <Typography
            component="span"
            className={clsx(classes.linkText, classes.text, props.classes ? props.classes.text : "")}
          >
            {dataSource["value"]}
          </Typography>
        </a>
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
    const modalConfig = props.dataSource.modal;
    if (modalConfig && modalConfig.type) {
      return (
        <ModalContainer.Provider key={nanoid(8)} initialState={{ modal: modalConfig }}>
          <Modal key={modalConfig.args.toString()} modal={modalConfig}>
            {textComponent()}
          </Modal>
        </ModalContainer.Provider>
      );
    } else {
      return textComponent();
    }
  }

  return <React.Fragment>{contentComponent()}</React.Fragment>;
};

export default TextElement;
