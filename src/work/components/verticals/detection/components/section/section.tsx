import { Button, Tooltip, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import { ArrowRightCircle, HelpCircleOutline } from "mdi-material-ui";
import React, { HTMLProps, ReactNode, useEffect, useState } from "react";
import { useVerticalRankingsQuery, VerticalRanking } from "../../../../../generated/graphql";
import Pagination from "../../../../common/pagination/pagination";
import NoDataPlaceholder from "../../../../common/placeholders/no-data-placeholder";
import DetectionContainer from "../../detectionContainer";
import DataCell from "../data-cell";
import SectionContainer from "./sectionContainer";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      maxWidth: "100%",
    },
    sectionBar: {
      display: "flex",
      alignItems: "center",
    },
    title: {
      fontWeight: 500,
      fontSize: 14,
    },
    helpIcon: {
      width: 16,
      height: 16,
      marginLeft: 2,
    },
    pagination: {
      marginLeft: 16,
    },
    sectionContent: {
      marginTop: 16,
      display: "flex",
      maxWidth: "100%",
      // overflow: "hidden",
    },
    leftContentBox: {
      display: "grid",
      gridAutoFlow: "row",
      gridTemplateColumns: "repeat(5, 100px)",
      gridTemplateRows: "repeat(3, 106px)",
      gridRowGap: 16,
      gridColumnGap: 16,
    },
    rightContentBox: {
      display: "flex",
      flexDirection: "column",
      marginLeft: 32,
      flex: 1,
    },
    detailBox: {
      display: "flex",
      alignItems: "center",
    },
    detailName: {
      fontSize: 14,
      color: "#666",
    },
    detailButton: {
      marginLeft: 4,
    },
    buttonIcon: {
      marginRight: 4,
      height: 16,
      width: 16,
    },
    chartBox: {
      display: "flex",
      flexDirection: "column",
      minHeight: 292,
      flex: 1,
    },
  }),
);

export interface SectionProps extends HTMLProps<HTMLDivElement> {
  title: string;
  tip: string;
  metricsID: string;
  chartComponent: ReactNode;
}

const PAGE_SIZE = 15;

const SectionDisplay: React.FunctionComponent<SectionProps> = (props) => {
  const classes = useStyles();

  const { title, tip, metricsID, chartComponent, className, ...restProps } = props;
  const { year, quarter } = DetectionContainer.useContainer();
  const { selectedVertical, setSelectedVertical } = SectionContainer.useContainer();

  const [page, setPage] = useState(1);
  const [totalPage, setTotalPage] = useState(0);
  const [noData, setNoData] = useState(false);
  const [dataList, setDataList] = useState<VerticalRanking[]>([]);
  const [verticalRankingsQueryResult] = useVerticalRankingsQuery({
    variables: {
      year: year,
      quarter: quarter,
      metricsID: metricsID,
    },
  });

  function onPrePageButtonClick(): void {
    setPage((pre) => (pre > 1 ? pre - 1 : 1));
  }

  function onNextPageButtonClick(): void {
    setPage((pre) => (pre < totalPage ? pre + 1 : totalPage));
  }

  useEffect(() => {
    setPage(1);
  }, [year, quarter]);

  useEffect(() => {
    if (verticalRankingsQueryResult.fetching) {
      return;
    }
    if (verticalRankingsQueryResult.data) {
      const data = verticalRankingsQueryResult.data.verticalRankings;
      if (data?.length) {
        setSelectedVertical(data[0] || undefined);
        setTotalPage(Math.ceil(data.length / PAGE_SIZE));
      }
      setDataList((data as VerticalRanking[]) || []);
      setNoData(!data || !data.length);
      return;
    }
    if (verticalRankingsQueryResult.error) {
      setSelectedVertical(undefined);
      setDataList([]);
      setNoData(true);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [verticalRankingsQueryResult]);

  function contentComponent(): ReactNode {
    if (noData) {
      return <NoDataPlaceholder />;
    }
    const renderList = dataList.slice((page - 1) * PAGE_SIZE, page * PAGE_SIZE);
    return (
      <>
        <div className={classes.leftContentBox}>
          {renderList.map((v, i) => {
            if (!v) {
              return null;
            }
            return (
              <DataCell
                key={v.verticalID as string}
                name={v.verticalName || `${i}`}
                value={v.score as number}
                onClick={(): void => {
                  if (selectedVertical?.verticalID !== v.verticalID) {
                    setSelectedVertical(v);
                  }
                }}
                selected={selectedVertical?.verticalID === v.verticalID}
              />
            );
          })}
        </div>
        <div className={classes.rightContentBox}>
          <div className={classes.detailBox}>
            <Typography className={classes.detailName}>{selectedVertical?.verticalName}</Typography>
            <Button
              className={classes.detailButton}
              size="small"
              color="primary"
              startIcon={<ArrowRightCircle />}
              classes={{
                startIcon: classes.buttonIcon,
              }}
              onClick={(): void => {
                if (selectedVertical && selectedVertical.verticalID) {
                  window.open(`/profile?id=${selectedVertical.verticalID}&type=VERTICAL`);
                }
              }}
            >
              查看详情
            </Button>
          </div>
          <div className={classes.chartBox}>{chartComponent}</div>
        </div>
      </>
    );
  }

  return (
    <div {...restProps} className={clsx(classes.root, className)}>
      <div className={classes.sectionBar}>
        <Typography className={classes.title}>{title}</Typography>
        <Tooltip title={tip}>
          <HelpCircleOutline fontSize="small" htmlColor="#666" className={classes.helpIcon} />
        </Tooltip>
        <Pagination
          loading={false}
          currentPage={page}
          totalPage={totalPage}
          onPrePageButtonClick={onPrePageButtonClick}
          onNextPageButtonClick={onNextPageButtonClick}
          classes={{
            root: classes.pagination,
          }}
        />
      </div>
      <div className={classes.sectionContent}>{contentComponent()}</div>
    </div>
  );
};

const Section: React.FunctionComponent<SectionProps> = (props) => {
  return (
    <SectionContainer.Provider>
      <SectionDisplay {...props} />
    </SectionContainer.Provider>
  );
};

export default Section;
