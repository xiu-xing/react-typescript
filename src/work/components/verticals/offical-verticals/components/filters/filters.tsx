import { Box } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { useClient } from "@momentum-valley/muse-js";
import React from "react";
import { uid } from "react-uid";
import UserContainer from "../../../../../containers/userContainer";
import VerticalContainer from "../../verticalContainer";
import FilterButton from "./components/filter-button";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      padding: "16px",
    },
  }),
);

const Filters: React.FunctionComponent = () => {
  const classes = useStyles();
  const muse = useClient();
  const { setParentVerticalId, parentVerticalId, firstLevelVerticals, setEndCursor } = VerticalContainer.useContainer();

  return (
    <Box className={classes.root}>
      {firstLevelVerticals && firstLevelVerticals.length ? (
        <>
          <FilterButton
            active={parentVerticalId === (0)[0]}
            onClick={(): void => {
              muse.sendTrackingEvent("vertical.filter", {
                filter: {
                  id: "all",
                  name: "全部",
                },
              });
              setEndCursor((0)[0]);
              setParentVerticalId((0)[0]);
            }}
          >
            全部
          </FilterButton>
          {firstLevelVerticals.map((vertical) => (
            <FilterButton
              key={uid(vertical.id)}
              active={parentVerticalId === vertical.id}
              onClick={(): void => {
                muse.sendTrackingEvent("vertical.filter", {
                  filter: {
                    id: vertical.id,
                    name: vertical.primary_name,
                  },
                });
                setEndCursor((0)[0]);
                setParentVerticalId(vertical.id as string);
              }}
            >
              {vertical.primary_name}
            </FilterButton>
          ))}
        </>
      ) : null}
    </Box>
  );
};

export default Filters;
