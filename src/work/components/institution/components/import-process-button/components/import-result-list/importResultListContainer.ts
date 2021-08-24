import { createContainer } from "unstated-next";
import { useState } from "react";
import {
  MatchingTask,
  MatchItem,
  EntityType,
  useGetEntitiesCountFromRelevantGroupsByTaskQuery,
} from "./../../../../../../generated/graphql";

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
function useImportResultListContainer() {
  const [confirmDialogOpen, setConfirmDialogOpen] = useState(false);
  const [showDataDialogOpen, setShowDataDialogOpen] = useState(false);
  const [importRecord, setImportRecord] = useState<MatchingTask>(Object.create(null));
  const [pageInfo, setPageInfo] = useState<{ first: number }>({ first: 5 });
  const [totalCount, setTotalCount] = useState<number>(5);
  const [matchedData, setMatchedData] = useState<MatchingTask[]>([]);
  const [clickLoadMore, setClickLoadMore] = useState<boolean>(false);
  const [mismatch, setMismatch] = useState<string[]>([]);
  const [mismatchCount, setMismatchCount] = useState<number>(0);
  const [showMatchError, setShowMatchError] = useState<number[]>([]);

  const [
    getEntitiesCountFromRelevantGroupsByTaskQueryResult,
    executeGetEntitiesCountFromRelevantGroupsByTaskQuery,
  ] = useGetEntitiesCountFromRelevantGroupsByTaskQuery({
    variables: {
      importID: importRecord.importID ?? "",
      taskID: importRecord.taskID ?? "",
    },
    requestPolicy: "network-only",
  });

  return {
    confirmDialogOpen,
    setConfirmDialogOpen,
    showDataDialogOpen,
    setShowDataDialogOpen,
    importRecord,
    setImportRecord,
    pageInfo,
    setPageInfo,
    totalCount,
    setTotalCount,
    matchedData,
    setMatchedData,
    clickLoadMore,
    setClickLoadMore,
    mismatch,
    setMismatch,
    mismatchCount,
    setMismatchCount,
    showMatchError,
    setShowMatchError,
    getEntitiesCountFromRelevantGroupsByTaskQueryResult,
    executeGetEntitiesCountFromRelevantGroupsByTaskQuery,
  };
}

const ImportResultListContainer = createContainer(useImportResultListContainer);
export default ImportResultListContainer;
