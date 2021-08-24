import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React from "react";
import { RimePlaceholderImg } from "../../../../../../../common/entity-avatar-next/assets";
import { getActionHandler } from "../../../action";
import { RichTextModel } from "../../model";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    image: {
      width: 20,
      height: 20,
      objectFit: "contain",
      pointerEvents: "none",
      borderRadius: "2px",
      marginRight: 4,
    },
  }),
);

interface LogoProps {
  model: RichTextModel;
}

const Logo: React.FunctionComponent<LogoProps> = (props) => {
  const classes = useStyles();
  const { model } = props;
  const { value, action } = model;

  return value ? (
    <img onClick={action ? getActionHandler(action) : undefined} className={classes.image} src={value} />
  ) : (
    <RimePlaceholderImg className={classes.image} />
  );
};

export default Logo;
