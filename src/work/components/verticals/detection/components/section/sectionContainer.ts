import { useState } from "react";
import { createContainer } from "unstated-next";
import { VerticalRanking } from "../../../../../generated/graphql";

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
function useSection() {
  const [selectedVertical, setSelectedVertical] = useState<VerticalRanking>();

  return {
    selectedVertical,
    setSelectedVertical,
  };
}

const SectionContainer = createContainer(useSection);
export default SectionContainer;
