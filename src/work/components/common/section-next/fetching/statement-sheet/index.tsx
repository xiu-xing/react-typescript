import { Box, IconButton, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import GetAppIcon from "@material-ui/icons/GetApp";
import clsx from "clsx";
import React, { useMemo, useState } from "react";
import { Filter, StatementSheetSection as StatementSheetSectionModel } from "../../../../../generated/graphql";
import { useFilterInputs } from "../../../../../utils/hooks";
import { getLockLimit } from "../../../../../utils/permission";
import { useProfileEntity } from "../../../../profile/atoms";
import ExportDialog, { ExportType } from "../../../dialog/exporter-dialog/export-dialog";
import FilterItem from "../../../filter-item";
import Space from "../../../space";
import StatementSheet from "../../../statement-sheet";
import ACPlaceholder from "../../components/ac-placeholder";

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
  }),
);

interface StatementSheetSectionProps {
  section: StatementSheetSectionModel;
}

const StatementSheetSection = React.forwardRef<HTMLDivElement, StatementSheetSectionProps>(
  function StatementSheetSection(props, ref) {
    const classes = useStyles();
    const { section } = props;
    const [entity] = useProfileEntity();
    const [exportDialogOpen, setExportDialogOpen] = useState(false);
    const [mixedFilterInputs, handleFilterInputChange] = useFilterInputs(section?.filters as Filter[]);

    const filters = useMemo(() => {
      if (!section.filters) return null;
      return (
        <Box style={{ display: "flex", flexDirection: "row" }}>
          <div className={classes.filters}>
            <Space size="middle" wrap>
              {section.filters.map((f, i) => (
                <FilterItem key={f.id ?? "" + i} filter={f} onChange={handleFilterInputChange} />
              ))}
              <IconButton
                size="small"
                onClick={(): void => {
                  setExportDialogOpen(true);
                }}
              >
                <GetAppIcon />
              </IconButton>
            </Space>
          </div>
        </Box>
      );
      // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [section.filters]);

    return (
      <div className={classes.root} ref={ref}>
        <Typography noWrap className={classes.title}>
          <span>{section.name}</span>
        </Typography>
        <Box
          className={classes.content}
          style={{ ...(section && getLockLimit(section.permissions) && { minHeight: 100 }) }}
        >
          {section.statementSheetIDs.length > 0 && (
            <Box className={clsx({ [classes.blur]: getLockLimit(section.permissions) })}>
              {filters}
              <StatementSheet
                id={section.statementSheetIDs[0]}
                filter={mixedFilterInputs}
                entityId={entity.id}
                entityType={entity.type}
              />
            </Box>
          )}
          {getLockLimit(section.permissions) && <ACPlaceholder />}
        </Box>
        <ExportDialog
          open={exportDialogOpen}
          close={(): void => {
            setExportDialogOpen(false);
          }}
          dialogTitle={"我的导出"}
          exportType={ExportType.ProfileStatementSheet}
          exportStatementSheetVariables={{
            entityID: entity.id,
            entityType: entity.type,
            statementSheetID: section.statementSheetIDs[0],
            filters: mixedFilterInputs,
            entityName: entity.name,
          }}
        />
      </div>
    );
  },
);

export default StatementSheetSection;
