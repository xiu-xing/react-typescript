import { Box, Tab, Tabs, Typography, withStyles } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { ChangeEvent, useMemo, useState } from "react";
import ConfigContainer from "../../../../../containers/configContainer";
import { Filter, TableSection as TableSectionModel } from "../../../../../generated/graphql";
import { useFilterInputs } from "../../../../../utils/hooks";
import { getLockLimit } from "../../../../../utils/permission";
import DataTableNext from "../../../data-table-next";
import FilterItem from "../../../filter-item";
import Space from "../../../space";
import ACPlaceholder from "../../components/ac-placeholder";
import Footnotes from "../../components/footnotes";

const StyledTabs = withStyles((theme: Theme) =>
  createStyles({
    root: {
      minHeight: 34,
      "& .MuiTabs-flexContainer": {
        "& button:not(:last-child)": {
          marginRight: 24,
        },
      },
      marginBottom: 16,
    },
    indicator: {
      height: 3,
      backgroundColor: theme.palette.primary.main,
    },
  }),
)(Tabs);

const StyledTab = withStyles((theme: Theme) =>
  createStyles({
    root: {
      minWidth: 0,
      minHeight: 34,
      padding: "6px 4px",
      lineHeight: 1.72,
      textTransform: "none",
      whiteSpace: "pre",
    },
    textColorInherit: {
      color: "#999",
      opacity: 1,
    },
    selected: {
      color: theme.palette.primary.main,
    },
  }),
)(Tab);

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      padding: "32px 0",
      width: "100%",
    },
    title: {
      lineHeight: 1.5,
      fontSize: theme.typography.subtitle1.fontSize,
      fontWeight: theme.typography.fontWeightMedium,
    },
    titleCount: {
      marginLeft: 4,
      color: theme.palette.primary.main,
    },
    filters: {
      margin: "16px 0",
    },
    content: {
      position: "relative",
    },
    blur: {
      filter: "blur(4px)",
      userSelect: "none",
    },
    tabPanel: {
      padding: 0,
    },
  }),
);

interface TableSectionProps {
  section: TableSectionModel;
}

const TableSection = React.forwardRef<HTMLDivElement, TableSectionProps>(function TableSection(props, ref) {
  const classes = useStyles();
  const { section } = props;
  const [currentTableIndex, setCurrentTableIndex] = useState<number>(0);
  const [tableCountMap, setTableCountMap] = useState<Record<string, number>>(Object.create(null));
  const { tableConfigs } = ConfigContainer.useContainer();
  const [mixedFilterInputs, handleFilterInputChange] = useFilterInputs(section?.filters as Filter[]);

  const filters = useMemo(() => {
    if (!section.filters) return null;
    return (
      <div className={classes.filters}>
        <Space size="middle" wrap>
          {section.filters.map((f, i) => (
            <FilterItem key={i} filter={f} onChange={handleFilterInputChange} />
          ))}
        </Space>
      </div>
    );
  }, [section.filters]);

  const handleChange = (_: ChangeEvent<{}>, newValue: number) => {
    setCurrentTableIndex(newValue);
  };
console.log("addddddddddddddddddddddd",tableCountMap,tableConfigs);

  return (
    <div className={classes.root} ref={ref}>
      <Typography noWrap className={classes.title}>
        <span>{section.name}</span>
        {!!section.count && <span className={classes.titleCount}>{section.count}</span>}
      </Typography>
      <Box
        className={classes.content}
        style={{ ...(section && getLockLimit(section.permissions) && { minHeight: 100 }) }}
      >
        {section.tableIDs.length > 0 && (
          <Box className={clsx({ [classes.blur]: getLockLimit(section.permissions) })}>
            {filters}
            {section.tableIDs.length > 1 ? (
              <>
                <StyledTabs
                  action={(action) => setTimeout(() => action?.updateIndicator(), 1000)}
                  value={currentTableIndex}
                  onChange={handleChange}
                >
                  {section.tableIDs.map((t, i) => (
                    <StyledTab
                      key={t}
                      value={i}
                      label={
                        tableCountMap[t]
                          ? `${tableConfigs?.[t]?.["name"] ?? t} ${tableCountMap[t]}`
                          : tableConfigs?.[t]?.["name"] ?? t
                      }
                    />
                  ))}
                </StyledTabs>
                {section.tableIDs.map((tableId, i) => {
                  return (
                    <div className={classes.tabPanel} hidden={currentTableIndex !== i} key={tableId}>
                      <DataTableNext
                        id={tableId}
                        filter={mixedFilterInputs}
                        onTotalCountChange={(total) => setTableCountMap((prev) => ({ ...prev, [tableId]: total }))}
                        tableBottom={{
                          pagination: true,
                          download: true,
                          sectionName: section.name,
                        }}
                      />
                    </div>
                  );
                })}
              </>
            ) : (
              <DataTableNext
                id={section.tableIDs[0]}
                filter={mixedFilterInputs}
                tableBottom={{
                  pagination: true,
                  sectionName: section.name,
                  download: true,
                }}
              />
            )}
            <Footnotes footnotes={section.footnotes ?? []} />
          </Box>
        )}
        {getLockLimit(section.permissions) && <ACPlaceholder />}
      </Box>
    </div>
  );
});

export default TableSection;
