import { Button, Typography } from "@material-ui/core";
import Box from "@material-ui/core/Box";
import { createStyles, makeStyles, StyledComponentProps, Theme } from "@material-ui/core/styles";
import React, { useMemo } from "react";
import UserContainer from "../../../containers/userContainer";
import { Permission } from "../../../generated/graphql";
import { getFrequencyLimit, getLockLimit, getPaginationLimit } from "../../../utils/permission";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    title: {
      color: theme.palette.grey[800],
      fontSize: 20,
      fontWeight: 500,
      marginBottom: 8,
    },
    subtitle: {
      color: "#737373",
      fontSize: 16,
      marginBottom: 16,
    },
    button: {
      height: 46,
      width: 100,
      fontSize: 16,
    },
  }),
);

interface PermissionComponentProps extends StyledComponentProps {
  permissions: Permission[];
}

const PermissionComponent: React.FC<PermissionComponentProps> = (props) => {
  const classes = useStyles();
  const { permissions, ...restProps } = props;
  const { setActiveServiceDialogOpen } = UserContainer.useContainer();

  const lockLimit = useMemo(() => getLockLimit(permissions), [permissions]);
  const paginationLimit = useMemo(() => getPaginationLimit(permissions), [permissions]);
  const frequencyLimit = useMemo(() => getFrequencyLimit(permissions), [permissions]);

  const content = useMemo(() => {
    if (lockLimit || paginationLimit || frequencyLimit) {
      return (
        <Box className={classes.root} {...restProps}>
          <Typography className={classes.title}>购买正式账号，查看全量数据，解锁全部功能</Typography>
          <Typography className={classes.subtitle}>
            Rime Data 拥有丰富的一级市场研究数据，助您全面掌握市场新动态
          </Typography>
          <Button
            size="small"
            className={classes.button}
            variant="contained"
            disableElevation
            color="primary"
            onClick={() => setActiveServiceDialogOpen(true)}
          >
            点击购买
          </Button>
        </Box>
      );
    }
    return null;
  }, [
    lockLimit,
    paginationLimit,
    frequencyLimit,
    classes.root,
    classes.title,
    classes.subtitle,
    classes.button,
    restProps,
    setActiveServiceDialogOpen,
  ]);

  return content;
};

export default PermissionComponent;
