import {
  Box,
  Button,
  Checkbox,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  IconButton,
  List,
  ListItem,
  Theme,
  Tooltip,
  Typography,
} from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { Close } from "mdi-material-ui";
import React, { useMemo, useState } from "react";
import { ImportEntity, useMatchRecordMutation } from "../../../../../../generated/graphql";
import SnackbarContainer from "../../../../../common/snackbar/snackbarContainer";
import InstitutionContainer, { InstitutionType } from "../../../../institutionContainer";
import InstitutionTableContainer from "../../institutionTableContainer";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    paperRoot: {
      minWidth: 480,
      maxWidth: 480,
      minHeight: 250,
    },
    dialogContent: {
      minHeight: 128,
    },
    dialogTitle: {
      display: "flex",
      justifyContent: "space-between",
    },
    title: {
      fontSize: 22,
      color: "#666666",
    },
    titleClose: {
      position: "absolute",
      fontSize: 32,
      right: 8,
      top: 3,
    },
    checkbox: {
      display: "flex",
      justifyContent: " flex-start",
      alignItems: "center",
      marginLeft: 16,
      color: theme.palette.primary.main,
    },
    checkboxText: {
      marginLeft: 3,
      fontSize: 14,
    },
    dialogAction: {
      display: "flex",
      justifyContent: "space-between",
    },
    listItemRoot: {
      display: "grid",
      gridTemplateColumns: "50% 50%",
      padding: "0px 0px 8px 0px",
    },
    count: {
      paddingRight: "179px",
      color: theme.palette.primary.main,
      fontSize: 22,
    },
    name: {
      fontSize: 22,
    },
    describe: {
      fontSize: 20,
      color: "#5F6368",
    },
    company: {
      fontSize: 24,
      padding: "8px 0px",
      width: "415px",
      textOverflow: "ellipsis",
      whiteSpace: "nowrap",
      overflow: "hidden",
    },
    list: {
      display: "flex",
      flexDirection: "column",
    },
    checkboxRoot: {
      padding: "0",
    },
  }),
);

export interface ConfirmItem {
  count: number;
  groupCode: string;
}

interface QuickAddConfirmDialogProps {
  open: boolean;
  close(): void;
  dialogTitle: string;
  confirmItems: Array<ConfirmItem>;
  companyName?: string;
  entity?: ImportEntity;
}

const QuickAddConfirmDialog: React.FunctionComponent<QuickAddConfirmDialogProps> = (props) => {
  const classes = useStyles();
  const { open, close, dialogTitle, confirmItems, entity } = props;
  const { getTypeName, institutionChildrenType, executeTeamGroupOverviewQuery } = InstitutionContainer.useContainer();
  const { staleAllCache } = InstitutionTableContainer.useContainer();
  const [checkBoxDisable, setCheckBoxDisable] = useState<boolean>(false);
  const [isRelevant, setIsRelevant] = useState<boolean>(true);
  const { openSnackbar } = SnackbarContainer.useContainer();
  const [, executeMatchRecordMutation] = useMatchRecordMutation();

  const handleCheckboxChange = (event: React.ChangeEvent<HTMLInputElement>): void => {
    setIsRelevant(event.target.checked);
  };

  useMemo(() => {
    if (confirmItems.length <= 0) {
      setIsRelevant(false);
      setCheckBoxDisable(true);
    } else {
      setIsRelevant(true);
      setCheckBoxDisable(false);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [confirmItems.length]);

  function handleButtonClick(): void {
    if (entity) {
      executeMatchRecordMutation({
        input: {
          processRelevantGroups: isRelevant,
          entity: entity,
          groupCode:
            institutionChildrenType === InstitutionType.CorporateEntity ? "fund_manager" : institutionChildrenType,
        },
      }).then((res) => {
        if (res.data?.matchRecord) {
          staleAllCache();
          executeTeamGroupOverviewQuery();
          openSnackbar("添加成功", "success");
          close();
          return;
        }
        openSnackbar("添加失败", "error");
        close();
      });
    }
  }

  return (
    <Dialog open={open} classes={{ paper: classes.paperRoot }} onClose={close}>
      <DialogTitle className={classes.dialogTitle}>
        <Typography className={classes.title}>{dialogTitle}</Typography>
        <IconButton className={classes.titleClose} onClick={close}>
          <Close />
        </IconButton>
      </DialogTitle>
      <DialogContent className={classes.dialogContent}>
        <Typography className={classes.describe}>{getTypeName(institutionChildrenType)}</Typography>
        <Tooltip title={props.companyName ?? ""} placement="top-start">
          <Typography className={classes.company}>{props.companyName}</Typography>
        </Tooltip>
        {props.confirmItems.length > 0 ? (
          <>
            <Typography className={classes.describe}>关联数据</Typography>
            <List className={classes.list}>
              {props.confirmItems.map((item) => {
                return (
                  <>
                    <ListItem key={item.groupCode} className={classes.listItemRoot}>
                      <Typography className={classes.name}>{getTypeName(item.groupCode)}</Typography>
                      <Typography className={classes.count}>{`+${item.count}`}</Typography>
                    </ListItem>
                  </>
                );
              })}
            </List>
          </>
        ) : (
          <Typography className={classes.describe}>暂无关联数据</Typography>
        )}
      </DialogContent>
      <DialogActions className={classes.dialogAction}>
        <Box className={classes.checkbox}>
          <Checkbox
            classes={{
              root: classes.checkboxRoot,
            }}
            disabled={checkBoxDisable}
            checked={isRelevant}
            color="primary"
            inputProps={{ "aria-label": "secondary checkbox" }}
            onChange={handleCheckboxChange}
          />
          <Typography className={classes.checkboxText}>导入关联数据</Typography>
        </Box>
        <Button onClick={handleButtonClick} color="primary">
          确认
        </Button>
      </DialogActions>
    </Dialog>
  );
};

export default QuickAddConfirmDialog;
