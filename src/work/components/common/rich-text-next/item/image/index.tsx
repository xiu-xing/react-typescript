import { ButtonBase } from "@material-ui/core";
import { createStyles, makeStyles, StyledComponentProps } from "@material-ui/core/styles";
import { Provider } from "jotai";
import nanoid from "nanoid";
import React, { createContext, HTMLProps } from "react";
import { onAction, onActionNext } from "../../../../../models/action/action-next";
import { RichTextModel } from "../../../../../models/richText/index-next";
import InstitutionContainer from "../../../../institution-next/container";
import InstitutionTrackContainer from "../../../../institution-tracking/container";
import Modal from "../../../modal";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    image: {
      width: 16,
      height: 16,
      objectFit: "contain",
      pointerEvents: "none",
      // margin: "0px 3px",
    },
    modal: {
      display: "flex",
    },
  }),
);

export const ActionEvent = createContext<HTMLDivElement | null>(null);

interface ImageElementProps extends HTMLProps<HTMLElement>, StyledComponentProps {
  model: RichTextModel;
  showModal?: boolean;
}

const Image: React.FunctionComponent<ImageElementProps> = (props) => {
  const classes = useStyles();
  const dataSource = props.model;
  const modal = dataSource.modal;

  function component(): React.ReactNode {
    const actionObject = dataSource.action;

    if (actionObject && actionObject.type && dataSource["value"] != "-") {
      let onClick: VoidFunction | undefined = undefined;
      onClick = onAction(actionObject);

      try {
        onClick = onActionNext(InstitutionContainer.useContainer(), actionObject);
      } catch (error) {}

      try {
        onClick = onActionNext(InstitutionTrackContainer.useContainer(), actionObject);
      } catch (error) {}

      return (
        <ButtonBase
          onClick={(e) => {
            e.stopPropagation();
            onClick && onClick();
          }}
        >
          <img className={classes.image} src={props.model.value} />
        </ButtonBase>
      );
    } else if (modal && modal.type && props.showModal !== false) {
      return (
        <Provider key={nanoid(8)}>
          <Modal key={modal.args.toString()} modal={modal} className={classes.modal}>
            <img className={classes.image} src={props.model.value} />
          </Modal>
        </Provider>
      );
    } else {
      return <img className={classes.image} src={props.model.value} />;
    }
  }

  return <React.Fragment>{component()}</React.Fragment>;
};

export default Image;
