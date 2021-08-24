import { Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { Skeleton } from "@material-ui/lab";
import React, { ReactNode } from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      // height: 163,
      padding: 16,
      border: "1px solid #EEE",
      borderRadius: 4,
      color: "#666",
      cursor: "pointer",
      "&:hover": {
        border: `1px solid ${theme.palette.primary.main}`,
      },
    },
    title: {
      fontSize: 14,
    },
    mainValue: {
      fontSize: 28,
      fontWeight: 500,
      marginTop: 4,
    },
    subItemBox: {
      marginTop: 12,

      display: "flex",
    },
    subItem: {
      flex: 1,
    },
    subtitle: {
      fontSize: 12,
    },
    field: {
      display: "flex",
      alignItems: "center",
    },
    label: {
      fontSize: 14,
      minWidth: 44,
    },
    value: {
      fontSize: 16,
      fontWeight: 500,
      marginLeft: 6,
    },
  }),
);

export interface FieldProps {
  title: string;
  subtitle: string;
  value: string;
}

interface StatisticCellProps {
  valueColor?: string;
  data: FieldProps[];
  onClick?: () => void;
}

const StatisticCell: React.FunctionComponent<StatisticCellProps> = (props) => {
  const classes = useStyles();

  function contentComponent(): ReactNode {
    if (!props.data.length) {
      return <Skeleton variant="rect" height={156} />;
    }

    const mainItem = props.data[0];
    const subItem = props.data.slice(1, props.data.length);
    return (
      <div className={classes.root} onClick={props.onClick}>
        <Typography className={classes.title}>{mainItem.title}</Typography>
        <Typography style={{ color: props.valueColor ?? undefined }} className={classes.mainValue}>
          {mainItem.value || 0}
        </Typography>
        <div className={classes.subItemBox}>
          {subItem.map(({ title, subtitle, value }, index) => {
            return (
              <div key={index} className={classes.subItem}>
                <Typography className={classes.subtitle}>{title}</Typography>
                <div className={classes.field}>
                  <Typography className={classes.label}>{subtitle || "-"}</Typography>
                  <Typography className={classes.value} style={{ color: props.valueColor ?? undefined }}>
                    {value || 0}
                  </Typography>
                </div>
              </div>
            );
          })}
        </div>
      </div>
    );
  }

  return <>{contentComponent()}</>;
};

export default StatisticCell;
