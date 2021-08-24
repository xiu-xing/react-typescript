import {
  Box,
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  IconButton,
  List,
  ListItem,
  SvgIcon,
  TextField,
  Typography,
} from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import Tippy from "@tippyjs/react";
import { format, fromUnixTime } from "date-fns";
import { compact } from "lodash";
import { DotsHorizontal, Pencil, TrashCanOutline } from "mdi-material-ui";
import React, { useEffect, useState } from "react";
import { SearchTemplate, useDeleteTemplateMutation, useRenameTemplateMutation } from "../../generated/graphql";
import SnackbarContainer from "../common/snackbar/snackbarContainer";
import Tag from "../common/tag";
import { Realm, REALMTITLE } from "../realm/types";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      cursor: "pointer",
    },
    title: {
      fontSize: 14,
      color: "#333",
      lineHeight: "24px",
      fontWeight: theme.typography.fontWeightMedium,
    },
    tooltip: {
      background: "#fff",
      borderRadius: "4px",
      boxShadow:
        "0px 1px 18px 0px rgba(0, 0, 0, 0.12), 0px 6px 10px 0px rgba(0, 0, 0, 0.14), 0px 3px 5px -1px rgba(0, 0, 0, 0.2)",
      "&[data-placement^='top']:after": {
        bottom: -4,
      },

      "&[data-placement^='bottom']:after": {
        top: -4,
      },
      "&:after": {
        content: `""`,
        position: "absolute",
        left: 0,
        display: "block",
        width: 8,
        height: 8,
        background: "inherit",
        //TODO use computed position (.tippy-arrow["style"])?
        transform: "translate3d(84px, 0px, 0px) rotate(45deg)",
      },
    },
    listItem: {
      minWidth: 102,
      padding: "6px 16px",
    },
    menuLabel: {
      fontSize: 12,
      color: "#666",
    },
    contentText: {
      fontSize: 14,
      color: "#666",
      fontWeight: theme.typography.fontWeightMedium,
    },
    tip: {
      fontSize: 12,
      color: "#999",
    },
    dialog: {
      "& .MuiPaper-root": {
        maxWidth: 535,
        height: 252,
      },
    },
    dialogTitle: {
      fontWeight: theme.typography.fontWeightMedium,
    },
  }),
);

interface TemplateCardProps {
  template: SearchTemplate;
  onDelete?: (id: string) => void;
}

