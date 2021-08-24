import { useClient } from "@momentum-valley/muse-js";
import { Download } from "mdi-material-ui";
import React, { useEffect, useState } from "react";
import UserContainer from "../../../../../containers/userContainer";
import { ExportRealmSheetDataByEntitiesQueryVariables, Role } from "../../../../../generated/graphql";
import ExportDialog, { ExportType, VerticalSelectedExport } from "../../../dialog/exporter-dialog/export-dialog";
import TableSelectionBaseButton from "./base";
interface ExportEntitiesButtonProps {
  onClick():
    | Promise<ExportRealmSheetDataByEntitiesQueryVariables>
    | ExportRealmSheetDataByEntitiesQueryVariables
    | Promise<VerticalSelectedExport>
    | VerticalSelectedExport;
  onSuccess?(): void;
  onFailure?(): void;
  deletedAll(): void;
  exportType: ExportType;
}

const ExportEntitiesButton: React.FunctionComponent<ExportEntitiesButtonProps> = (props) => {
  const [exportDialogOpen, setExportDialogOpen] = useState(false);
  const { user, setActiveServiceDialogOpen, setInstitutionAuthenticationDialog, setTrailServiceDialogOpen } =
    UserContainer.useContainer();
  const [adshSelectedExport, setADSHSelectedExport] = useState<ExportRealmSheetDataByEntitiesQueryVariables>();
  const [verticalSelectedExport, setVerticalSelectedExport] = useState<VerticalSelectedExport>();

  const onClick = async (): Promise<void> => {
    if(user?.role == Role.IndividualFree || user?.role == Role.IndividualPremium) {
      setInstitutionAuthenticationDialog(true);
      return;
    }
    if (user?.role == Role.Basic) {
      setTrailServiceDialogOpen(true);
      return;
    }
    if (user?.role == Role.Trial || user?.role == Role.Expired) {
      setActiveServiceDialogOpen(true);
      return;
    }
    if (props.exportType == ExportType.RealmSheetByEntities) {
      setADSHSelectedExport((await props.onClick()) as ExportRealmSheetDataByEntitiesQueryVariables);
    }
    if (props.exportType == ExportType.VerticalSelected) {
      setVerticalSelectedExport((await props.onClick()) as VerticalSelectedExport);
    }
  };

  useEffect(() => {
    if (adshSelectedExport || verticalSelectedExport) {
      setExportDialogOpen(true);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [adshSelectedExport, verticalSelectedExport]);

  return (
    <>
      <TableSelectionBaseButton onClick={onClick} title={"下载"} startIcon={Download} />
      <ExportDialog
        open={exportDialogOpen}
        close={(): void => {
          setExportDialogOpen(false);
        }}
        exportRealmSheetByEntitiesVariables={adshSelectedExport}
        verticalSelectedExport={verticalSelectedExport}
        deletedAll={props.deletedAll}
        dialogTitle={"我的导出"}
        exportType={props.exportType}
      />
    </>
  );
};

export default ExportEntitiesButton;
