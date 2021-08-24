import { compact } from "lodash";
import { useMemo, useState } from "react";
import { createContainer } from "unstated-next";
import ConfigContainer from "../../../../containers/configContainer";
import { NextSearchConditionInput, TrackerTheme, TrealmImportType } from "../../../../generated/graphql";

interface InitialStates {
  sheetId: string;
  importType?: TrealmImportType;
}
export interface Insight {
  type: string;
  id: string;
  title: string;
}

function useGrid(
  initialStates: InitialStates = {
    sheetId: "portfolio_company",
  },
) {
  const [importType, setImportType] = useState(initialStates.importType);
  const [columnsEditorOpen, setColumnsEditorOpen] = useState(false);
  const { trealmConditionConfigs } = ConfigContainer.useContainer();
  const [conditions, setConditions] = useState<NextSearchConditionInput[]>([]);
  const [trackTheme, setTrackTheme] = useState<TrackerTheme>(TrackerTheme.TrackerThemeEnterprise);
  const searchConditionConfig = useMemo(() => {
    if (trealmConditionConfigs) return trealmConditionConfigs[initialStates.sheetId];
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [trealmConditionConfigs]);
  const relatedColumnIDs = useMemo(
    () =>
      compact(
        conditions.reduce<string[]>(
          (a, c) => a.concat(searchConditionConfig?.condition_map[c.id]?.related_column_ids ?? []),
          [],
        ),
      ),
    [conditions, searchConditionConfig],
  );

  return {
    importType,
    columnsEditorOpen,
    setColumnsEditorOpen,
    conditions,
    setConditions,
    searchConditionConfig,
    relatedColumnIDs,
    trackTheme,
    setTrackTheme,

    updateCondition: (condition: NextSearchConditionInput) => {
      if (condition.options.length > 0) {
        return setConditions((prev) => {
          if (prev.some((item) => item.id === condition.id))
            return prev.filter((item) => item.id !== condition.id).concat(condition);
          return prev.concat(condition);
        });
      }
      return setConditions((prev) => prev.filter((item) => item.id !== condition.id));
    },

    updateConditions: (conditions: NextSearchConditionInput[]) => {
      conditions.map((condition) => {
        condition.options = condition.options.filter((option) => compact(option?.values ?? []).length !== 0);
      });
      setConditions(conditions.filter((condition) => condition.options.length > 0));
    },
  };
}

const InstitutionGridTabContainer = createContainer(useGrid);
export default InstitutionGridTabContainer;
