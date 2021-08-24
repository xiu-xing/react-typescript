import { Box, IconButton, Popover, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { Cellphone } from "mdi-material-ui";
import React from "react";
import { AppQrcodePNG } from "../../../../../assets/png";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    iconButton: {
      color: "#fff",
    },
    content: {
      width: "auto",
      padding: "12px 16px",
      display: "flex",
      flexDirection: "column",
    },
    qrcode: {
      width: 152,
      height: 152,
    },
    appText: {
      fontSize: 16,
      margin: 0,
      textAlign: "center",
    },
  }),
);

const AppDownload: React.FunctionComponent<{}> = () => {
  const classes = useStyles();

  const [anchorEl, setAnchorEl] = React.useState<HTMLButtonElement | null>(null);

  function onIconButtonClick(event: React.MouseEvent<HTMLButtonElement>): void {
    setAnchorEl(event.currentTarget);
  }

  const handleClose = (): void => {
    setAnchorEl(null);
  };

  return (
    <>
      <IconButton className={classes.iconButton} onClick={onIconButtonClick}>
        <Cellphone />
      </IconButton>
      <Popover
        anchorEl={anchorEl}
        open={Boolean(anchorEl)}
        onClose={handleClose}
        anchorOrigin={{
          vertical: "bottom",
          horizontal: "right",
        }}
        disableScrollLock
        keepMounted
      >
        <Box className={classes.content}>
          <img src={AppQrcodePNG} alt="" className={classes.qrcode} />
          <Typography color="primary" className={classes.appText}>
            RimeData APP
          </Typography>
        </Box>
      </Popover>
    </>
  );
};

export default AppDownload;
