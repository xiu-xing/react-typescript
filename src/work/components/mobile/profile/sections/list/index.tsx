import { Box, fade, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { useAtom } from "jotai";
import React, { ReactNode, useEffect, useRef, useState } from "react";
import { useClient } from "urql";
import {
  EntityType,
  FilterInputs,
  ListDocument,
  ListNode,
  ListQuery,
  ListQueryVariables,
  ListSection as ListSectionModal,
  Tag as TagModel,
} from "../../../../../generated/graphql";
import { RimePlaceholderImg } from "../../../../common/entity-avatar-next/assets";
import EntityAvatar from "../../../../common/entity-avatar-next/entity-avatar";
import { subProfileAtom, subProfileEntityNameAtom, subProfileTabActiveIndexAtom } from "../../../sub-profile/states";
import { SVGRisk } from "../../assets";
import NoData from "../../no-data";
import BlockSection from "../block";
import { ActionModel, getActionHandler } from "../block/action";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "grid",
      gridRowGap: 34,
    },
    listItemLogo: {
      maxWidth: 30,
      minWidth: 30,
      maxHeight: 30,
      minHeight: 30,
      marginRight: 10,
      borderRadius: 2,
      objectFit: "contain",
    },
    listItemTitle: {
      fontWeight: 500,
      fontSize: 16,
      color: "#333",
      marginRight: 8,
    },
    title: {
      display: "flex",
      alignItems: "center",
      flex: 1,
    },
    titleBox: {
      display: "flex",
      paddingBottom: 16,
      justifyContent: "space-between",
    },
    blocksBox: {
      display: "grid",
      gridRowGap: 12,
    },
    trailingTitle: {
      color: "#999",
      fontSize: 14,
    },
    icon: {
      fontSize: 16,
      marginRight: 2,
    },
    riskBox: {
      paddingLeft: 4,
      display: "flex",
      alignItems: "center",
    },
    loadingBox: {
      width: "100%",
      justifyContent: "center",
      textAlign: "center",
    },
    button: {
      position: "fixed",
      right: 40,
      bottom: 40,
    },
    noData: {
      fontSize: 12,
      color: "#999",
      textAlign: "center",
    },
    labelBox: {
      width: "max-content",
      borderRadius: 2,
      padding: 4,
      backgroundColor: fade(theme.palette.primary.main, 0.12),
      color: theme.palette.primary.main,
    },
    label: {
      fontSize: 12,
      lineHeight: 1.2,
      fontWeight: theme.typography.fontWeightMedium,
    },
  }),
);

interface ListSectionProps {
  section: ListSectionModal;
  entityId: string;
  entityType: EntityType;
  filters?: FilterInputs;
}