const TemplateCard: React.FC<TemplateCardProps> = (props) => {
  const classes = useStyles();
  const { template, onDelete } = props;
  const [visible, setVisible] = useState(false);
  const show = () => setVisible(true);
  const hide = () => setVisible(false);
  const [displayTemplate, setDisplayTemplate] = useState(template);
  const [, executeDeleteTemplate] = useDeleteTemplateMutation();
  const [, executeRenameTemplate] = useRenameTemplateMutation();
  const { openSnackbar } = SnackbarContainer.useContainer();
  const [nameInputDialogOpen, setDialogOpen] = useState(false);
  const [formValidation, setFormValidation] = useState<Record<string, string>>(Object.create(null));
  const [newTemplateName, setNewTemplateName] = useState<string>();

  const handleDelete = async (e: React.MouseEvent<HTMLDivElement, MouseEvent>) => {
    e.stopPropagation();
    const id = template.id as string;
    hide();
    const { error, data } = await executeDeleteTemplate({
      templateId: id,
    });

    if (error) {
      return openSnackbar("删除模版失败", "error");
    }

    if (data?.deleteTemplate) return onDelete?.(id);
  };

  const openRenameDialog = (e: React.MouseEvent<HTMLDivElement, MouseEvent>) => {
    hide();
    e.stopPropagation();
    setDialogOpen(true);
  };

  const handleRename = async () => {
    const id = displayTemplate.id as string;
    if (newTemplateName !== displayTemplate.name) {
      const { error, data } = await executeRenameTemplate({
        input: {
          templateId: id,
          name: newTemplateName,
        },
      });

      if (error) {
        return openSnackbar("重命名模版失败", "error");
      }

      if (data?.renameTemplate?.id) {
        setDialogOpen(false);
        return setDisplayTemplate(data?.renameTemplate);
      }
    }
  };

  const handleApply = () => {
    hide();
    window.open(`/realm/${displayTemplate.realmID}?templateId=${displayTemplate.id}`);
  };

  useEffect(() => {
    if (newTemplateName === "") {
      setFormValidation({ "name": "请输入名称" });
    } else {
      setFormValidation({});
    }

    return () => {
      setFormValidation({});
    };
  }, [newTemplateName]);

  return (
    <>
      <Box className={classes.root} border="1px solid #EEE" borderRadius="4px" onClick={handleApply}>
        <Box display="flex" alignItems="center" padding="11px 13px 9px 16px" borderBottom="1px solid #EEE">
          <Box display="flex" alignItems="center" flex={1} overflow="hidden">
            <Typography noWrap className={classes.title} display="inline">
              {decodeURIComponent(displayTemplate.name ?? "")}
            </Typography>
            <Tag label={REALMTITLE[template.realmID as Realm]} style={{ marginInline: "6px" }} />
          </Box>
          <Tippy
            zIndex={1}
            visible={visible}
            onClickOutside={hide}
            interactive
            placement="bottom-end"
            className={classes.tooltip}
            content={
              <List>
                <ListItem button className={classes.listItem} onClick={openRenameDialog}>
                  <Pencil style={{ color: "#666", fontSize: 16 }} />
                  <Box width={4} />
                  <Typography noWrap className={classes.menuLabel}>
                    重命名
                  </Typography>
                </ListItem>
                <ListItem button className={classes.listItem} onClick={handleDelete}>
                  <TrashCanOutline style={{ color: "#666", fontSize: 16 }} />
                  <Box width={4} />
                  <Typography noWrap className={classes.menuLabel}>
                    删除
                  </Typography>
                </ListItem>
              </List>
            }
          >
            <IconButton
              size="small"
              onClick={(e) => {
                e.stopPropagation();
                return visible ? hide() : show();
              }}
            >
              <DotsHorizontal fontSize="small" />
            </IconButton>
          </Tippy>
        </Box>
        <Box padding="16px">
          {compact(
            template.templateInfo?.statistics?.reduce<string[]>((a, n) => a.concat(`${n?.value} ${n?.title}`), []),
          ).length > 0 && (
            <>
              <Box display="inline-flex" alignItems="center">
                <SvgIcon viewBox="0 0 16 16" style={{ color: "#666", fontSize: 16 }}>
                  <path d="M11.531 9.531v-.953a.125.125 0 00-.125-.125H4.594a.125.125 0 00-.125.125v.953h1.5a.5.5 0 01.5.5V14.5a.5.5 0 01-.5.5H1.5a.5.5 0 01-.5-.5v-4.469a.5.5 0 01.5-.5h1.969V7.953a.5.5 0 01.5-.5H7.5V6.47H5.766a.5.5 0 01-.5-.5V1.5a.5.5 0 01.5-.5h4.468a.5.5 0 01.5.5v4.469a.5.5 0 01-.5.5H8.5v.984h3.531a.5.5 0 01.5.5v1.578H14.5a.5.5 0 01.5.5V14.5a.5.5 0 01-.5.5h-4.469a.5.5 0 01-.5-.5v-4.469a.5.5 0 01.5-.5h1.5zM6.391 2a.125.125 0 00-.125.125v3.219c0 .069.056.125.125.125h3.218a.125.125 0 00.125-.125V2.125A.125.125 0 009.61 2H6.391zm-4.266 8.531a.125.125 0 00-.125.125v3.219c0 .069.056.125.125.125h3.219a.125.125 0 00.125-.125v-3.219a.125.125 0 00-.125-.125H2.125zm8.531 0a.125.125 0 00-.125.125v3.219c0 .069.056.125.125.125h3.219a.125.125 0 00.125-.125v-3.219a.125.125 0 00-.125-.125h-3.219z" />
                </SvgIcon>
                <Box width={6} />
                <Typography className={classes.contentText}>
                  {compact(
                    template.templateInfo?.statistics?.reduce<string[]>(
                      (a, n) => a.concat(`${n?.value} ${n?.title}`),
                      [],
                    ),
                  ).join("｜")}
                </Typography>
              </Box>
              <Box height={12} />
            </>
          )}
          {compact(
            template.templateInfo?.notifications?.reduce<string[]>((a, n) => a.concat(`${n?.value} ${n?.title}`), []),
          ).length > 0 ? (
            <>
              <Box display="inline-flex" alignItems="center">
                <SvgIcon viewBox="0 0 16 16" style={{ color: "#666", fontSize: 16 }}>
                  <path d="M9.8 6.867h3.3l-3.3-3.3v3.3m-6.6-4.2h7.2l3.6 3.6v6a1.2 1.2 0 01-1.2 1.2H3.2a1.2 1.2 0 01-1.2-1.2v-8.4c0-.666.534-1.2 1.2-1.2m0 1.2v8.4h9.6v-4.2H8.6v-4.2H3.2m2.4 7.2v-1.2H4.4v-1.2h1.2v-1.2h1.2v1.2H8v1.2H6.8v1.2H5.6z" />
                </SvgIcon>
                <Box width={6} />
                <Typography className={classes.contentText}>新增</Typography>
                <Box width={6} />
                <Typography className={classes.contentText}>
                  {compact(
                    template.templateInfo?.notifications?.reduce<string[]>(
                      (a, n) => a.concat(`${n?.value} ${n?.title}`),
                      [],
                    ),
                  ).join("｜")}
                </Typography>
              </Box>
              <Box height={12} />
            </>
          ) : (
            <Box height={33} />
          )}
          <Typography noWrap className={classes.tip}>
            最近查看时间{" "}
            {displayTemplate.lastViewedAt && format(fromUnixTime(displayTemplate.lastViewedAt), "yyyy-MM-dd")}
          </Typography>
        </Box>
      </Box>
      <Dialog className={classes.dialog} open={nameInputDialogOpen} onClose={() => setDialogOpen(false)} fullWidth>
        <DialogTitle>
          <Typography noWrap className={classes.dialogTitle}>
            保存
          </Typography>
        </DialogTitle>
        <DialogContent dividers>
          <Box height={8} />
          <TextField
            defaultValue={displayTemplate.name}
            variant="outlined"
            fullWidth
            error={"name" in formValidation}
            helperText={formValidation["name"]}
            label="重命名模版"
            autoFocus
            onChange={(e) => setNewTemplateName(e.target.value.trim())}
            onKeyDown={(e) => {
              if (e.key === "Enter") {
                return handleRename();
              }
            }}
          />
        </DialogContent>
        <DialogActions>
          <Button style={{ color: "#666" }} variant="text" onClick={() => setDialogOpen(false)}>
            取消
          </Button>
          <Button color="primary" variant="text" disabled={"name" in formValidation} onClick={handleRename}>
            保存
          </Button>
        </DialogActions>
      </Dialog>
    </>
  );
};

export default TemplateCard;
