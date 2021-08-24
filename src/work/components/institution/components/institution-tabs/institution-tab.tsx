import { Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import React from "react";
import theme from "../../../../theme";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      width: 168,
      minWidth: 168,
      height: 136,
      padding: 16,
      borderRadius: 4,
      border: "1px solid #EEE",
      marginLeft: 24,
      cursor: "pointer",
      userSelect: "none",
      "&:last-child": {
        marginRight: 24,
      },
    },
    inactive: {
      "&:hover": {
        backgroundColor: "rgba(0, 0, 0, 0.04)",
        borderColor: "#fff",
      },
    },
    active: {
      color: theme.palette.primary.main,
      // backgroundColor: "#85AEC0",
      boxShadow:
        "0px 1px 8px 0px rgba(133, 174, 192, 0.2), 0px 3px 3px -2px rgba(133, 174, 192, 0.12), 0px 3px 4px 0px rgba(133, 174, 192, 0.14)",
      // border: "none",
      border: `2px solid ${theme.palette.primary.main}`,
    },
    name: {
      fontSize: 16,
    },
    count: {
      fontSize: 28,
      fontWeight: 500,
      marginTop: 16,
    },
  }),
);

interface InstitutionTabProps {
  name: string;
  count?: number;
  active?: boolean;
  onClick?: () => void;
}

const InstitutionTab: React.FunctionComponent<InstitutionTabProps> = (props) => {
  const classes = useStyles();
  const { name, count, active, onClick } = props;

  return (
    <div className={clsx(classes.root, active ? classes.active : classes.inactive)} onClick={onClick}>
      <Typography className={classes.name} style={{ color: "#737373" }}>
        {name}
      </Typography>
      <Typography className={classes.count} style={{ color: theme.palette.primary.main }}>
        {count || 0}
      </Typography>
    </div>
  );
};

export default InstitutionTab;
