import { Box, CircularProgress, createStyles, makeStyles } from "@material-ui/core";
import React, { useEffect, useState } from "react";
import SimpleBar from "simplebar-react";
import { FilterInputs, ProgressNode, useProgressBarQuery } from "../../../../../generated/graphql";
import { useProfileEntity } from "../../../../profile/atoms";
import ProgressBar from "../../core/progress-bar";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      display: "flex",
      flexDirection: "row",
      justifyContent: "space-between",
      alignItems: "center",
      padding: "24px 0px 32px 0px",
      minWidth: 500,
    },
    onData: {
      width: "100%",
      minHeight: 100,
      fontSize: 16,
      color: "#666",
      display: "grid",
      placeItems: "center",
    },
  }),
);

interface DataProgressBarProp {
  id: string;
  filters?: FilterInputs;
}

const DataProgressBar: React.FunctionComponent<DataProgressBarProp> = (props) => {
  const classes = useStyles();
  const { id, filters } = props;

  const [entity] = useProfileEntity();
  const [nodes, setNodes] = useState<ProgressNode[] | null>();
  const [fetching, setFetching] = useState(true);
  const [progressBarQueryResult, executeQuery] = useProgressBarQuery({
    variables: {
      progressBarID: id,
      entityID: entity.id,
      entityType: entity.type,
      filters: filters,
    },
    pause: true,
  });

  useEffect(() => {
    executeQuery();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [filters, entity]);

  useEffect(() => {
    setFetching(progressBarQueryResult.fetching);
    if (
      !progressBarQueryResult ||
      !progressBarQueryResult.data ||
      !progressBarQueryResult.data.progressBar ||
      progressBarQueryResult.error
    ) {
      return;
    }
    setNodes(progressBarQueryResult.data.progressBar.progressNodes);
  }, [progressBarQueryResult]);

  return (
    <SimpleBar>
      <Box className={classes.root}>
        {fetching ? (
          <Box className={classes.onData}>
            <CircularProgress size={30} />
          </Box>
        ) : (
          <ProgressBar nodes={nodes ?? []} />
        )}
      </Box>
    </SimpleBar>
  );
};

export default DataProgressBar;
