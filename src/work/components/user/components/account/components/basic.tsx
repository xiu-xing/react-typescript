import { Box, createStyles, InputAdornment, makeStyles, TextField } from "@material-ui/core";
import { Autocomplete } from "@material-ui/lab";
import { AccountCircleOutline, Magnify } from "mdi-material-ui";
import React, { ReactNode } from "react";
import UserContainer from "../../../userContainer";
import Card from "../../card";
import Dialog from "../../dialog";

const suggestions = ["上海中润投资有限公司", "小米科技有限公司"];

const useStyles = makeStyles(() =>
  createStyles({
    box: {
      display: "flex",
      justifyContent: "space-between",
      marginBottom: "20px",
      marginTop: "16px",
    },
    icon: {
      color: "#66778B",
      fontSize: "56px",
    },
    magnify: {
      color: "#70737F",
      fontSize: "24px",
    },
  }),
);

const Basic: React.FC = () => {
  const classes = useStyles();
  const { dialogType, setDialogType } = UserContainer.useContainer();

  return (
    <>
      <Card
        icon={<AccountCircleOutline className={classes.icon} />}
        title="刘若溪"
        subTitle="EGI·创投资本 | 营销总监"
        onClick={(): void => setDialogType("basic")}
      />
      <Dialog
        open={dialogType === "basic"}
        width={"sm"}
        title="更新个人信息"
        confirm
        onClose={(): void => setDialogType("none")}
      >
        <Box className={classes.box}>
          <TextField placeholder="刘若溪" label="姓名" InputLabelProps={{ shrink: true }} />
          <TextField placeholder="营销总监" label="职位" InputLabelProps={{ shrink: true }} />
        </Box>
        <Autocomplete
          id="combo-box-demo"
          popupIcon={null}
          autoHighlight
          noOptionsText="未找到该公司"
          options={suggestions}
          getOptionLabel={(option): string => option}
          renderInput={(params): ReactNode => {
            params.InputProps.startAdornment = (
              <InputAdornment position="start">
                <Magnify className={classes.magnify} />
              </InputAdornment>
            );
            return (
              <TextField
                {...params}
                placeholder="上海中润投资有限公司"
                fullWidth
                label="任职公司"
                InputLabelProps={{ shrink: true }}
              />
            );
          }}
        />
      </Dialog>
    </>
  );
};

export default Basic;
