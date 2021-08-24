import { Box, CircularProgress, createStyles, makeStyles } from "@material-ui/core";
import nanoid from "nanoid";
import React, { useEffect, useState } from "react";
import SimpleBar from "simplebar-react";
import { FilterInputs, ProgressNode, useProgressBarQuery } from "../../../../../generated/graphql";
import { useProfileEntity } from "../../../../profile/atoms";
import ProgressBarItem from "./item";

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
    textareaBox: {
      display: "flex",
      flexDirection: "column",
      alignItems: "center",
      justifyContent: "center",
    },
    text: {
      fontSize: 14,
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

interface ProgressBarProp {
  id: string;
  filters?: FilterInputs;
}

const ProgressBar: React.FunctionComponent<ProgressBarProp> = (props) => {
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
        ) : nodes && nodes.length > 0 ? (
          nodes?.map((v, i) => {
            if (i < 50) {
              return <ProgressBarItem key={nanoid(8)} hasArrow={i !== 0} node={v} />;
            }
          })
        ) : (
          <div className={classes.onData}>暂无数据</div>
        )}
      </Box>
    </SimpleBar>
  );
};

export default ProgressBar;