const ListSection: React.FunctionComponent<ListSectionProps> = ({ section, entityId, entityType, filters }) => {
  const classes = useStyles();
  const client = useClient();
  const [tabActiveIndex] = useAtom(subProfileTabActiveIndexAtom);
  const [subProfileState] = useAtom(subProfileAtom);
  const [subProfileEntityName] = useAtom(subProfileEntityNameAtom);
  const [showLogo, setShowLogo] = useState(false);
  const [foldNode, setFoldNode] = useState(false);
  const [fetching, setFetching] = useState(true);
  const [list, setList] = useState<ListNode[]>([]);
  const [page, setPage] = useState(1);
  const [showNoData, setShowNodata] = useState(false);
  const fetchingRef = useRef(fetching);
  const hasNextPageRef = useRef(true);
  const tabActiveIndexRef = useRef(tabActiveIndex);

  const pageSize = 10;

  // eslint-disable-next-line react-hooks/exhaustive-deps
  function executeListQuery(after?: string) {
    if (after && !hasNextPageRef.current) return;

    let newList = Array.from(list ?? []);
    if (!after) newList = [];

    client
      .query<ListQuery, ListQueryVariables>(ListDocument, {
        entityID: entityId,
        entityType: entityType,
        listID: section.listIDs[0],
        filters: filters,
        first: pageSize,
        after: after,
      })
      .toPromise()
      .then((res) => {
        setFetching((fetchingRef.current = false));

        if (res.error) return setShowNodata(true);

        const connection = res.data?.list?.connection;
        const showLogo = res.data?.list?.showLogo ?? false;
        const foldNode = res.data?.list?.foldNode ?? false;

        if (!connection?.nodes && !after) {
          setList([]);
          return setShowNodata(true);
        }

        if (connection) {
          const hasNextPage = connection.pageInfo.hasNextPage;

          hasNextPageRef.current = hasNextPage;
          setList(newList.concat(connection.nodes as ListNode[]));
          setShowLogo(showLogo);
          setFoldNode(foldNode);
        }
      });
  }
  useEffect(() => {
    tabActiveIndexRef.current = tabActiveIndex;
  }, [tabActiveIndex]);

  const scrollHandler = () => {
    const sections = subProfileState?.sections ?? [];
    const activeSection = sections[tabActiveIndexRef.current];

    if (section.id != activeSection?.id) return;

    if (!hasNextPageRef.current || fetchingRef.current) return;
    let scrollTop = document.documentElement.scrollTop;
    if (scrollTop == 0) {
      scrollTop = document.body.scrollTop;
    }
    if (scrollTop == 0 && document.scrollingElement?.scrollTop) {
      scrollTop = document.scrollingElement.scrollTop;
    }
    if (document.documentElement.scrollHeight - document.documentElement.clientHeight - scrollTop <= 100) {
      setFetching(true);
      fetchingRef.current = true;
      setPage((prev) => prev + 1);
    }
  };

  useEffect(() => {
    if (page != 1) {
      const after = btoa(((page - 1) * pageSize - 1).toString());
      executeListQuery(after);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [page]);

  useEffect(() => {
    hasNextPageRef.current = true;
    setList([]);
    setPage(1);
    setShowLogo(false);
    setShowNodata(false);
    setFetching(true);
    fetchingRef.current = true;

    executeListQuery();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [filters]);

  useEffect(() => {
    window.addEventListener("scroll", scrollHandler);
    return (): void => {
      window.removeEventListener("scroll", scrollHandler);
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  function getTag(tag: TagModel, index: number): ReactNode {
    const nodes: ReactNode[] = [];
    switch (tag.__typename) {
      case "RiskTag":
        if (tag.level) {
          for (let i = 0; i < tag.level; i++) {
            nodes.push(<SVGRisk key={i} className={classes.icon} />);
          }
        }
        return (
          <div className={classes.riskBox} key={index}>
            {nodes}
          </div>
        );
      case "TextTag":
        return (
          <Box
            key={tag.name as string}
            className={classes.labelBox}
            onClick={tag.action ? getActionHandler(ActionModel.fromJSON(tag.action)) : undefined}
          >
            <Typography noWrap className={classes.label}>
              {tag.name}
            </Typography>
          </Box>
        );
      default:
        return null;
    }
  }

  function logoComponent(url: string | undefined | null): ReactNode {
    if (!showLogo) return null;
    return <EntityAvatar src={url ?? undefined} className={classes.listItemLogo} />;

    if (!url) return <RimePlaceholderImg className={classes.listItemLogo} />;

    return <img className={classes.listItemLogo} src={url ?? undefined} />;
  }

  function content(list: ListNode[]): ReactNode {
    return list.map(
      (listItem, index) =>
        listItem && (
          <div
            key={index}
            onClick={getActionHandler(
              ActionModel.fromJSON(listItem.action),
              listItem.title ?? undefined,
              subProfileEntityName,
            )}
          >
            {listItem.title && (
              <div className={classes.titleBox}>
                <div className={classes.title}>
                  {logoComponent(listItem.logoURI)}
                  <Typography className={classes.listItemTitle}>{listItem.title}</Typography>
                  {listItem.tags && listItem.tags.map((tag, index) => tag && getTag(tag, index))}
                </div>
                <Typography noWrap className={classes.trailingTitle}>
                  {listItem.trailingTitle}
                </Typography>
              </div>
            )}
            <div className={classes.blocksBox}>
              {listItem.blocks?.map((block, index) => {
                return (
                  block && (
                    <BlockSection
                      block={block}
                      key={index}
                      entityId={entityId}
                      entityType={entityType}
                      foldNode={foldNode}
                    />
                  )
                );
              })}
            </div>
          </div>
        ),
    );
  }

  return (
    <div className={classes.root} style={{ marginTop: showNoData ? 180 : 0 }}>
      {content(list)}
      {/* {fetching && <LoadingIndicator />} */}
      {!hasNextPageRef.current && <div className={classes.noData}>滑到底啦</div>}
      {showNoData && <NoData />}
    </div>
  );
};

export default ListSection;
