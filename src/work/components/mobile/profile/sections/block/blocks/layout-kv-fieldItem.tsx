import { ButtonBase, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import { ChevronDown, ChevronUp } from "mdi-material-ui";
import React, { useEffect, useRef, useState } from "react";
import { getRichTextComponent } from "../action";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    fieldLabel: {
      color: "#999",
      fontSize: 12,
      lineHeight: "16px",
    },
    fieldValue: {
      maxHeight: 120,
      overflow: "hidden",
      transition: "maxHeight 200ms ease-out",
      "& span": {
        lineHeight: "24px",
      },
    },
    hidden: {
      maxHeight: "unset",
    },
    buttonIcon: {
      color: theme.palette.primary.main,
      fontSize: 20,
      borderRadius: 4,
    },
  }),
);

interface LayoutKVBlockProps {
  name: string;
  value: string;
  foldNode: boolean;
}

const LayoutKVFieldItem: React.FunctionComponent<LayoutKVBlockProps> = (props) => {
  const classes = useStyles();
  const { name, value, foldNode } = props;
  const ref = useRef<HTMLDivElement>(null);
  const [open, setOpen] = useState(false);
  const [expanded, setExpanded] = useState(false);

  useEffect(() => {
    if (!ref.current) return;
    if (ref.current.scrollHeight > ref.current.clientHeight && !expanded) {
      setExpanded(true);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [ref.current]);

  function onButtonClick(): void {
    setOpen(!open);
  }

  return (
    <div>
      <Typography className={classes.fieldLabel}>{name}</Typography>
      <div ref={ref} className={clsx(classes.fieldValue, !foldNode && !open ? "" : classes.hidden)}>
        {value && getRichTextComponent(value)}
      </div>
      {!foldNode && expanded && (
        <div style={{ textAlign: "center" }}>
          <ButtonBase onClick={onButtonClick}>
            {!open ? <ChevronDown className={classes.buttonIcon} /> : <ChevronUp className={classes.buttonIcon} />}
          </ButtonBase>
        </div>
      )}
    </div>
  );
};

export default LayoutKVFieldItem;
