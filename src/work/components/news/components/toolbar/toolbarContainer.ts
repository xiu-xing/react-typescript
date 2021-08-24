import { useState } from "react";
import { createContainer } from "unstated-next";

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
function useToolbar() {
  const [search, setSearch] = useState(false);

  return {
    search,
    setSearch,
  };
}

const ToolbarContainer = createContainer(useToolbar);
export default ToolbarContainer;
