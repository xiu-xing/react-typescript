import { Box, useMediaQuery } from "@material-ui/core";
import { createStyles, makeStyles, Theme, useTheme } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { useEffect, useMemo, useState } from "react";
import ConfigContainer from "../../../../containers/configContainer";
import { SheetTab } from "../../../../generated/graphql";
import CommonGridContainer from "../../../common/common-grid-components/grid/container";
import { CommonGridConfig } from "../../../common/common-grid-components/grid/types";
import ConditionDialog from "../../../common/condition-dialog";
import { Config } from "../../../common/condition-dialog/types";
import ConditionTagGroupArea from "../../../common/condition-tag-group-area";
import ColumnsEditor from "./columns-editor";
import ConditionFilter from "./condition-filter";
import InstitutionGridTabContainer from "./container";
import InstitutionDataGrid from "./data-grid";
import GridPaginationBar from "./pagination-bar";
import Prefix from "./pagination-bar/prefix";
import Suffix from "./pagination-bar/suffix";
import Panel from "./panel";
import RowOperationsBar from "./row-operation-bar";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      margin: "0 16px",
    },
    sheetChart: {
      display: "flex",
      height: "100%",
    },
    SMScreenStyle: {
      height: "100%",
      "& .TabContent": {
        display: "none !important",
      },
    },
    contentBox: {
      width: "100%",
      height: "100%",
      overflowY: "hidden",
    },
    sheetDefault: {
      height: "100%",
      display: "flex",
    },
    filterArea: {
      padding: "16px 24px 6px",
      display: "grid",
      gridAutoFlow: "row",
      gridRowGap: 12,
    },
    TabContent: {
      flex: 1,
      overflowX: "auto",
      height: "100%",
      display: "grid",
      borderRight: "1px solid rgb(224, 224, 224)",
      gridTemplateRows: "auto auto auto 1fr",
    },
    fundManagerTabContent: {
      gridTemplateRows: "auto auto 1fr",
    },
  }),
);

interface InstitutionGridTabProps {
  tab: SheetTab;
}

const InstitutionGridTab: React.FunctionComponent<InstitutionGridTabProps> = (props) => {
  const classes = useStyles();
  const { tab } = props;
  const theme = useTheme();
  const { trealmSheetConfigs, trealmConditionConfigs } = ConfigContainer.useContainer();
  const { conditions, setConditions, updateCondition } = InstitutionGridTabContainer.useContainer();

  const { insights, setPage, setUseQueryEndCursor, setRowSelections } = CommonGridContainer.useContainer();

  const downSM = useMediaQuery(theme.breakpoints.down("sm"));
  const [gridConfig, setGridConfig] = useState<CommonGridConfig>();
  const [conditionConfig, setConditionConfig] = useState<Config>();
  const [showConditionDialog, setShowConditionDialog] = useState(false);

  const [useSMStyle, setUseSMStyle] = useState(false);

  useEffect(() => {
    setPage(1);
    setUseQueryEndCursor(null);
    setRowSelections([]);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [conditions]);

  useEffect(() => {
    if (!trealmSheetConfigs) return;
    const gridConfig = trealmSheetConfigs[tab.id] ? CommonGridConfig.fromJSON(trealmSheetConfigs[tab.id]) : undefined;
    setGridConfig(gridConfig);

    if (!trealmConditionConfigs) return;
    const conditionConfig = trealmConditionConfigs[tab.id] as Config;
    setConditionConfig(conditionConfig);
  }, [tab.id, trealmConditionConfigs, trealmSheetConfigs]);

  const computedCondtionsConfigMap = useMemo(() => {
    return new Map(
      Object.entries(conditionConfig?.condition_map ?? {}).map(([id, config]) => {
        return [
          id,
          {
            mutiOperator: config.input.operators.filter((o) => !o.is_locked).length > 1,
          },
        ];
      }),
    );
  }, [conditionConfig]);

  useEffect(() => {
    const hasRightComponent = insights.length > 0;

    setUseSMStyle(downSM && hasRightComponent);
  }, [insights, downSM]);

  return (
    <>
      <div className={clsx(classes.sheetDefault, useSMStyle && classes.SMScreenStyle)}>
        {gridConfig && (
          <div className={clsx(classes.TabContent, "TabContent", !conditionConfig && classes.fundManagerTabContent)}>
            {conditionConfig && (
              <Box className={classes.filterArea}>
                <ConditionFilter conditionConfigs={conditionConfig} />
                <ConditionTagGroupArea
                  conditions={conditions}
                  computedConditionsConfigMap={computedCondtionsConfigMap}
                  onDelete={updateCondition}
                />
              </Box>
            )}
            <GridPaginationBar suffix={<Suffix />} prefix={<Prefix gridConfig={gridConfig} />} />
            <RowOperationsBar sheetId={tab.sheetID} />
            <InstitutionDataGrid sheetId={tab.sheetID} gridConfig={gridConfig} />
            <ColumnsEditor gridConfig={gridConfig} />
          </div>
        )}
        {insights.length > 0 && <Panel />}
      </div>
      {conditionConfig && (
        <ConditionDialog
          showConditionDialog={showConditionDialog}
          closeDialog={() => setShowConditionDialog(false)}
          config={conditionConfig}
          conditions={conditions}
          updateConditions={setConditions}
        />
      )}
    </>
  );
};

export default InstitutionGridTab;
