import {
  Box,
  Button,
  Dialog,
  DialogContent,
  DialogTitle,
  IconButton,
  TextField,
  Theme,
  Typography,
} from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import CheckCircleIcon from "@material-ui/icons/CheckCircle";
import CloseIcon from "@material-ui/icons/Close";
import React, { useEffect, useMemo, useState } from "react";
import { useForm } from "react-hook-form";
import UserContainer from "../../../containers/userContainer";
import {
  Role,
  useCreateTicketMutation,
  useIsPurchaserContactExistQuery,
  useSubmitPurchaserContactMutation,
} from "../../../generated/graphql";
import { REGEX } from "../../../utils/regex";
import SnackbarContainer from "../snackbar/snackbarContainer";
import Logo from "./assets/logo.svg";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    box: {
      display: "grid",
      gridAutoFlow: "row",
      gridRowGap: 30,
      padding: "10px 0px 15px",
    },
    description: {
      margin: "16px 0 0 0",
      fontSize: 18,
      lineHeight: "26px",
      fontWeight: 500,
    },
    trailService: {
      minWidth: 392,
      width: 392,
      minHeight: 420,
    },
    trailServiceSuccess: {
      minWidth: 393,
      width: 393,
      minHeight: 264,
      height: 264,
    },
    closeButton: {
      position: "absolute",
      right: 0,
      top: 4,
      color: "#ffffff",
    },
    dialogTitle: {
      background: theme.palette.primary.main,
      paddingBottom: "12px",
    },
    input: {
      "& input": {
        lineHeight: "24px",
        padding: "5px 0 8px",
      },
      "& input::-webkit-input-placeholder": {
        color: "#999",
        fontSize: 14,
      },
    },
    trailSuccessContent: {
      textAlign: "center",
    },
    trailSuccessText: {
      display: "flex",
      marginLeft: "120px",
    },
    button: {
      top: 20,
      color: "#FFFFFF",
    },

    icon: {
      marginTop: "18px",
      color: theme.palette.primary.main,
    },
  }),
);

const TrailServiceDialog: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  const { register, errors, getValues, handleSubmit } = useForm();
  const { trailServiceDialogOpen, setTrailServiceDialogOpen, user } = UserContainer.useContainer();
  const { openSnackbar } = SnackbarContainer.useContainer();
  const [applied, setApplied] = useState<boolean>(false);
  const [, executeSubmitPurchaserContactMutation] = useSubmitPurchaserContactMutation();

  const [, executeCreateTicketMutation] = useCreateTicketMutation();

  const [PurchaserContactExistQueryResult, executePurchaserContactExistQuery] = useIsPurchaserContactExistQuery();

  useEffect(() => {
    if (user?.role == Role.Basic) {
      executePurchaserContactExistQuery();
    }
  }, [executePurchaserContactExistQuery, user]);

  useEffect(() => {
    if (PurchaserContactExistQueryResult.data) {
      if (PurchaserContactExistQueryResult.data.isPurchaserContactExist.valueOf()) {
        setApplied(true);
      }
    }
  }, [PurchaserContactExistQueryResult]);

  interface PurchaserInfo {
    email: string;
    phone: string;
    name: string;
  }

  function convertToJson(value: PurchaserInfo): string {
    const result = {
      purchaser_name: value.name,
      purchaser_phone: value.phone,
      purchaser_email: value.email,
    };

    const resultStr = JSON.stringify(result);
    return resultStr;
  }

  function onSubmit(): void {
    const formValues = getValues();
    executeSubmitPurchaserContactMutation({
      email: formValues["email"],
      phoneNumber: formValues["phone"],
      userName: formValues["name"],
    }).then((res) => {
      if (res.data?.submitPurchaserContact.valueOf()) {
        setApplied(true);
        return;
      }
      openSnackbar("提交失败", "error");
    });

    const info: PurchaserInfo = { email: formValues["email"], name: formValues["name"], phone: formValues["phone"] };
    const payload = convertToJson(info);

    executeCreateTicketMutation({
      type: "Purchaser",
      payload: payload,
    }).then((res) => {
      if (res.data?.createTicket.valueOf()) {
        setApplied(true);
        return;
      }
      openSnackbar("提交失败", "error");
    });
  }

  const ApplySuccess: React.FunctionComponent<{}> = () => {
    return (
      <Dialog classes={{ paper: classes.trailServiceSuccess }} open={trailServiceDialogOpen}>
        <DialogTitle classes={{ root: classes.dialogTitle }}>
          <Logo />
          <IconButton
            aria-label="close"
            className={classes.closeButton}
            onClick={(): void => {
              setTrailServiceDialogOpen(false);
            }}
          >
            <CloseIcon />
          </IconButton>
        </DialogTitle>

        <DialogContent className={classes.trailSuccessContent}>
          <div className={classes.trailSuccessText}>
            <CheckCircleIcon className={classes.icon} />
            <Typography className={classes.description}>申请成功</Typography>
          </div>
          <Typography className={classes.description}>将有工作人员与您取得联系</Typography>
          <Button
            color="primary"
            variant="contained"
            className={classes.button}
            onClick={(): void => {
              setTrailServiceDialogOpen(false);
            }}
          >
            我已知晓
          </Button>
        </DialogContent>
      </Dialog>
    );
  };

  const ApplyTrail: React.FunctionComponent<{}> = () => {
    return (
      <Dialog classes={{ paper: classes.trailService }} open={trailServiceDialogOpen}>
        <DialogTitle classes={{ root: classes.dialogTitle }}>
          <Logo />
          <IconButton
            aria-label="close"
            className={classes.closeButton}
            onClick={(): void => {
              setTrailServiceDialogOpen(false);
            }}
          >
            <CloseIcon />
          </IconButton>
        </DialogTitle>
        <DialogContent>
          <Typography className={classes.description}>填写信息，申请试用完整功能</Typography>
          <form noValidate autoComplete="off">
            <Box className={classes.box}>
              <TextField
                className={classes.input}
                id="standard-basic"
                name="name"
                size="medium"
                label="姓名"
                inputRef={register({
                  required: { value: true, message: "请输入姓名" },
                })}
              />
              <TextField
                className={classes.input}
                name="phone"
                inputRef={register({
                  required: { value: true, message: "请输入手机号" },
                  pattern: { value: REGEX.phone, message: "请输入正确的手机号" },
                })}
                inputProps={{
                  maxLength: 11,
                }}
                size="medium"
                label="手机号码"
                error={Boolean(errors.phone)}
                helperText={errors.phone ? errors.phone["message"] : ""}
              />
              <TextField
                className={classes.input}
                name="email"
                inputRef={register({
                  required: { value: true, message: "请输入邮箱" },
                  pattern: { value: REGEX.email, message: "请输入正确的邮箱" },
                })}
                size="medium"
                label="邮箱"
                error={Boolean(errors.email)}
                helperText={errors.email ? errors.email["message"] : ""}
              />
            </Box>
          </form>
          <Button
            color="primary"
            variant="contained"
            className={classes.button}
            onClick={(): void => {
              handleSubmit(onSubmit)();
            }}
          >
            申请试用
          </Button>
        </DialogContent>
      </Dialog>
    );
  };

  return useMemo(() => {
    if (applied) {
      return <ApplySuccess />;
    }
    return <ApplyTrail />;
  }, [trailServiceDialogOpen, applied]);
};

export default TrailServiceDialog;
