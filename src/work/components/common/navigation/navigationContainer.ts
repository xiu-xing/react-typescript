import { useState } from "react";
import { createContainer } from "unstated-next";

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
function useNavigation() {
  const [activeValue, setActiveValue] = useState<string>();
  const [activeCollapseValue, setActiveCollapseValue] = useState<string>();

  return {
    activeValue,
    setActiveValue,
    activeCollapseValue,
    setActiveCollapseValue,
  };
}

const NavigationContainer = createContainer(useNavigation);
export default NavigationContainer;
