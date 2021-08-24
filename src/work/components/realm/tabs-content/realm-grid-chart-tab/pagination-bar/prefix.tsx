import { Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React from "react";
import NumberFormat from "react-number-format";
import CommonGridContainer from "../../../../common/common-grid-components/grid/container";
import { CommonGridConfig } from "../../../../common/common-grid-components/grid/types";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    text: {
      fontSize: 14,
      display: "flex",
      alignItems: "center",
      whiteSpace: "pre",
    },
    totalCount: {
      fontSize: 14,
      marginLeft: 8,
    },
    totalCountIcon: {
      color: "#666",
      marginInlineEnd: 4,
      marginBottom: 2,
    },
  }),
);

interface PrefixProps {
  gridConfig: CommonGridConfig;
}

const Prefix: React.FunctionComponent<PrefixProps> = ({ gridConfig }) => {
  const classes = useStyles();
  const { totalCount } = CommonGridContainer.useContainer();
  const iconSrc = gridConfig?.icon;
  const title = gridConfig?.unitDescription;

  return (
    <>
      <Typography className={classes.text}>
        <img src={iconSrc} className={classes.totalCountIcon} />
        <NumberFormat value={totalCount} displayType="text" thousandSeparator className={classes.totalCount} />
        {` ${title}`}
      </Typography>
    </>
  );
};

export default Prefix;
