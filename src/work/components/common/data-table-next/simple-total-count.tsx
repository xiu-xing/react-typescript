import { createStyles, makeStyles, Typography } from "@material-ui/core";
import React, { ReactNode, useState } from "react";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    totalCountText: {
      margin: "16px 24px",
      color: "#737373",
      fontSize: 16,
      "& span": {
        color: "#333",
      },
    },
  }),
);

interface TotalCountProps {
  totalCount: number;
  prefixStr: string;
  suffixStr: string;
}

const DataTableTotalCount: React.FunctionComponent<TotalCountProps> = ({ totalCount, prefixStr, suffixStr }) => {
  const classes = useStyles();

  return (
    <Typography className={classes.totalCountText}>
      {prefixStr}
      <Typography component="span">{totalCount}</Typography>
      {suffixStr}
    </Typography>
  );
};

type HookReturnType = {
  totalCount: number;
  onTotalCountChange: React.Dispatch<React.SetStateAction<number>>;
  totalCountElement: ReactNode;
};

/**
 * DataTable 上展示条目总数的组件
 * @param templateStr 模板字符串, 格式: `共负责 {} 笔投资交易` => `共负责 100 笔投资交易`
 * @param hideWhenTotalCountZero 默认为 true， 即当 totalCount 为 0 时不展示
 */
export function useDataTableTotalCount(templateStr: string, hideWhenTotalCountZero = true): HookReturnType {
  const [totalCount, setTotalCount] = useState(0);

  const strArr = templateStr.split("{}");

  if (hideWhenTotalCountZero && totalCount === 0) {
    return {
      totalCountElement: null,
      totalCount: 0,
      onTotalCountChange: setTotalCount,
    };
  }

  return {
    totalCountElement: (
      <DataTableTotalCount prefixStr={strArr[0] ?? ""} suffixStr={strArr[1] ?? ""} totalCount={totalCount} />
    ),
    totalCount: totalCount,
    onTotalCountChange: setTotalCount,
  };
}
