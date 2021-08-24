import { Box, Button, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { CSSProperties } from "react";
import { withAlphaHex } from "with-alpha-hex";
import UserContainer from "../../../containers/userContainer";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      // inset: 0,
      top: -4,
      left: -4,
      bottom: -4,
      right: -4,
      background: withAlphaHex("#fff", 0.8),
      position: "absolute",
      textAlign: "center",
      display: "inline-flex",
      alignItems: "center",
      justifyContent: "center",
    },
    title: {
      fontSize: 14,
      lineHeight: 1.72,
      fontWeight: theme.typography.fontWeightMedium,
      color: theme.palette.grey[800],
      marginBottom: 4,
    },
    subtitle: {
      fontSize: 12,
      lineHeight: 1.34,
      marginBottom: 8,
      color: theme.palette.grey[600],
    },
    button: {
      paddingLeft: 12,
      paddingRight: 12,
    },
  }),
);

// eslint-disable-next-line @typescript-eslint/no-empty-interface
interface ACPlaceholderProps {
  className?: string;
  style?: CSSProperties;
}

const ACPlaceholder: React.FunctionComponent<ACPlaceholderProps> = (props) => {
  const classes = useStyles();
  const { setActiveServiceDialogOpen } = UserContainer.useContainer();
  return (
    <Box className={clsx(classes.root, props.className)} style={props.style}>
      <Box>
        <Typography className={classes.title}>购买正式账号，查看全量数据，解锁全部功能</Typography>
        <Typography className={classes.subtitle}>
          Rime Data 拥有丰富的一级市场研究数据，助您全面掌握市场新动态
        </Typography>
        <Button
          className={classes.button}
          color="primary"
          variant="contained"
          disableElevation
          size="small"
          onClick={() => setActiveServiceDialogOpen(true)}
        >
          点击购买
        </Button>
      </Box>
    </Box>
  );
};

export default ACPlaceholder;
