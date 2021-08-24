import _ from "lodash";
import { useState } from "react";
import { createContainer } from "unstated-next";
import {
  EntityInput,
  FilterInputs,
  MultiSelectorFilterInput,
  SelectorFilterInput,
  TrackerTheme,
} from "../../../../generated/graphql";
import { TimelineData } from "./track-timeline";

function useGrid() {
  const [paginationEditorOpen, setPaginationEditorOpen] = useState(false);
  const [gridFilterInputs, setGridFilterInputs] = useState<FilterInputs>();

  const [timelineFilters, setTimelineFilters] = useState<FilterInputs>();
  const [timelineEntity, setTimelineEntity] = useState<EntityInput>();
  const [timelineData, setTimelineData] = useState<TimelineData>({ title: "", hasNextPage: false, timelineList: [] });

  const [trackTheme, setTrackTheme] = useState<TrackerTheme>(TrackerTheme.TrackerThemeEnterprise);

  return {
    paginationEditorOpen,
    gridFilterInputs,

    setPaginationEditorOpen,
    setGridFilterInputs,

    timelineEntity,
    setTimelineEntity,

    timelineFilters,
    setTimelineFilters,
    timelineData,
    setTimelineData,

    trackTheme,
    setTrackTheme,

    updateGridSelectorFilters: (filter: SelectorFilterInput) => {
      setGridFilterInputs((prev) => {
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

        newFilters.selectorFilterInputs[index] = filter;
        return newFilters;
      });
    },

    // TODO laixy optimize
    updateTimelineSelectorFilters: (filter: SelectorFilterInput) => {
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

        newFilters.selectorFilterInputs[index] = filter;
        return newFilters;
      });
    },

    updateTimelineMultiSelectorFilters: (filter: MultiSelectorFilterInput) => {
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

        newFilters.multiSelectorFilterInputs[index] = filter;
        return newFilters;
      });
    },
  };
}

const InstitutionTrackGridTabContainer = createContainer(useGrid);
export default InstitutionTrackGridTabContainer;
