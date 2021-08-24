import { Box, CircularProgress, Typography, useMediaQuery, useTheme } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { unionWith } from "lodash";
import { AccountTie } from "mdi-material-ui";
import { OverlayScrollbarsComponent } from "overlayscrollbars-react";
import "overlayscrollbars/css/OverlayScrollbars.css";
import React, { useEffect, useMemo, useRef, useState } from "react";
import { useClient } from "urql";
import {
  PageInfo,
  SearchTemplate,
  SearchTemplatesDocument,
  SearchTemplatesQuery,
  SearchTemplatesQueryVariables,
  SearchTemplatesSortBy,
} from "../../generated/graphql";
import Bill from "../../icons/Bill";
import Bud from "../../icons/Bud";
import Building from "../../icons/Building";
import Chuang from "../../icons/Chuang";
import Enterprise from "../../icons/Enterprise";
import Flag from "../../icons/Flag";
import GiveMoney from "../../icons/GiveMoney";
import Ke from "../../icons/Ke";
import MainChinese from "../../icons/MainChinese";
import Person from "../../icons/Person";
import SortCube from "../../icons/SortCube";
import ThreeDiode from "../../icons/ThreeDiode";
import { APPBAR_HEIGHT } from "../app/skeleton/components/appbar-next/index-next";
import { Realm, REALMTITLE } from "../realm/types";
import Filters from "./filters";
import TemplateCard from "./template-card";

const realmLogo = {
  "pevc.enterprise": Enterprise,
  "pevc.event": Bill,
  "pevc.fund": Bud,
  "pevc.institution": Building,
  "pevc.vertical_builder": Flag,
  "pevc.lp": GiveMoney,
  "pevc.entrepreneur": AccountTie,
  "pevc.professional_investor": Person,
  "secondary_market.a_share_company_realm": ThreeDiode,
  "secondary_market.a_share_issuance_realm": SortCube,
  "secondary_market.growth_enterprise_board_under_review_realm": Chuang,
  "secondary_market.main_board_under_review_realm": MainChinese,
  "secondary_market.star_market_under_review_realm": Ke,
};

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      maxHeight: `calc(100vh - ${APPBAR_HEIGHT}px)`,
      overflowY: "auto",
      overflowX: "hidden",
    },
    tip: {
      fontSize: "0.875rem",
      color: "#666",
      lineHeight: 1.72,
    },
    card: {
      cursor: "pointer",
      display: "grid",
      placeItems: "center",
      padding: 30,
      "&:hover": {
        borderColor: theme.palette.primary.main,
      },
    },
  }),
);

interface TemplatesProps {
  hasNoTemplate?: boolean;
}

