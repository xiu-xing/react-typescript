import { useClient } from "@momentum-valley/muse-js";
import React, { useEffect, useRef, useState } from "react";
import {
  EntityType,
  ImportEntity,
  SuggestType,
  useGetManualRelevantGroupEntitiesCountsQuery
} from "../../../../../../generated/graphql";
import QuickAddDisplay from "../../../../../common/quick-add/quick-add";
import SnackbarContainer from "../../../../../common/snackbar/snackbarContainer";
import InstitutionContainer, { InstitutionType } from "../../../../institutionContainer";
import InstitutionTableContainer from "../../institutionTableContainer";
import QuickAddConfirmDialog, { ConfirmItem } from "./quick-add-confirm-dialog";

interface QuickAdd {
  onSuccess(): void;
}

const QuickAdd: React.FunctionComponent<QuickAdd> = (props) => {
  const [quickAddConfirmDialogOpen, setQuickAddConfirmDialogOpen] = useState<boolean>(false);
  const { institutionChildrenType } = InstitutionContainer.useContainer();
  const [entity, setEntity] = useState<ImportEntity>();
  const [companyName, setCompanyName] = useState<string>();
  const { deleteDataConfirmDialogOpen, setDeleteDataConfirmDialogOpen } = InstitutionTableContainer.useContainer();
  const muse = useClient();
  const [confirmItems, setConfirmItems] = useState<Array<ConfirmItem>>([]);
  const getQueryType = (institutionChildrenType: InstitutionType): Array<SuggestType> => {
    switch (institutionChildrenType) {
      case InstitutionType.CoInvestor:
        return [SuggestType.SuggestTypeInstitutionalInvestor];
      case InstitutionType.Vertical:
        return [SuggestType.SuggestTypeVertical];
      default:
        return [SuggestType.SuggestTypeCompany, SuggestType.SuggestTypeFund, SuggestType.SuggestTypeOtherOrgSaic];
    }
  };
  const { openSnackbar } = SnackbarContainer.useContainer();
  const clearButtonRef = useRef<HTMLButtonElement | null>(null);
  const [getManualRelevantGroupEntitiesCountsQuery, executeGetManualRelevantGroupEntitiesCountsQuery] =
    useGetManualRelevantGroupEntitiesCountsQuery({
      variables: {
        groupCode:
          institutionChildrenType === InstitutionType.CorporateEntity ? "fund_manager" : institutionChildrenType,
        entity: entity as ImportEntity,
      },
      pause: true,
      requestPolicy: "network-only",
    });

  useEffect(() => {
    if (!getManualRelevantGroupEntitiesCountsQuery.fetching) {
      if (getManualRelevantGroupEntitiesCountsQuery.data) {
        const newConfirmItems: Array<ConfirmItem> = [];
        // let itemTotal = 0;
        getManualRelevantGroupEntitiesCountsQuery.data.getEntitiesCountFromRelevantGroups.relevantGroupCounts?.map(
          (item) => {
            if (item && item.groupCode && item.count) {
              const confirmItem: ConfirmItem = { count: item.count, groupCode: item.groupCode };
              newConfirmItems.push(confirmItem);
            }
          },
        );
        setConfirmItems(newConfirmItems);
        setQuickAddConfirmDialogOpen(true);
      }
      if (getManualRelevantGroupEntitiesCountsQuery.error) {
        openSnackbar("操作失败", "error");
      }
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [getManualRelevantGroupEntitiesCountsQuery]);

  useEffect(() => {
    if (entity) {
      executeGetManualRelevantGroupEntitiesCountsQuery();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [entity]);
  // const [checkStatus, setCheckStatus] = useState<boolean>(true);

  function handleItemClick(entityId: string, entityType: EntityType, name?: string): void {
    clearButtonRef.current?.click();
    clearButtonRef.current?.focus();
    muse.sendTrackingEvent("institution.import", {
      type: institutionChildrenType,
      entity: {
        id: entityId,
        type: entityType,
      },
    });
    setEntity({
      entityID: entityId,
      entityType: entityType,
    });
    setCompanyName(name);
  }

  return (
    <>
      <QuickAddDisplay
        suggestTypes={getQueryType(institutionChildrenType)}
        onSuccess={props.onSuccess}
        handleItemClick={handleItemClick}
        clearButtonRef={clearButtonRef}
      />
      <QuickAddConfirmDialog
        open={quickAddConfirmDialogOpen}
        close={(): void => {
          setQuickAddConfirmDialogOpen(false);
        }}
        dialogTitle={"快速添加"}
        confirmItems={confirmItems}
        companyName={companyName}
        entity={entity}
      />
    </>
  );
};

export default QuickAdd;
