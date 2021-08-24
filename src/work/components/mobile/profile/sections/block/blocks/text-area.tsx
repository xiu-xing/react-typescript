import { ButtonBase, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import _ from "lodash";
import { ChevronDown, ChevronUp } from "mdi-material-ui";
import React, { useEffect, useRef, useState } from "react";
import { TextAreaBlock as TextAreaBlockModel } from "../../../../../../generated/graphql";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    title: {
      fontSize: 14,
      color: "#666",
    },
    contentBox: {
      maxHeight: "unset",
      transition: "maxHeight 200ms ease-out",
    },
    hidden: {
      overflow: "hidden",
      display: "-webkit-box",
      "-webkit-line-clamp": 3,
      "-webkit-box-orient": "vertical",
    },
    buttonIcon: {
      color: theme.palette.primary.main,
      fontSize: 20,
      borderRadius: 4,
    },
  }),
);

interface TextAreaBlockProps {
  block: TextAreaBlockModel;
}

const TextAreaBlock: React.FunctionComponent<TextAreaBlockProps> = (props) => {
  const classes = useStyles();
  const [open, setOpen] = useState(false);
  const [overflow, setOverflow] = useState(false);
  const areaRef = useRef<HTMLDivElement>(null);
  const [content, setContent] = useState("");

  function onButtonClick(): void {
    setOpen(!open);
  }

  useEffect(() => {
    const jsonValue = JSON.parse(props.block.content);
    setContent(_.get(jsonValue[0], "value"));
    if (areaRef.current) {
      if (areaRef.current.clientHeight < areaRef.current.scrollHeight) setOverflow(true);
    }
  }, [areaRef.current]);

  return (
    <div>
      <div className={classes.contentBox}>
        <Typography ref={areaRef} className={clsx(classes.title, open ? "" : classes.hidden)}>
          {content}
        </Typography>
      </div>
      {overflow && (
        <div style={{ textAlign: "center" }}>
          <ButtonBase onClick={onButtonClick}>
            {!open ? <ChevronDown className={classes.buttonIcon} /> : <ChevronUp className={classes.buttonIcon} />}
          </ButtonBase>
        </div>
      )}
    </div>
  );
};

export default TextAreaBlock;
