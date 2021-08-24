import { EventProperty, useClient } from "@momentum-valley/muse-js";
import { compact } from "lodash";
import { useCallback, useEffect, useMemo, useState } from "react";
import { createContainer } from "unstated-next";
import ConfigContainer from "../../containers/configContainer";
import { NextSearchConditionInput, PresetTemplate, SearchTemplate } from "../../generated/graphql";
import { removeTypename } from "../../utils/tools";
import { Realm, REALMTITLE } from "./types";

export interface InitialStates {
  realm: Realm;
  template?: SearchTemplate;
  presetTemplate?: SearchTemplate;
  presetTemplates?: PresetTemplate[];
}
export interface Insight {
  type: string;
  id: string;
  title: string;
}

function useAdvancedSearch(
  initialStates: InitialStates = {
    realm: "pevc.event",
  },
) {
  const muse = useClient();
  const realm = useMemo(() => initialStates?.realm, [initialStates]);
  const presetTemplates = useMemo(() => {
    removeTypename(initialStates?.presetTemplates ?? []);
    return initialStates?.presetTemplates ?? [];
  }, [initialStates]);
  const [template, setTemplate] = useState(initialStates?.template);
  const templateId = useMemo(() => template?.id, [template]);
  const presetTemplate = useMemo(() => initialStates?.presetTemplate, [initialStates]);

  const [conditionEditorOpen, setConditionEditorOpen] = useState(false);

  const { adshConfigs } = ConfigContainer.useContainer();
  const [conditions, setConditions] = useState<NextSearchConditionInput[]>(() => {
    if (template) removeTypename(template);

    if (presetTemplate) removeTypename(presetTemplate);

    return (
      (template?.conditions as NextSearchConditionInput[]) ??
      (presetTemplate?.conditions as NextSearchConditionInput[]) ??
      []
    );
  });

  const [updateBufferedConditionTrigger, setUpdateBufferedConditionTrigger] = useState(0);
  const [title, setTitle] = useState(() => {
    if (template) return template.name;
    if (presetTemplate) return presetTemplate.name;
    return REALMTITLE[realm];
  });
  const searchConditionConfig = useMemo(() => {
    if (adshConfigs) return adshConfigs[realm];
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [adshConfigs]);

  const columnsIds = useMemo(
    () =>
      compact(
        conditions.reduce<string[]>(
          (a, c) => a.concat(searchConditionConfig?.condition_map[c.id]?.related_column_ids ?? []),
          [],
        ),
      ),
    [conditions, searchConditionConfig],
  );

  const computedConditionsConfigMap = useMemo(() => {
    return new Map(
      Object.entries(searchConditionConfig?.condition_map ?? {}).map(([id, config]) => {
        return [
          id,
          {
            isRequired: config.is_required,
            mutiOperator: config.input.operators.filter((o) => !o.is_locked).length > 1,
          },
        ];
      }),
    );
  }, [searchConditionConfig]);

  const isAllRequiredConditionOffered = useMemo(
    () =>
      [...computedConditionsConfigMap.entries()]
        .filter(([, v]) => v.isRequired)
        .map(([k]) => k)
        .every((id) => !!~conditions.findIndex((c) => c.id === id)),
    [conditions, computedConditionsConfigMap],
  );

  useEffect(() => {
    if (!isAllRequiredConditionOffered && !template) {
      setTitle(REALMTITLE[realm]);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [isAllRequiredConditionOffered, template]);

  useEffect(() => {
    if (conditions.length > 0)
      muse.sendTrackingEvent("realm.search", {
        realm: EventProperty.string(realm),
        condition: EventProperty.string(JSON.stringify(conditions)),
      });
  }, [conditions, muse, realm]);

  return {
    realm,
    template,
    templateId,
    presetTemplates,
    columnsIds,

    searchConditionConfig,
    isAllRequiredConditionOffered,
    updateBufferedConditionTrigger,

    conditionEditorOpen,
    openConditionEditor: () => {
      setConditionEditorOpen(true);
      setUpdateBufferedConditionTrigger((prev) => prev + 1);
    },
    closeConditionEditor: () => setConditionEditorOpen(false),

    conditions,
    emptyConditions: () => setConditions([]),

    computedConditionsConfigMap,

    title,
    setTitle,

    updateCondition: (condition: NextSearchConditionInput) => {
      if (condition.options.length > 0) {
        return setConditions((prev) => {
          const index = prev.findIndex((p) => p.id === condition.id);
          if (!~index) {
            return [...prev, { ...condition }];
          }

          prev.splice(index, 1, { ...condition });

          return [...prev];
        });
      }
      return setConditions((prev) => [...prev.filter((p) => p.id !== condition.id)]);
    },
    updateConditions: useCallback((conditions: NextSearchConditionInput[]) => {
      setConditions([
        ...conditions
          .map((c) => {
            c.options = c.options.filter((o) => compact(o?.values ?? []).length !== 0);
            return c;
          })
          .filter((c) => c.options.length > 0),
      ]);
    }, []),
    updateTemplate: (template: SearchTemplate) => {
      setTemplate(removeTypename(template));
    },
  };
}

const AdvancedSearchContainer = createContainer(useAdvancedSearch);
export default AdvancedSearchContainer;
