import { useMemo, useState } from "react";
import { createContainer } from "unstated-next";
import { NavigationItemProps } from "../../common/navigation/navigation-item";
import { KeyValueMapResult } from "./hard-tech-vertical";

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
function useHardTechVertical(initialState?: KeyValueMapResult[]) {
  const [currentVertical, setCurrentVertical] = useState<KeyValueMapResult>();
  const [nodes, setNodes] = useState<KeyValueMapResult[]>(initialState ?? []);
  const firstLevelItems: NavigationItemProps[] = useMemo(() => {
    const items: NavigationItemProps[] = [];

    if (nodes) {
      nodes.map((vertical) => {
        items.push({
          type: "item",
          name: vertical.Name!,
          data: vertical,
        });
      });
    }
    setCurrentVertical(nodes[0] as KeyValueMapResult);
    return items;
  }, [nodes]);

  return {
    currentVertical,
    setCurrentVertical,

    nodes,
    setNodes,

    firstLevelItems,
  };
}

const HardTechVerticalContainer = createContainer(useHardTechVertical);

export default HardTechVerticalContainer;
