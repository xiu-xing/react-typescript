import { Box, Button, IconButton, TextField, Typography, useTheme } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { Close } from "mdi-material-ui";
import React, { useState } from "react";
import AppContainer from "../../../containers/appContainer";
import { useCreateTicketMutation } from "../../../generated/graphql";
import { REGEX } from "../../../utils/regex";
import SnackbarContainer from "../snackbar/snackbarContainer";
import Space from "../space";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    title: {
      fontSize: 18,
      lineHeight: "26px",
      fontWeight: theme.typography.fontWeightMedium,
      color: "white",
    },
    textField: {
      "& input": {
        paddingTop: 6,
        paddingBottom: 12,
      },
      "& .MuiFormLabel-root": {
        color: "#666",
      },
      "& .MuiInputLabel-formControl": {
        transform: " translate(0, 30px) scale(1)",
      },
      "& label + .MuiInput-formControl": {
        marginTop: 24,
      },
      "& .MuiInput-underline.Mui-disabled:before": {
        borderBottomColor: "#EEE",
      },
      "& .MuiInput-underline:before": {
        borderBottomColor: "#EEE",
      },
      "& .MuiInputBase-root": {
        // fontWeight: 500,
      },
      "& .MuiInputLabel-asterisk": {
        color: "#E00000",
      },
      "& .MuiInputLabel-shrink": {
        transform: "translate(0, 4px) scale(0.875)",
      },
    },
  }),
);

interface FeedbackContentProps {}

// Global Feedback Content
const FeedbackContent: React.FC = () => {
  const classes = useStyles();

  const { closeDialog } = AppContainer.useContainer();
  const [phone, setPhone] = useState<string>("");
  const [helpText, setHelpText] = useState<Record<string, string>>({});
  const [remark, setRemark] = useState("");
  const [description, setDescription] = useState("");
  const [, execCreateTicket] = useCreateTicketMutation();
  const { openSnackbar } = SnackbarContainer.useContainer();
  const theme = useTheme();

  const handleRemarkChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setRemark((event.target as HTMLInputElement).value);
  };

  const handleDescriptionChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setDescription((event.target as HTMLInputElement).value);
  };

  const handlePhoneChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setPhone(event.target.value);
  };

  const validateForm = (): Record<string, string> => {
    let res: Record<string, string> = Object.create(null);

    if (!phone) {
      res = {
        ...res,
        "phone": "请填写手机号",
      };
    } else if (!REGEX.phone.test(phone)) {
      res = {
        ...res,
        "phone": "请填写正确手机号",
      };
    }

    if (!description) {
      res = {
        ...res,
        "description": "请填写问题描述",
      };
    }

    return res;
  };

  const handleSubmit = async () => {
    const errors = validateForm();

    setHelpText(errors);

    if (!("phone" in errors) && !("description" in errors)) {
      const res = await execCreateTicket({
        type: "Feedback",
        payload: JSON.stringify({
          "issue_description": description,
          "user_phone": phone,
          "remark": remark,
        }),
      });

      closeDialog();

      if (res.data?.createTicket) {
        openSnackbar("反馈成功", "success");
      } else {
        openSnackbar("反馈失败", "error");
      }
    }
  };

  return (
    <>
      <Box
        display="flex"
        padding="1rem 2rem"
        justifyContent="space-between"
        alignItems="center"
        borderBottom="1px solid #eee"
        bgcolor={theme.palette.primary.main}
      >
        <Typography className={classes.title}>意见反馈</Typography>
        <IconButton size="small" onClick={closeDialog} style={{ color: "white" }}>
          <Close />
        </IconButton>
      </Box>
      <Box padding="24px 32px" paddingBottom="40px">
        <TextField
          autoFocus
          required
          error={"description" in helpText}
          helperText={helpText["description"]}
          className={classes.textField}
          label="问题与意见"
          fullWidth
          value={description}
          onChange={handleDescriptionChange}
        />
        <Box height={40} />
        <TextField
          className={classes.textField}
          label="补充说明"
          fullWidth
          value={remark}
          onChange={handleRemarkChange}
        />
        <Box height={40} />
        <TextField
          className={classes.textField}
          required
          label="手机号"
          value={phone}
          error={"phone" in helpText}
          helperText={helpText["phone"]}
          fullWidth
          onChange={handlePhoneChange}
        />
      </Box>
      <Box display="flex" alignItems="center" justifyContent="flex-end" borderTop="1px solid #eee" padding="8px 24px">
        <Space size="middle">
          <Button variant="text" onClick={closeDialog} style={{ color: "#666" }}>
            取消
          </Button>
          <Button variant="text" color="primary" onClick={handleSubmit}>
            提交
          </Button>
        </Space>
      </Box>
    </>
  );
};

export default FeedbackContent;
