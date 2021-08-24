import { Dialog, DialogContent, DialogProps, DialogTitle, IconButton } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { Close } from "mdi-material-ui";
import React from "react";
import EventDetailsDisplay from "./event-detail-display";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    paperRoot: {
      minWidth: 940,
      minHeight: 67,
    },
    dialogTitleRoot: {
      color: "#666666",
      padding: "11px 24px",
      fontSize: 16,
      borderBottom: "1px solid #EEE",
      display: "flex",
      justifyContent: "space-between",
      alignItems: "center",
    },
    dialotContentRoot: {
      padding: "16px 24px",
    },
    title: {
      fontSize: 16,
    },
  }),
);

interface EventDetailsDialogProps extends DialogProps {
  tagCode: string;
  content: string;
  open: boolean;
  setOpen: (open: boolean) => void;
}

const EventDetailsDialog: React.FunctionComponent<EventDetailsDialogProps> = (props) => {
  const classes = useStyles();
  const { open, setOpen, ...leftProps } = props;

  if (!props.tagCode) {
    return null;
  }

  return (
    <Dialog {...leftProps} open={open} classes={{ paper: classes.paperRoot }}>
      <DialogTitle classes={{ root: classes.dialogTitleRoot }} disableTypography={true}>
        <span className={classes.title}>事件详情</span>
        <IconButton
          onClick={(): void => {
            setOpen(false);
          }}
        >
          <Close fontSize="small" />
        </IconButton>
      </DialogTitle>
      <DialogContent classes={{ root: classes.dialotContentRoot }}>
        <EventDetailsDisplay tagCode={props.tagCode} content={props.content} />
      </DialogContent>
    </Dialog>
  );
};

export default EventDetailsDialog;
