import { Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import DeleteForeverIcon from "@material-ui/icons/DeleteForever";
import React, { ReactNode } from "react";
import NumberFormat from "react-number-format";
import CommonTable from "../../../common/common-table-compatible/common-table";
import TablePaginationBar, { PaginationWidget } from "../../../common/table/table-pagination-bar/table-pagination-bar";
import TableSelectionBaseButton from "../../../common/table/table-selection-operation-bar/components/base";
import TableSelectionOperationBar, {
  DeselectAllButton,
  SelectedItemsTip,
  SeperableVerticalBar as TableSelectionVerticalBar,
} from "../../../common/table/table-selection-operation-bar/table-selection-operation-bar";
import TableContainer from "../../../common/table/tableContainer";
import { CompanyWEBP, FundWEBP, InstitutionWEBP, LPWEBP, VerticalWEBP } from "../../assets";
import InstitutionContainer, { InstitutionType } from "../../institutionContainer";
import ImportFileButton from "./components/import-file/import-file-button";
import DeleteDataConfirmDialog from "./components/quick-add/delete-data-confirm-dialog";
import QuickAdd from "./components/quick-add/quick-add";
import InstitutionTableContainer from "./institutionTableContainer";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      paddingTop: 8,
      height: "100%",
      display: "flex",
      flexDirection: "column",
    },
    totalCount: {
      margin: "0px 16px",
      fontSize: 14,
      fontWeight: 500,
      whiteSpace: "pre",
      display: "flex",
      alignItems: "center",
    },
    totalCountIcon: {
      marginRight: 8,
    },
    fileExport: {
      display: "flex",
      alignItems: "center",
    },
    fileExportText: {
      fontSize: 14,
      color: "#333",
    },
    fileExportIcon: {},
  }),
);

interface InstitutionTableDisplayProps {
  pageChange?: (page: number) => void;
}

const InstitutionTableDisplay: React.FunctionComponent<InstitutionTableDisplayProps> = () => {
  const classes = useStyles();
  const { institutionChildrenType } = InstitutionContainer.useContainer();

  const {
    rowCount,
    onPageChange,
    page,
    loading,
    pageCount,
    staleAllCache,
    setDeleteDataConfirmDialogOpen,
    deleteDataConfirmDialogOpen,
  } = InstitutionTableContainer.useContainer();

  const { setSelectedRows } = TableContainer.useContainer();
  const { isProRole } = InstitutionContainer.useContainer();

  function totalCountText(): ReactNode {
    let iconSrc: string;
    let totalString = "";
    switch (institutionChildrenType) {
      case InstitutionType.CorporateEntity:
        iconSrc = InstitutionWEBP;
        totalString = "家机构主体";
        break;
      case InstitutionType.FOF:
        iconSrc = FundWEBP;
        totalString = "支母基金";
        break;
      case InstitutionType.Fund:
        iconSrc = FundWEBP;
        totalString = "支基金";
        break;
      case InstitutionType.InvestedFund:
        iconSrc = FundWEBP;
        totalString = "支对外投资基金";
        break;
      case InstitutionType.LP:
        iconSrc = LPWEBP;
        totalString = "位 LP";
        break;
      case InstitutionType.InvestedCompany:
        iconSrc = CompanyWEBP;
        totalString = "家项目企业";
        break;
      case InstitutionType.FundInvestedCompany:
        iconSrc = CompanyWEBP;
        totalString = "家对外投资基金项目";
        break;
      case InstitutionType.CoInvestor:
        iconSrc = InstitutionWEBP;
        totalString = "家同行机构";
        break;
      case InstitutionType.Vertical:
        iconSrc = VerticalWEBP;
        totalString = "条赛道";
        break;
    }
    return (
      <Typography className={classes.totalCount}>
        <img src={iconSrc} className={classes.totalCountIcon} />
        <NumberFormat value={rowCount} displayType="text" thousandSeparator />
        {` ${totalString}`}
      </Typography>
    );
  }

  return (
    <>
      <div className={classes.root}>
        <TablePaginationBar>
          {totalCountText()}
          <PaginationWidget
            loading={loading}
            onNextPageButtonClick={onPageChange}
            onPrePageButtonClick={onPageChange}
            currentPage={page}
            totalPage={pageCount}
          />
          {isProRole && (
            <QuickAdd
              onSuccess={(): void => {
                staleAllCache();
                setSelectedRows([]);
              }}
            />
          )}
          <ImportFileButton />
        </TablePaginationBar>

        <TableSelectionOperationBar>
          <TableSelectionBaseButton
            onClick={async (): Promise<void> => {
              setDeleteDataConfirmDialogOpen(true);
            }}
            startIcon={DeleteForeverIcon}
            title="删除"
          />
          <SelectedItemsTip />
          <TableSelectionVerticalBar />
          <DeselectAllButton />
        </TableSelectionOperationBar>
        <CommonTable
          style={{
            flexGrow: 1,
          }}
          virtualTable
          columnsEditable
          rowSelectable
        />
        <DeleteDataConfirmDialog
          open={deleteDataConfirmDialogOpen}
          close={(): void => {
            setDeleteDataConfirmDialogOpen(false);
          }}
        />
      </div>
    </>
  );
};

export default InstitutionTableDisplay;