const Templates: React.FC<TemplatesProps> = ({ hasNoTemplate = true }) => {
  const classes = useStyles();
  const client = useClient();
  const [fetching, setFetching] = useState(true);
  const [templates, setTemplates] = useState<SearchTemplate[]>([]);
  const [pageInfo, setPageInfo] = useState<Pick<PageInfo, "hasNextPage" | "endCursor">>({
    hasNextPage: true,
  });
  const theme = useTheme();
  const downMd = useMediaQuery(theme.breakpoints.down("md"));
  const ref = useRef<OverlayScrollbarsComponent | null>(null);
  const [displayTemplates, setDisplayTemplates] = useState<SearchTemplate[]>([]);
  const [filter, setFilter] = useState<{ sortBy: SearchTemplatesSortBy; realmId?: string }>();
  const templatesQuery = (sortBy = SearchTemplatesSortBy.LastViewedAt, realmID?: string, after?: string) => {
    return client
      .query<SearchTemplatesQuery, SearchTemplatesQueryVariables>(
        SearchTemplatesDocument,
        {
          first: 20,
          isDesc: true,
          after: after,
          sortBy: sortBy,
          realmID: realmID,
        },
        { requestPolicy: "network-only" },
      )
      .toPromise();
  };

  const Logo = useMemo(() => realmLogo[filter?.realmId as Realm], [filter]);

  useEffect(() => {
    setDisplayTemplates([...templates]);
  }, [templates]);

  const loadMore = async () => {
    setFetching(true);
    const { data } = await templatesQuery(filter?.sortBy, filter?.realmId, pageInfo.endCursor ?? undefined);
    setFetching(false);

    setTemplates((prev) =>
      unionWith(prev, (data?.searchTemplates?.nodes as SearchTemplate[]) ?? [], (a, b) => a.id === b.id),
    );

    setPageInfo({
      hasNextPage: data?.searchTemplates.pageInfo.hasNextPage as boolean,
      endCursor: data?.searchTemplates.pageInfo.endCursor,
    });
  };

  const handleScroll = () => {
    if (pageInfo.hasNextPage && ref.current?.osInstance()?.scroll().ratio.y === 1) {
      loadMore();
    }
  };

  const deleteTemplate = (id: string) => setDisplayTemplates((prev) => prev.filter((f) => f.id !== id));

  const handleFilterChange = async (sortBy: SearchTemplatesSortBy, realmId?: string) => {
    setFilter({ sortBy, realmId });
    setFetching(true);
    const { data } = await templatesQuery(sortBy, realmId);
    setFetching(false);

    setTemplates((data?.searchTemplates?.nodes as SearchTemplate[]) ?? []);
    setPageInfo({
      hasNextPage: data?.searchTemplates.pageInfo.hasNextPage as boolean,
      endCursor: data?.searchTemplates.pageInfo.endCursor,
    });
  };

  return (
    <OverlayScrollbarsComponent
      ref={ref}
      className={classes.root}
      options={{
        overflowBehavior: {
          x: "h",
          y: "s",
        },
        scrollbars: {
          autoHide: "l",
        },
        callbacks: {
          onScroll: handleScroll,
        },
      }}
    >
      <Box
        marginX="auto"
        maxWidth={1364}
        position="sticky"
        top={0}
        paddingTop="24px"
        paddingBottom="12px"
        bgcolor="white"
        zIndex="2"
        paddingX="24px"
      >
        <Typography style={{ fontSize: 20 }}>搜索模版</Typography>
        <Box height={16} />
        {!hasNoTemplate && <Filters onChange={handleFilterChange} />}
      </Box>
      {hasNoTemplate ? (
        <Box
          paddingX="24px"
          maxWidth={1364 - 224 * 2}
          marginX="auto"
          minHeight="calc(100vh - 240px)"
          display="flex"
          flexDirection="column"
          justifyContent="center"
        >
          <Typography noWrap align="center" style={{ color: "#333", fontWeight: 500 }}>
            您还未创建过搜索模版
          </Typography>
          <Box height={8} />
          <Typography noWrap align="center" style={{ color: "#666", fontSize: 14 }}>
            点击下方模块创建新的模版
          </Typography>
          <Box
            paddingY="32px"
            display="grid"
            gridColumnGap={downMd ? "40px" : "80px"}
            gridRowGap={downMd ? "32px" : "52px"}
            gridTemplateColumns="repeat(auto-fill,minmax(157px,1fr))"
          >
            {Object.entries(REALMTITLE).map(([k, v]) => {
              const Logo = realmLogo[k as Realm];
              return (
                <Box
                  key={k}
                  className={classes.card}
                  border="1px solid #EEE"
                  borderRadius="4px"
                  onClick={() => window.open(`/realm/${k}`)}
                >
                  <Logo color="primary" style={{ fontSize: (k as Realm) === "pevc.entrepreneur" ? 44 : 48 }} />
                  <Box height={8} />
                  <Typography noWrap style={{ userSelect: "none", fontSize: 14, fontWeight: 500, color: "#333" }}>
                    {v}
                  </Typography>
                </Box>
              );
            })}
          </Box>
        </Box>
      ) : (
        <Box maxWidth={1364} paddingX="24px" marginX="auto">
          {!fetching && displayTemplates.length <= 0 ? (
            <Box
              paddingX="24px"
              display="flex"
              flexDirection="column"
              justifyContent="center"
              alignItems="center"
              minHeight="calc(100vh - 500px)"
            >
              {!filter?.realmId ? (
                <Typography noWrap className={classes.tip}>
                  暂无数据
                </Typography>
              ) : (
                <>
                  <Typography noWrap align="center" style={{ color: "#333", fontWeight: 500 }}>
                    您还未创建过搜索模版
                  </Typography>
                  <Box height={8} />
                  <Typography noWrap align="center" style={{ color: "#666", fontSize: 14 }}>
                    点击下方模块创建新的模版
                  </Typography>
                  <Box height={32} />
                  <Box
                    className={classes.card}
                    width={157}
                    border="1px solid #EEE"
                    borderRadius="4px"
                    onClick={() => window.open(`/realm/${filter.realmId}`)}
                  >
                    <Logo color="primary" style={{ fontSize: 44 }} />
                    <Box height={8} />
                    <Typography noWrap style={{ userSelect: "none", fontSize: 14, fontWeight: 500, color: "#333" }}>
                      {REALMTITLE[filter.realmId]}
                    </Typography>
                  </Box>
                </>
              )}
            </Box>
          ) : (
            <Box
              paddingTop="12px"
              display="grid"
              gridGap="24px"
              gridTemplateColumns="repeat(auto-fill,minmax(311px,1fr))"
            >
              {displayTemplates.map((t) => (
                <TemplateCard key={t?.id as string} template={t} onDelete={deleteTemplate} />
              ))}
            </Box>
          )}
          <Box padding="24px 0" display="grid" alignItems="center" justifyItems="center">
            {fetching && <CircularProgress size={30} />}
            {!fetching && displayTemplates.length > 0 && !pageInfo.hasNextPage && (
              <Typography noWrap className={classes.tip}>
                滑到底啦！
              </Typography>
            )}
          </Box>
        </Box>
      )}
    </OverlayScrollbarsComponent>
  );
};

export default Templates;
