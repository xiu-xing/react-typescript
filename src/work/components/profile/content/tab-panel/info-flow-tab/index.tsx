import { CircularProgress, Fab, Fade } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { get, unionWith } from "lodash";
import { ChevronUp } from "mdi-material-ui";
import { OverlayScrollbarsComponent } from "overlayscrollbars-react";
import React, { useCallback, useEffect, useRef, useState } from "react";
import { useClient } from "urql";
import {
  EntityType,
  Filter,
  FilterInputs,
  InfoFlowDocument,
  InfoFlowItem,
  InfoFlowQuery,
  InfoFlowQueryVariables,
  InfoFlowTab as InfoFlowTabModel,
  PageInfo,
  Permission,
} from "../../../../../generated/graphql";
import { useFilterInputs } from "../../../../../utils/hooks";
import { getPaginationLimit } from "../../../../../utils/permission";
import { APPBAR_HEIGHT } from "../../../../app/skeleton/components/appbar-next";
import FilterContext from "../../../../common/filter-context";
import FilterItem from "../../../../common/filter-item";
import ACPlaceholder from "../../../../common/section/ac-placeholder";
import Space from "../../../../common/space";
import { useProfileEntity } from "../../../atoms";
import { TOOLBAR_HEIGHT } from "../../../toolbar";
import { TAB_HEIGHT } from "../../tabs/tab";
import InfoList from "./info-list";

const useStyles = makeStyles(() =>
  createStyles({
    root: (props) => ({
      maxHeight: `calc(100vh - ${APPBAR_HEIGHT + props["top"] ?? 0}px)`,
      overflowY: "auto",
      paddingLeft: 24,
      paddingRight: 24,
      "& .os-padding": {
        zIndex: "auto",
      },
    }),
    filters: {
      position: "sticky",
      top: 0,
      paddingLeft: 16,
      paddingTop: 32,
      paddingBottom: 8,
      maxWidth: 1300,
      margin: "auto",
      background: "white",
      zIndex: 1,
    },
    bottom: {
      textAlign: "center",
      padding: 16,
      color: "#666",
      minHeight: 64,
      position: "relative",
    },
    backToTop: {
      position: "fixed",
      right: 36,
      bottom: 36,
    },
  }),
);

interface InfoFlowTabProps {
  tab: InfoFlowTabModel;
}

const InfoFlowTab: React.FunctionComponent<InfoFlowTabProps> = (props) => {
  const { tab } = props;
  const [entity] = useProfileEntity();
  const invalidScrollHeight = TOOLBAR_HEIGHT + TAB_HEIGHT + 1;
  const classes = useStyles({ top: invalidScrollHeight });
  const [filterInputs, setFilterInputs] = useFilterInputs(tab?.filters as Filter[]);
  const rootRef = useRef<OverlayScrollbarsComponent | null>(null);
  const [pageIndex, setPageIndex] = useState(0);
  const [infos, setInfos] = useState<InfoFlowItem[]>([]);
  const [pageInfo, setPageInfo] = useState<Pick<PageInfo, "hasNextPage" | "endCursor">>({
    hasNextPage: true,
  });
  const client = useClient();
  const [fetching, setFetching] = useState(false);
  const [permissions, setPermissions] = useState<Permission[]>([]);
  const [showBackToTop, setShowBackToTop] = useState<boolean>(false);

  const fetchData = useCallback(
    async (entityId: string, entityType: EntityType, funcID: string, filters: FilterInputs, after?: string) => {
      const res = await client
        .query<InfoFlowQuery, InfoFlowQueryVariables>(InfoFlowDocument, {
          entityID: entityId,
          entityType: entityType,
          funcID: funcID,
          filters: filters,
          first: 10,
          after: after,
        })
        .toPromise();

      return res;
    },
    [tab],
  );

  useEffect(() => {
    setFetching(true);
    fetchData(entity.id, entity.type, tab.infoFlowID, filterInputs, pageInfo.endCursor as string)
      .then((res) => {
        const nodes: InfoFlowItem[] = get(res, ["data", "infoFlow", "nodes"]);
        const page: PageInfo = get(res, ["data", "infoFlow", "pageInfo"]);
        const permissions: Permission[] = get(res, ["data", "infoFlow", "permissions"]);
        setPermissions(permissions);
        setInfos((prev) => unionWith(prev, nodes, (a: InfoFlowItem, b: InfoFlowItem) => a.id === b.id));
        setPageInfo({
          hasNextPage: page?.hasNextPage,
          endCursor: page?.endCursor,
        });
      })
      .finally(() => setFetching(false));
  }, [pageIndex]);

  useEffect(() => {
    setFetching(true);
    rootRef.current?.osInstance()?.scroll(0);
    fetchData(entity.id, entity.type, tab.infoFlowID, filterInputs)
      .then((res) => {
        const nodes: InfoFlowItem[] = get(res, ["data", "infoFlow", "nodes"]);
        const page: PageInfo = get(res, ["data", "infoFlow", "pageInfo"]);
        const permissions: Permission[] = get(res, ["data", "infoFlow", "permissions"]);
        setPermissions(permissions);
        setInfos(nodes);
        setPageInfo({
          hasNextPage: page?.hasNextPage,
          endCursor: page?.endCursor,
        });
      })
      .finally(() => setFetching(false));
  }, [filterInputs]);

  const handleScroll = () => {
    const isTop = rootRef.current?.osInstance()?.scroll()?.ratio?.y !== 0;
    setShowBackToTop(isTop);
    if (
      rootRef.current?.osInstance()?.scroll()?.ratio?.y === 1 &&
      pageInfo.hasNextPage &&
      !fetching &&
      !getPaginationLimit(permissions)
    ) {
      setPageIndex((prev) => prev + 1);
    }
  };

  return (
    <FilterContext value={filterInputs}>
      <OverlayScrollbarsComponent
        className={classes.root}
        ref={rootRef}
        options={{
          overflowBehavior: {
            y: "s",
            x: "h",
          },
          scrollbars: {
            autoHide: "scroll",
          },
          callbacks: {
            onScroll: handleScroll,
          },
        }}
      >
        {tab.filters && tab.filters.length > 0 && (
          <div className={classes.filters}>
            <Space wrap size="large">
              {tab.filters.map((f, i) => (
                <FilterItem key={f?.id ?? "" + i} filter={f as Filter} onChange={setFilterInputs} />
              ))}
            </Space>
          </div>
        )}
        <InfoList items={infos} fetching={fetching} />
        <div className={classes.bottom}>
          {!!getPaginationLimit(permissions) && <ACPlaceholder />}
          {!getPaginationLimit(permissions) && fetching && <CircularProgress size={30} />}
          {!getPaginationLimit(permissions) && !fetching && infos?.length > 0 && !pageInfo.hasNextPage && "滑到底啦！"}
        </div>
        <Fade in={showBackToTop}>
          <Fab
            className={classes.backToTop}
            color="primary"
            onClick={(): void => {
              rootRef.current?.osInstance()?.scroll({ y: 0 }, 200, { y: "linear" });
            }}
          >
            <ChevronUp />
          </Fab>
        </Fade>
      </OverlayScrollbarsComponent>
    </FilterContext>
  );
};

export default InfoFlowTab;
