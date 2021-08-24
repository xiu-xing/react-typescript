import { Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { HTMLProps, ReactNode } from "react";
import { RichTextModel } from "../../../../../../models/richText/index";
import RichText from "../../../rich-text";
import ModalContainer from "../modalContainer";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      display: "grid",
      gridAutoFlow: "row",
      gridTemplateColumns: "120px 1fr",
      gridColumnGap: 16,
      marginBottom: 4,
    },
    fieldLabel: {
      wordBreak: "keep-all",
      whiteSpace: "nowrap",
      marginBottom: 4,
      "& p": {
        fontFamily: "Noto Sans SC",
        color: "#666",
        fontSize: 14,
      },
    },
    fieldValue: {
      fontWeight: 500,
    },
  }),
);

interface FieldProps extends HTMLProps<HTMLDivElement> {
  name: string;
  fieldId: string;
}

const Field: React.FunctionComponent<FieldProps> = (props) => {
  const classes = useStyles();
  const { fieldId, name, className, ...leftProps } = props;
  const { modalData } = ModalContainer.useContainer();

  function contentComponent(): ReactNode {
    if (!fieldId || !modalData) {
      return null;
    }
    const fieldData = modalData.get(fieldId);
    if (Array.isArray(fieldData) && fieldData.length && fieldData) {
      return (
        <div className={clsx(classes.root, className)} {...leftProps}>
          <div className={classes.fieldLabel}>
            <Typography>{name}</Typography>
          </div>
          <div className={classes.fieldValue}>
            <RichText showModal={false} values={fieldData.map((value: unknown) => RichTextModel.fromJSON(value))} />
          </div>
        </div>
      );
    }
    return null;
  }
  return <>{contentComponent()}</>;
};

export default Field;
