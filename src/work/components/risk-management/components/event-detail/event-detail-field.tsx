import { StyledComponentProps, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import React from "react";
import { RichTextModel } from "../../../../models/richText/index";
import RichText, { RichTextClassKey, RichTextProps } from "../../../common/rich-text/rich-text";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      display: "grid",
      gridAutoFlow: "row",
      gridTemplateColumns: "200px 1fr",
      gridColumnGap: 16,
      lineHeight: 2.5,
      fontSize: 14,
      alignItems: "center",
    },
    label: {
      color: "#666",
      fontSize: 14,
    },
    value: {
      fontWeight: 500,
    },
  }),
);

type FieldClassKey = RichTextClassKey | "root" | "label" | "value";

interface FieldProps extends Omit<RichTextProps, "values" | "classes">, StyledComponentProps<FieldClassKey> {
  values: RichTextModel[] | string;
  label: string;
  richtext?: boolean;
  placeholder?: string;
}

const Field: React.FunctionComponent<FieldProps> = (props) => {
  const classes = useStyles();
  const { values, label, richtext, placeholder, ...restProps } = props;

  return (
    <div className={clsx(classes.root, props.classes?.root)}>
      <Typography className={clsx(classes.label, props.classes?.label)}>{label}</Typography>
      {richtext && typeof values != "string" ? (
        <div>
          <RichText values={values} {...restProps} />
        </div>
      ) : (
        <Typography className={clsx(classes.value, props.classes?.value)}>
          {values ? values : restProps.showPlaceHolder ? placeholder || "-" : ""}
        </Typography>
      )}
    </div>
  );
};

export default Field;
