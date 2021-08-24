import { useMemo, useState } from "react";
import { createContainer } from "unstated-next";

export const DrawerOpenedWidth = 148;
export const DrawerClosedWidth = 56;

interface DrawerInitialState {
  drawerOpen: boolean;
}

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
function useDrawer(initialState: DrawerInitialState = { drawerOpen: true }) {
  const [drawerOpen, setDrawerOpen] = useState<boolean>(initialState.drawerOpen);

  const drawerWidth = useMemo(() => {
    if (drawerOpen) {
      return DrawerOpenedWidth;
    }
    return DrawerClosedWidth;
  }, [drawerOpen]);

  return {
    drawerWidth,
    drawerOpen,
    setDrawerOpen,
  };
}

const DrawerContainer = createContainer(useDrawer);
export default DrawerContainer;
