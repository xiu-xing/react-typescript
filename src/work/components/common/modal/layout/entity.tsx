import { Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { ReactNode } from "react";
import { RichTextModel } from "../../../../models/richText/index-next";
import RichTextNext from "../../rich-text-next";
import { useModalData } from "../atom";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      padding: 16,
    },
    title: {
      marginBottom: 10,
      fontSize: 14,
      color: "#333",
    },
    entityText: {
      fontSize: 14,
      lineHeight: "24px",
      wordBreak: "keep-all",
    },
  }),
);

export const EntityLayout: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  const [modalData] = useModalData();

  function text(): ReactNode {
    if (!modalData) {
      return null;
    }
    const textData = JSON.parse(modalData.get("data") as string);
    if (Array.isArray(textData) && textData.length && textData) {
      return (
        <RichTextNext models={textData.map((value: unknown) => RichTextModel.fromJSON(value))} />
        // <RichText
        //   classes={{ text: classes.entityText }}
        //   values={textData.map((value: unknown) => RichTextModel.fromJSON(value))}
        // />
      );
    }
    return null;
  }

  function contentComponent(): ReactNode {
    const data = modalData;
    if (data && data.size) {
      const title: unknown = data.get("title");
      return (
        <>
          <Typography className={classes.title}>{typeof title === "string" ? title : ""}</Typography>
          {text()}
        </>
      );
    }
    return null;
  }

  return <div className={classes.root}>{contentComponent()}</div>;
};
