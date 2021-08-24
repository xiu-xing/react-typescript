import _ from "lodash";
import { useEffect, useState } from "react";
import { createContainer } from "unstated-next";
import { useKeyValueMapQuery } from "../../../generated/graphql";
import { Vertical } from "../../../models/vertical/vertical";
import { config } from "./config";
import UserContainer from "../../../containers/userContainer";
import { useClient } from "@momentum-valley/muse-js";

interface SortingProps {
  order_field: string;
  order_type: "DESC" | "ASC";
}

interface VerticalInitialState {
  firstLevelVerticals: Array<Vertical>;
}

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
function useVertical(initialState: VerticalInitialState = { firstLevelVerticals: [] }) {
  const [parentVerticalId, setParentVerticalId] = useState<string>();

  // 编辑列相关
  const [editionDialogOpen, setEditionDialogOpen] = useState<boolean>(false);
  const [selectedColumnIds, setSelectedColumnIds] = useState<Array<string>>([]);
  const [sorting, setSorting] = useState<SortingProps | undefined>({
    order_type: "DESC",
    order_field: "number_of_companies",
  });

  const [count, setCount] = useState(0);
  const [secondLevelVerticals, setSecondLevelVerticals] = useState<Array<Vertical>>([]);
  const [hasNextPage, setHasNextPage] = useState<boolean>(true);
  const [endCursor, setEndCursor] = useState<string>();
  const { user } = UserContainer.useContainer();
  const muse = useClient();
  const [first] = useState(20);
  const [secondLevelVerticalQueryResult, executeSecondLevelVerticalQuery] = useKeyValueMapQuery({
    requestPolicy: "network-only",
    variables: {
      funcID: "pevc.vertical_statistic",
      requestBody: JSON.stringify({
        first: first,
        parent_vertical_id: parentVerticalId,
        after: endCursor,
        ...sorting,
      }),
    },
    pause: true,
  });

  useEffect(() => {
    if (secondLevelVerticalQueryResult.data && !secondLevelVerticalQueryResult.fetching) {
      const mapData = JSON.parse(secondLevelVerticalQueryResult.data.keyValueMap?.data as string);
      const endCursor = _.get(mapData, "page_info.end_cursor");
      setEndCursor(endCursor);

      const hasNextPage = _.get(mapData, "page_info.has_next_page");
      setHasNextPage(hasNextPage);

      const newData: Vertical[] = _.get(mapData, "nodes");

      if (Array.isArray(newData)) {
        setSecondLevelVerticals([...secondLevelVerticals, ...newData]);
      }
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [secondLevelVerticalQueryResult]);

  useEffect(() => {
    if (hasNextPage) {
      muse.sendTrackingEvent("vertical.load_more", {
        filter: {
          id: parentVerticalId ?? "all",
          name: parentVerticalId
            ? initialState.firstLevelVerticals.filter((f) => f.id == parentVerticalId)[0].primary_name
            : "全部",
        },
      });

      executeSecondLevelVerticalQuery();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [count]);

  useEffect(() => {
    setSecondLevelVerticals([]);
    executeSecondLevelVerticalQuery();

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [parentVerticalId]);

  useEffect(() => {
    setEndCursor(undefined);
    // executeSecondLevelVerticalQuery();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [sorting]);

  useEffect(() => {
    if (!endCursor) {
      setSecondLevelVerticals([]);
      executeSecondLevelVerticalQuery();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [endCursor]);

  useEffect(() => {
    setSorting({
      order_type: "DESC",
      order_field: "number_of_companies",
    });
    if (config && config.defaultColumns) {
      setSelectedColumnIds(config.defaultColumns);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return {
    hasNextPage,
    setEndCursor,
    parentVerticalId,
    setParentVerticalId,
    secondLevelVerticals,
    setSecondLevelVerticals,
    firstLevelVerticals: initialState.firstLevelVerticals,
    secondLevelVerticalQueryResult,
    fetching: secondLevelVerticalQueryResult.fetching,
    loadMore: (): void => {
      setCount((prev) => prev + 1);
    },

    user,
    editionDialogOpen,
    setEditionDialogOpen,
    selectedColumnIds,
    setSelectedColumnIds,
    sorting,
    setSorting,
  };
}

const VerticalContainer = createContainer(useVertical);
export default VerticalContainer;
