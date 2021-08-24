import { Column } from "@devexpress/dx-react-grid";
import {
  Grid as DxGrid,
  Table as DxTable,
  TableHeaderRow as DxTableHeaderRow,
} from "@devexpress/dx-react-grid-material-ui";
import { createStyles, makeStyles, Box, Theme } from "@material-ui/core";
import _ from "lodash";
import { Check, Close } from "mdi-material-ui";
import React, { useCallback } from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    title: {
      fontSize: 14,
      color: "#333",
      fontWeight: 500,
    },
    grid: {
      borderRadius: "4px",
      border: "1px solid rgba(0, 0, 0, 0.12)",
      "& .MuiTable-root .MuiTableBody-root .MuiTableRow-root:last-child td": {
        borderBottom: "none",
      },
      "& table > thead > tr > th:not(:nth-last-of-type(2))": {
        borderRight: "1px solid rgba(0, 0, 0, 0.12) !important",
      },
      "& table > tbody > tr > td:not(:nth-last-of-type(2))": {
        borderRight: "1px solid rgba(0, 0, 0, 0.12) !important",
      },
    },
    icon: {
      fontSize: 24,
      color: theme.palette.primary.main,
    },
    iconcontent: {
      fontWeight: 500,
      color: theme.palette.primary.main,
    },
    free: {
      color: "#666666",
      fontWeight: 500,
    },
    cell: {
      whiteSpace: "pre-wrap",
      padding: "10px 16px !important",
      fontSize: 14,
      color: "#333",
      fontWeight: 400,
    },
    headerCell: {
      paddingLeft: "40px !important",
      paddingRight: "40px !important",
    },
  }),
);

export interface RightsRow {
  product: string;
  free: string;
  personal?: string;
}

export interface RightsGridProps {
  rows: RightsRow[];
  columns: Column[];
  columnExtensions?: DxTable.ColumnExtension[];
}

const RightsGrid: React.FunctionComponent<RightsGridProps> = ({ rows, columns, columnExtensions }) => {
  const classes = useStyles();

  const iconComponent = (icon: string, name: string) => {
    if (icon == "check") return <Check className={name != "free" ? classes.icon : classes.free} />;
    if (icon == "close") return <Close className={name != "free" ? classes.icon : classes.free} />;
    return <div className={name != "free" ? classes.iconcontent : classes.free}>{icon}</div>;
  };

  const cellComponent = useCallback((props) => {
    const alignment = _.get(props.column, "align") ?? "left";
    const icon = _.get(props.column, "icon") ?? false;

    return (
      <DxTable.Cell {...props} className={classes.cell} style={{ textAlign: alignment }}>
        {icon ? iconComponent(props.row[props.column.name], props.column.name) : props.row[props.column.name]}
      </DxTable.Cell>
    );
  }, []);

  return (
    <Box className={classes.grid}>
      <DxGrid rows={rows} columns={columns}>
        <DxTable
          columnExtensions={columnExtensions}
          tableComponent={(props) => <DxTable.Table {...props} style={{ minWidth: 100 }} />}
          cellComponent={cellComponent}
        />
        <DxTableHeaderRow
          cellComponent={(props) => {
            return (
              <DxTableHeaderRow.Cell {...props} className={classes.headerCell}>
                <DxTableHeaderRow.Content column={props.column} align={props.column["align"]}>
                  <span className={classes.title}>{props.column.title}</span>
                </DxTableHeaderRow.Content>
              </DxTableHeaderRow.Cell>
            );
          }}
        />
      </DxGrid>
    </Box>
  );
};

export default RightsGrid;
