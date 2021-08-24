import { Box } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { NextPage } from "next";
import Head from "next/head";
import React from "react";
import { Vertical } from "../../../models/vertical/vertical";
import BackTopFab from "../../common/back-top-fab/back-top-fab";
import Toolbar from "../../common/toolbar/toolbar";
import EditableColumnsDialog from "./components/editable-columns-dialog/editable-columns-dialog";
import Filters from "./components/filters/filters";
import Result from "./components/result/result";
import VerticalContainer from "./verticalContainer";

const useStyles = makeStyles(() =>
  createStyles({
    content: {
      maxWidth: 1260,
      minWidth: 500,
      margin: "auto",
      paddingTop: 46,
    },
  }),
);

interface VerticalContentProps {
  data: Array<Vertical>;
}

const VerticalContent: NextPage<VerticalContentProps> = (props) => {
  const classes = useStyles();

  return (
    <>
      <Head>
        <title>赛道体系 | RimeData</title>
      </Head>
      <VerticalContainer.Provider initialState={{ firstLevelVerticals: props.data }}>
        <Toolbar title="赛道体系" />
        <Box className={classes.content}>
          <Filters />
          <Result />
        </Box>
        <BackTopFab />
        <EditableColumnsDialog />
      </VerticalContainer.Provider>
    </>
  );
};

export default VerticalContent;
