import {
  Box,
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  Typography,
  useMediaQuery,
  useTheme,
} from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import { CloseCircleOutline } from "mdi-material-ui";
import React, { useEffect, useState } from "react";
import SimpleBar from "simplebar-react";
import { NextSearchConditionInput } from "../../../generated/graphql";
import MenuItem from "./menu-item";
import SearchConditionInput from "./search-condition-input";
import { Config } from "./types";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    dialog: {
      "& .MuiPaper-root": {
        maxWidth: 1003,
      },
    },
    fullScreenDialog: {
      "& .MuiPaper-root": {
        maxWidth: "100vw",
      },
    },
    dialogTitle: {
      padding: "16px 32px",
      borderBottom: "1px solid #EEE",
    },
    dialogActions: {
      borderTop: "1px solid #EEE",
      justifyContent: "space-between",
      padding: "10px 24px",
    },
    dialogContent: {
      padding: 0,
      display: "grid",
      gridTemplateColumns: "131px 1fr",
    },
    title: {
      fontSize: 14,
      lineHeight: "24px",
      color: "#333",
      fontWeight: theme.typography.fontWeightMedium,
    },
    cancelButton: {
      color: "#666",
    },
    menu: {
      borderRight: "1px solid #EEE",
      maxHeight: "calc(100vh - 178px)",
      height: "calc(100vh - 178px)",
      padding: "8px 0",
    },
    content: {
      padding: 24,
      maxHeight: "calc(100vh - 178px)",
      height: "calc(100vh - 178px)",
    },
  }),
);

interface ConditionDialogProps {
  config: Config;
  conditions: NextSearchConditionInput[];
  closeDialog: () => void;
  showConditionDialog: boolean;
  updateConditions: (conditions: NextSearchConditionInput[]) => void;
}

const ConditionDialog: React.FunctionComponent<ConditionDialogProps> = (props) => {
  const classes = useStyles();
  const theme = useTheme();
  const { config, conditions, closeDialog, updateConditions, showConditionDialog } = props;
  const [active, setActive] = useState(0);
  const fullScreen = useMediaQuery(theme.breakpoints.down("xs"));
  const [bufferedConditions, setBufferedConditions] = useState<NextSearchConditionInput[]>(conditions);

  const deleteCondition = (id: string) => setBufferedConditions((prev) => [...prev.filter((f) => f.id !== id)]);

  // eslint-disable-next-line react-hooks/rules-of-hooks
  useEffect(() => {
    if (!showConditionDialog) return;
    setBufferedConditions(conditions);
  }, [conditions, showConditionDialog]);

  const getConditionValue = (id: string) => bufferedConditions[bufferedConditions.findIndex((c) => c.id === id)];

  const getGroupActivatedConditionCount = (groupId: string) => {
    const group = config?.groups[config?.groups.findIndex((g) => g.id === groupId)];
    const count = group?.conditions.filter((c) => c === getConditionValue(c)?.id)?.length;
    return !count ? "" : count + "";
  };

  const onApplyButtonClick = () => {
    updateConditions && updateConditions(bufferedConditions);
    closeDialog();
  };

  const updateBufferedCondition = (condition: NextSearchConditionInput) => {
    if (condition.options.length > 0) {
      return setBufferedConditions((prev) => {
        const index = prev.findIndex((p) => p.id === condition.id);
        if (!~index) {
          return [...prev, { ...condition }];
        }
        prev.splice(index, 1, { ...condition });

        return [...prev];
      });
    }
    return setBufferedConditions((prev) => prev.filter((p) => p.id !== condition.id));
  };

  return (
    <Dialog
      className={clsx(classes.dialog, { [classes.fullScreenDialog]: fullScreen })}
      fullWidth
      open={showConditionDialog}
      fullScreen={fullScreen}
      onClose={closeDialog}
    >
      <DialogTitle className={classes.dialogTitle}>
        <Typography className={classes.title}>全部筛选</Typography>
      </DialogTitle>
      {!config ? (
        <Box padding="32px 0">
          <Typography align="center">缺少配置</Typography>
        </Box>
      ) : (
        <DialogContent className={classes.dialogContent}>
          <SimpleBar
            className={classes.menu}
            style={{ ...(fullScreen && { maxHeight: "calc(100vh - 114px)", height: "calc(100vh - 114px)" }) }}
          >
            {config.groups.map((g, i) => (
              <MenuItem
                key={g.id}
                active={active === i}
                label={g.name}
                onClick={() => setActive(i)}
                count={getGroupActivatedConditionCount(g.id)}
              />
            ))}
          </SimpleBar>
          {config.groups.map((g, i) => (
            <Box key={i} hidden={active !== i}>
              <SimpleBar
                className={classes.content}
                style={{ ...(fullScreen && { maxHeight: "calc(100vh - 114px)", height: "calc(100vh - 114px)" }) }}
              >
                {g.conditions.map((c, index) => (
                  <Box key={index}>
                    {index !== 0 && <Box height={24} />}
                    <SearchConditionInput
                      value={getConditionValue(c)}
                      config={config.condition_map[c]}
                      onChange={updateBufferedCondition}
                      onClear={deleteCondition}
                    />
                  </Box>
                ))}
              </SimpleBar>
            </Box>
          ))}
        </DialogContent>
      )}
      <DialogActions className={classes.dialogActions}>
        <Button
          disabled={bufferedConditions.length === 0}
          variant="text"
          color="primary"
          startIcon={<CloseCircleOutline />}
          onClick={() => setBufferedConditions([])}
        >
          清除全部筛选
        </Button>
        <Box>
          <Button variant="text" className={classes.cancelButton} onClick={closeDialog}>
            取消
          </Button>
          <Button variant="text" color="primary" onClick={onApplyButtonClick}>
            应用
          </Button>
        </Box>
      </DialogActions>
    </Dialog>
  );
};

export default ConditionDialog;
