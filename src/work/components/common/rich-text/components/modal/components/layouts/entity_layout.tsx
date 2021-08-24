import { Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { ReactNode } from "react";
import ModalContainer from "../../modalContainer";
import Text from "../text";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      padding: 16,
    },
    title: {
      marginBottom: 10,
    },
    entityText: {
      fontSize: 14,
      lineHeight: "24px",
      wordBreak: "keep-all",
    },
  }),
);

const EntityLayout: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  const modalContainer = ModalContainer.useContainer();

  function contentComponent(): ReactNode {
    const data = modalContainer.modalData;
    if (data && data.size) {
      const title: unknown = data.get("title");
      return (
        <>
          <Typography className={classes.title}>{typeof title === "string" ? title : ""}</Typography>
          <Text className={classes.entityText} fieldId="entity_data" />
        </>
      );
    }
    return null;
  }

  return <div className={classes.root}>{contentComponent()}</div>;
};

export default EntityLayout;
