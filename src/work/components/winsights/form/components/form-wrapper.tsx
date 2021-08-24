import { Box, Button, IconButton, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import { Close } from "mdi-material-ui";
import theme from "../../../../theme";
import AppContainer from "../../../../containers/appContainer";
import CounterContainer from "../../../../containers/counterContainer";
import Space from "../../../common/space";

const useStyles = makeStyles(() =>
  createStyles({
    contentTitle: {
      fontSize: 16,
      lineHeight: "24px",
      color: "#737373",
    },
    title: {
      fontSize: 18,
      lineHeight: "26px",
      fontWeight: theme.typography.fontWeightMedium,
      color: "white",
    },
  }),
);
interface FormWrapperProps {
  title: string;
  onSubmit: VoidFunction;
  buttonName:string;
}
const FormWrapper: React.FunctionComponent<FormWrapperProps> = (props) => {
  const classes = useStyles();
  const { closeDialog } = AppContainer.useContainer();

  return (
    <CounterContainer.Provider>
      <Box height="100%" overflow="hidden">
        <Box
          display="flex"
          padding="1rem 2rem"
          justifyContent="space-between"
          alignItems="center"
          borderBottom="1px solid #eee"
          bgcolor={theme.palette.primary.main}
        >
          <Typography className={classes.title} noWrap>
            {props.title}
          </Typography>
          <IconButton size="small" onClick={closeDialog} style={{ color: "white" }}>
            <Close />
          </IconButton>
        </Box>
        {props.children}
        <Box display="flex" alignItems="center" justifyContent="flex-end" borderTop="1px solid #eee" padding="8px 24px">
          <Space size="small">
            <Button variant="text" style={{ color: "#666" }} onClick={closeDialog}>
              取消
            </Button>
            <Button variant="text" color="primary" onClick={props.onSubmit}>
              {props.buttonName}
            </Button>
          </Space>
        </Box>
      </Box>
    </CounterContainer.Provider>
  );
};

export default FormWrapper;
