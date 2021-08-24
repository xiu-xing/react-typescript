import {
  Box,
  Button,
  CircularProgress,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  TextField,
  Typography,
} from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { CloseCircleOutline, ContentSaveOutline } from "mdi-material-ui";
import React, { useCallback, useEffect, useState } from "react";
import { withAlphaHex } from "with-alpha-hex";
import { NextSearchConditionInput, useCreateTemplateMutation, useSaveTemplateMutation } from "../../generated/graphql";
import SearchConditionInput from "../common/condition-dialog/search-condition-input";
import SnackbarContainer from "../common/snackbar/snackbarContainer";
import Space from "../common/space";
import AdvancedSearchContainer from "./container";
import SearchConditionInputIcon from "./search-condition-input-icon";
import { Realm } from "./types";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    dialog: {
      "& .MuiPaper-root": {
        maxWidth: 535,
        height: 252,
      },
    },
    customButton: {
      cursor: "pointer",
      fontSize: 14,
      lineHeight: "24px",
      color: "#333",
      fontWeight: theme.typography.fontWeightRegular,
      "&:hover": {
        borderColor: withAlphaHex("#000", 0.87),
      },
      "& :first-child": {
        marginRight: 4,
      },
    },
    button: {
      whiteSpace: "pre",
    },
    dialogTitle: {
      fontWeight: theme.typography.fontWeightMedium,
    },
  }),
);

const SimpleConditionEditor: React.FC = () => {
  const classes = useStyles();
  const {
    realm,
    searchConditionConfig,
    openConditionEditor,
    emptyConditions,
    updateCondition,
    conditions,
    setTitle,
    template,
    updateTemplate,
    isAllRequiredConditionOffered,
  } = AdvancedSearchContainer.useContainer();

  const getConditionValue = useCallback(
    (id: string) => conditions[conditions.findIndex((c) => c.id === id)],
    [conditions],
  );
  const [nameInputDialogOpen, setDialogOpen] = useState(false);
  const [templateName, setTemplateName] = useState<string>();
  const { openSnackbar } = SnackbarContainer.useContainer();

  const [, executeCreateTemplate] = useCreateTemplateMutation();
  const [, executeSaveTemplate] = useSaveTemplateMutation();
  const [formValidation, setFormValidation] = useState<Record<string, string>>(Object.create(null));
  const [fetching, setFetching] = useState(false);

  useEffect(() => {
    if (templateName === "") {
      setFormValidation({ "name": "请输入名称" });
    } else {
      setFormValidation({});
    }

    return () => {
      setFormValidation({});
    };
  }, [templateName]);

  const createTemplate = async (name: string, realmID: Realm, conditions: NextSearchConditionInput[]) => {
    setFetching(true);
    const { data, error } = await executeCreateTemplate({
      input: {
        name: name,
        realmID: realmID,
        conditions: conditions,
      },
    });
    setFetching(false);

    if (error) {
      return openSnackbar("创建模版失败", "error");
    }

    if (data?.createTemplate && data?.createTemplate?.id) {
      setDialogOpen(false);
      setTitle(data?.createTemplate.name);
      updateTemplate(data?.createTemplate);

      return openSnackbar("创建模版成功", "success");
    }
  };

  const saveTemplate = async (id: string, conditions: NextSearchConditionInput[]) => {
    setFetching(true);
    const { data, error } = await executeSaveTemplate({
      input: {
        templateId: id,
        conditions: conditions,
      },
    });
    setFetching(false);

    if (error) {
      return openSnackbar("保存模版失败", "error");
    }

    if (data?.saveTemplate?.id) {
      updateTemplate(data?.saveTemplate);
      return openSnackbar("保存模版成功", "success");
    }
  };

  return (
    <Box
      display="flex"
      alignItems="start"
      justifyContent="space-between"
      paddingX="24px"
      paddingBottom="8px"
      className={classes.root}
    >
      <Space wrap size="middle">
        {searchConditionConfig?.presets?.map((p) => (
          <SearchConditionInput
            key={p}
            config={searchConditionConfig.condition_map[p]}
            variant="preset_input"
            disableLabel
            value={getConditionValue(p)}
            onChange={updateCondition}
            onMoreOptionClick={openConditionEditor}
          />
        ))}
        <Box
          display="inline-flex"
          alignItems="center"
          className={classes.customButton}
          onClick={openConditionEditor}
          border="1px solid #EEE"
          padding="5px 15px"
          borderRadius="4px"
        >
          <SearchConditionInputIcon type="FILTER" />
          全部筛选
        </Box>
        {!(conditions?.length === 0 || !isAllRequiredConditionOffered) && (
          <Button
            className={classes.button}
            variant="outlined"
            color="primary"
            startIcon={<CloseCircleOutline />}
            disabled={conditions?.length === 0 || !isAllRequiredConditionOffered}
            onClick={emptyConditions}
          >
            清除
          </Button>
        )}
        {!(conditions?.length === 0 || !isAllRequiredConditionOffered) && (
          <Button
            className={classes.button}
            variant="contained"
            color="primary"
            disableElevation
            disabled={conditions.length === 0 || !isAllRequiredConditionOffered}
            startIcon={fetching ? <CircularProgress size={18} style={{ color: "white" }} /> : <ContentSaveOutline />}
            onClick={() => {
              if (template) {
                return saveTemplate(template.id as string, conditions);
              }

              return setDialogOpen(true);
            }}
          >
            保存
          </Button>
        )}
      </Space>
      <Dialog className={classes.dialog} open={nameInputDialogOpen} onClose={() => setDialogOpen(false)} fullWidth>
        <DialogTitle>
          <Typography noWrap className={classes.dialogTitle}>
            保存
          </Typography>
        </DialogTitle>
        <DialogContent dividers>
          <Box height={8} />
          <TextField
            value={templateName ?? ""}
            variant="outlined"
            fullWidth
            error={"name" in formValidation}
            helperText={formValidation["name"]}
            label="命名模版名称"
            autoFocus
            onChange={(e) => setTemplateName(e.target.value.trim())}
            onKeyDown={(e) => {
              if (e.key === "Enter" && templateName) {
                return createTemplate(templateName, realm, conditions);
              }
            }}
          />
        </DialogContent>
        <DialogActions>
          <Button style={{ color: "#666" }} variant="text" onClick={() => setDialogOpen(false)}>
            取消
          </Button>
          <Button
            color="primary"
            variant="text"
            startIcon={fetching && <CircularProgress size={18} color="primary" />}
            disabled={"name" in formValidation}
            onClick={() => {
              if (templateName) return createTemplate(templateName, realm, conditions);
            }}
          >
            保存
          </Button>
        </DialogActions>
      </Dialog>
    </Box>
  );
};

export default SimpleConditionEditor;
