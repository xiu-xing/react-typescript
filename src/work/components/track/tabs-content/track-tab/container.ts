import _ from "lodash";
import { useState } from "react";
import { createContainer } from "unstated-next";
import {
  EntityInput,
  FilterInputs,
  MultiSelectorFilterInput,
  SelectorFilterInput,
} from "../../../../generated/graphql";
import { TimelineData } from "../../../institution-tracking/tabs-content/track-tab/track-timeline";

function useGrid() {
  const [timelineFilters, setTimelineFilters] = useState<FilterInputs>();
  const [filterTag, setFilterTag] = useState("");
  const [gridFilters, setGridFilters] = useState<FilterInputs>({});

  const [timelineEntity, setTimelineEntity] = useState<EntityInput>();
  const [timelineData, setTimelineData] = useState<TimelineData>({ title: "", hasNextPage: false, timelineList: [] });

  return {
    filterTag,
    setFilterTag,
    timelineFilters,
    setTimelineFilters,
    gridFilters,
    setGridFilters,

    timelineEntity,
    setTimelineEntity,
    timelineData,
    setTimelineData,

    updateSelectorFilters: (filter: SelectorFilterInput) => {
      return setTimelineFilters((prev) => {
        const newFilters = _.clone(prev ?? {});
        if (!newFilters.selectorFilterInputs || newFilters.selectorFilterInputs.length === 0) {
          newFilters.selectorFilterInputs = [filter];
          return newFilters;
        }

        const index = newFilters.selectorFilterInputs.findIndex((item) => item && item.filterID === filter.filterID);

        if (index === -1) {
          newFilters.selectorFilterInputs.push(filter);
          return newFilters;
        }

        newFilters.selectorFilterInputs[index] = {
          filterID: filter.filterID,
          filterValue: filter.filterValue,
        };
        return newFilters;
      });
    },

    updateMultiSelectorFilters: (filter: MultiSelectorFilterInput) => {
      return setTimelineFilters((prev) => {
        const newFilters = _.clone(prev ?? {});
        if (!newFilters.multiSelectorFilterInputs || newFilters.multiSelectorFilterInputs.length === 0) {
          newFilters.multiSelectorFilterInputs = [filter];
          return newFilters;
        }

        const index = newFilters.multiSelectorFilterInputs.findIndex(
          (item) => item && item.filterID === filter.filterID,
        );

        if (index === -1) {
          newFilters.multiSelectorFilterInputs.push(filter);
          return newFilters;
        }

        newFilters.multiSelectorFilterInputs[index] = {
          filterID: filter.filterID,
          filterValues: filter.filterValues,
        };
        return newFilters;
      });
    },
  };
}

const TrackGridTabContainer = createContainer(useGrid);
export default TrackGridTabContainer;
