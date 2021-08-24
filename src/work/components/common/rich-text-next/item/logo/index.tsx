import { createStyles, makeStyles, StyledComponentProps } from "@material-ui/core/styles";
import { Provider } from "jotai";
import nanoid from "nanoid";
import { useRouter } from "next/dist/client/router";
import React, { createContext, HTMLProps, useContext } from "react";
import { RimePlaceholderImg } from "../../../../../assets/svg/placeholder";
import { onAction } from "../../../../../models/action/action-next";
import { RichTextModel } from "../../../../../models/richText/index-next";
import Modal from "../../../modal";

const useStyles = makeStyles((theme) =>
  createStyles({
    root: {
      verticalAlign: "middle",
      width: 20,
      height: 20,
      objectFit: "contain",
      pointerEvents: "none",
      borderRadius: "2px",
      marginRight: 4,
    },
  }),
);

export const ActionEvent = createContext<HTMLDivElement | null>(null);

interface LogoElementProps extends HTMLProps<HTMLElement>, StyledComponentProps {
  model: RichTextModel;
  showModal?: boolean;
}

const Logo: React.FunctionComponent<LogoElementProps> = (props) => {
  const classes = useStyles();
  const router = useRouter();
  const actionEvent = useContext(ActionEvent);
  const dataSource = props.model;
  const modal = dataSource.modal;

  function component(): React.ReactNode {
    const actionObject = dataSource.action;

    if (actionObject && actionObject.type && dataSource["value"] != "-") {
      return props.model.value ? (
        <img onClick={onAction(actionObject)} className={classes.root} src={props.model.value} />
      ) : (
        <RimePlaceholderImg className={classes.root} />
      );
    }

    if (modal && modal.type && props.showModal !== false) {
      return (
        <Provider key={nanoid(8)}>
          <Modal key={modal.args.toString()} modal={modal}>
            {props.model.value ? (
              <img className={classes.root} src={props.model.value} />
            ) : (
              <RimePlaceholderImg className={classes.root} />
            )}
          </Modal>
        </Provider>
      );
    }

    return props.model.value ? (
      <img className={classes.root} src={props.model.value} />
    ) : (
      <RimePlaceholderImg className={classes.root} />
    );
  }

  return <React.Fragment>{component()}</React.Fragment>;
};

export default Logo;
