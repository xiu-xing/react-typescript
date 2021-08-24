import { useState } from "react";
import { createContainer } from "unstated-next";

function useGrid() {
  const [columnsEditorOpen, setColumnsEditorOpen] = useState(false);

  return {
    columnsEditorOpen,
    setColumnsEditorOpen,
  };
}

const GridTabContainer = createContainer(useGrid);
export default GridTabContainer;
