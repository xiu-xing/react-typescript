import {
  Box,
  Button,
  FormControl,
  FormControlLabel,
  FormHelperText,
  FormLabel,
  IconButton,
  Radio,
  RadioGroup,
  TextField,
  Typography,
  useTheme,
} from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { Close } from "mdi-material-ui";
import React, { useState } from "react";
import AppContainer from "../../../containers/appContainer";
import { EntityType, Tab, useCreateTicketMutation } from "../../../generated/graphql";
import { REGEX } from "../../../utils/regex";
import SnackbarContainer from "../../common/snackbar/snackbarContainer";
import Space from "../../common/space";

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
    form: {
      "& .MuiFormLabel-root": {
        fontSize: "14px",
        color: "#666",
        marginBottom: 12,
      },
      "& .MuiFormLabel-asterisk": {
        color: "#E00000",
      },
    },
    radioGroup: {
      display: "grid",
      gridGap: "12px",
      gridTemplateColumns: "repeat(auto-fill,minmax(100px,1fr))",
    },
    formControlLabel: {
      margin: 0,
      "& .MuiFormControlLabel-label": {
        fontSize: 16,
        color: "#333",
        marginLeft: 8,
      },
    },
    radio: {
      height: 16,
      width: 16,
      padding: 0,
    },
  }),
);

interface FeedbackContentProps {
  tabs: Tab[];
  entity: {
    id: string;
    name: string;
    type: EntityType;
  };
}

// Profile Feedback Content
const FeedbackContent: React.FunctionComponent<FeedbackContentProps> = (props: FeedbackContentProps) => {
  const classes = useStyles();
  const { closeDialog } = AppContainer.useContainer();
  const { tabs, entity } = props;
  const [phone, setPhone] = useState<string>("");
  const [helpText, setHelpText] = useState<Record<string, string>>({});
  const [module, setModule] = useState<string>("");
  const [remark, setRemark] = useState("");
  const [, execCreateTicket] = useCreateTicketMutation();
  const { openSnackbar } = SnackbarContainer.useContainer();
  const theme = useTheme();

  const handleModuleChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setModule((event.target as HTMLInputElement).value);
  };

  const handleRemarkChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setRemark((event.target as HTMLInputElement).value);
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

    if (!module) {
      res = {
        ...res,
        "module": "请选择数据模块",
      };
    }

    return res;
  };

  const handleSubmit = async () => {
    const errors = validateForm();

    setHelpText(errors);

    if (!("phone" in errors) && !("module" in errors)) {
      const res = await execCreateTicket({
        type: "Feedback",
        payload: JSON.stringify({
          "issue_description": entity.name + module,
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
        <Typography className={classes.title} noWrap>
          意见反馈
        </Typography>
        <IconButton size="small" onClick={closeDialog} style={{ color: "white" }}>
          <Close />
        </IconButton>
      </Box>
      <Box padding="24px 32px" paddingBottom="40px">
        <TextField className={classes.textField} disabled label="名称" value={entity.name} fullWidth />
        <Box height={34} />
        <FormControl className={classes.form} required component="fieldset" fullWidth>
          <FormLabel component="legend">数据模块</FormLabel>
          <RadioGroup
            className={classes.radioGroup}
            aria-label="module"
            name="module"
            value={module}
            onChange={handleModuleChange}
          >
            {tabs.map((t, i) => (
              <FormControlLabel
                key={i}
                className={classes.formControlLabel}
                value={t.name}
                control={<Radio className={classes.radio} color="primary" size="small" />}
                label={t.name}
              />
            ))}
            <FormControlLabel
              key="other"
              className={classes.formControlLabel}
              value="其他"
              control={<Radio className={classes.radio} color="primary" size="small" />}
              label="其他"
            />
          </RadioGroup>
          <FormHelperText error={"module" in helpText}>{helpText["module"]}</FormHelperText>
        </FormControl>
        <Box height={34} />
        <TextField
          autoFocus
          className={classes.textField}
          label="补充说明"
          fullWidth
          value={remark}
          onChange={handleRemarkChange}
        />
        <Box height={34} />
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
          <Button variant="text" style={{ color: "#666" }} onClick={closeDialog}>
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
