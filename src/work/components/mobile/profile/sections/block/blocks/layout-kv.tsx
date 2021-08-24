import { ButtonBase, Theme } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import { ChevronDown, ChevronUp } from "mdi-material-ui";
import nanoid from "nanoid";
import React, { ReactNode, useEffect, useRef, useState } from "react";
import { Field, LayoutKvBlockFieldsFragment } from "../../../../../../generated/graphql";
import LayoutKVFieldItem from "./layout-kv-fieldItem";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "grid",
      gridRowGap: 12,
    },
    row: {
      display: "grid",
      gridAutoFlow: "column",
      gridColumnGap: 24,
      gridTemplateColumns: "1fr 1fr",
    },
    buttonIcon: {
      color: theme.palette.primary.main,
      fontSize: 20,
      borderRadius: 4,
    },
    hidden: {
      maxHeight: 140,
      overflow: "hidden",
      transition: "maxHeight 200ms ease-out",
    },
  }),
);

interface LayoutKVBlockProps {
  block: LayoutKvBlockFieldsFragment;
  foldNode: boolean;
}

const LayoutKVBlock: React.FunctionComponent<LayoutKVBlockProps> = (props) => {
  const classes = useStyles();
  const { block, foldNode } = props;

  const ref = useRef<HTMLDivElement>(null);
  const [open, setOpen] = useState(false);
  const [overflow, setOverflow] = useState(false);

  useEffect(() => {
    if (!ref.current) return;
    if (ref.current.scrollHeight > ref.current.clientHeight && !overflow) {
      setOverflow(true);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [ref.current]);

  function onButtonClick(): void {
    setOpen(!open);
  }

  function content(fieldList: Field[], index: number): ReactNode {
    if (fieldList.length === 1) {
      return (
        <LayoutKVFieldItem
          name={fieldList[0].name ?? ""}
          value={fieldList[0].value ?? ""}
          key={index}
          foldNode={foldNode}
        />
      );
    }

    return (
      <div key={index}>
        <div ref={ref} className={clsx(classes.row, foldNode && !open ? classes.hidden : "")}>
          {fieldList?.map((item, index) => (
            <LayoutKVFieldItem name={item.name ?? ""} value={item.value ?? ""} key={index} foldNode={foldNode} />
          ))}
        </div>
        {foldNode && overflow && (
          <div style={{ textAlign: "center" }}>
            <ButtonBase onClick={onButtonClick}>
              {!open ? <ChevronDown className={classes.buttonIcon} /> : <ChevronUp className={classes.buttonIcon} />}
            </ButtonBase>
          </div>
        )}
      </div>
    );
  }

  return (
    <div className={classes.root}>
      {block && block.blockFields?.map((fieldList, index) => content(fieldList as Field[], index))}
    </div>
  );
};

export default LayoutKVBlock;
