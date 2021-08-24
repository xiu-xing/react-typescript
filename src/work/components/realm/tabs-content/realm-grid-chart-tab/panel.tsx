import { ButtonBase, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { Close } from "mdi-material-ui";
import React, { useMemo } from "react";
import SimpleBar from "simplebar-react";
import RealmDataChart from "../../../common/chart-next/data-chart/realm-data-chart";
import CommonGridContainer from "../../../common/common-grid-components/grid/container";
import { CommonGridColumn } from "../../../common/common-grid-components/grid/types";
import { GridColumn } from "../../../common/grid/core/types";
import RealmDataBlockSection from "../../../common/section-next/fetching/block/realm-data-block";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      width: "100%",
      padding: "24px  0 0 0 ",
      height: "100%",
      flex: 1,
    },
    title: {
      fontSize: 16,
      color: "#333",
    },
    closeButton: {
      color: "#999",
      borderRadius: "24px",
      position: "absolute",
      right: 24,
    },
  }),
);

const Panel: React.FunctionComponent = () => {
  const { columns, setColumns, insights, setInsights } = CommonGridContainer.useContainer();
  const classes = useStyles();

  const onCloseChartClick = () => {
    setInsights([]);

    const newColumns: GridColumn[] = [];

    columns.map((item) => {
      const column = item as CommonGridColumn;
      column.showChart = false;
      newColumns.push(column);
    });
    setColumns(newColumns);
  };

  const tabContent = useMemo(() => {
    return insights?.map((item) => {
      switch (item.type) {
        case "data_block":
          return (
            <div key={item.id} style={{ padding: "0 24px" }}>
              <Typography className={classes.title}>{item.title}</Typography>
              <RealmDataBlockSection blockID={item.id} />
            </div>
          );
        case "chart":
          return (
            <div key={item.id} style={{ padding: "0 24px" }}>
              <Typography className={classes.title}>{item.title}</Typography>
              <RealmDataChart realmChartID={item.id} />
            </div>
          );
        // case "info_flow": 暂时没有
        // return <InfoFlowTab  />;
      }
    });
  }, [classes.title, insights]);

  return (
    <div className={classes.root}>
      <SimpleBar style={{ height: "100%", overflow: "auto" }}>
        <ButtonBase onClick={onCloseChartClick} className={classes.closeButton}>
          <Close />
        </ButtonBase>
        {tabContent}
      </SimpleBar>
    </div>
  );
};

export default Panel;
