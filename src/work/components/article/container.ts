import { useState } from "react";
import { createContainer } from "unstated-next";

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
function useArticle() {
  const [numberOfUsedCount, setNumberOfUsedCount] = useState<number>();
  const [numberOfUnusedCount, setNumberOfUnusedCount] = useState<number>();
  const [limitedDialogOpen, setLimitedDialogOpen] = useState(false);

  return {
    numberOfUsedCount,
    setNumberOfUsedCount,
    numberOfUnusedCount,
    setNumberOfUnusedCount,
    limitedDialogOpen,
    setLimitedDialogOpen,
  };
}

const ArticleContainer = createContainer(useArticle);
export default ArticleContainer;
