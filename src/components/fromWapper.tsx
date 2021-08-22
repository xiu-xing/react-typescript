import { Box, Button, IconButton, Theme, Typography } from "@material-ui/core";
import { Close } from "@material-ui/icons";
import { createStyles, makeStyles } from "@material-ui/styles";
import React from "react";

const useStyle = makeStyles((theme: Theme) =>
  createStyles({
    title: {
      fontSize: 18,
      lineHeight: "26px",
      fontWeight: 500,
      color: "white",
    },
  })
);

interface FromWrapperProps {
  title: string;
  onSubmit: VoidFunction;
}
const FromWrapper: React.FunctionComponent<FromWrapperProps> = (props) => {
  const classes = useStyle();
  return (
    <Box margin="0 auto" width="60%" height="100%" overflow="hidden">
      <Box
        display="flex"
        padding="1rem 2rem"
        justifyContent="space-between"
        alignItems="center"
        borderBottom="1px solid #eee"
        bgcolor="#737373"
      >
        <Typography className={classes.title} noWrap>
          {props.title}
        </Typography>
        <IconButton size="small" onClick={() => { console.log("close") }} style={{ color: "white" }}>
          <Close />
        </IconButton>
      </Box>
      {props.children}
      <Box display="flex" alignItems="center" justifyContent="flex-end" borderTop="1px solid #eee" padding="8px 24px">
        <Button variant="text" style={{ color: "#666" }} onClick={() => {
          console.log("cancel");
        }}>
          取消
        </Button>
        <Button variant="text" color="primary" onClick={() => {
          console.log("submit");
        }}>
          提交
        </Button>
      </Box>
    </Box>
  )
};

export default FromWrapper;
