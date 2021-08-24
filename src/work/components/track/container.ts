import { useState } from "react";
import { createContainer } from "unstated-next";
import { TrackerTag, TrackerTheme } from "../../generated/graphql";

export interface InitialStates {
  trackTheme: TrackerTheme;
}

function useTrack(
  initialStates: InitialStates = {
    trackTheme: TrackerTheme.TrackerThemeEnterprise,
  },
) {
  const [trackTheme, setTrackTheme] = useState<TrackerTheme>(initialStates.trackTheme);
  const [userTagList, setUserTagList] = useState<TrackerTag[]>([]);

  return {
    trackTheme,
    setTrackTheme,
    userTagList,
    setUserTagList,
  };
}

const TrackContainer = createContainer(useTrack);
export default TrackContainer;
