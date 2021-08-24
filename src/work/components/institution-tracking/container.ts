import { useState } from "react";
import { createContainer } from "unstated-next";
import { GraphVariables } from "../institution-next/container";

function useInstitutionTrack() {
  const [showTreeChart, setShowTreeChart] = useState(false);
  const [graphVariables, setGraphVariables] = useState<GraphVariables>();
  return {
    showTreeChart,
    setShowTreeChart,
    graphVariables,
    setGraphVariables,
  };
}

const InstitutionTrackContainer = createContainer(useInstitutionTrack);
export default InstitutionTrackContainer;
