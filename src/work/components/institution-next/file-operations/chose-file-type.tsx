import { Box, Button, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { useState } from "react";
import { TrealmImportType } from "../../../generated/graphql";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: { padding: "24px 26px" },
    title: {
      fontSize: 14,
      color: theme.palette.grey[600],
      marginBottom: 16,
    },
    buttonBox: {
      display: "grid",
      gridAutoFlow: "row",
      gridTemplateColumns: "repeat(3, max-content)",
      gridRowGap: 20,
      gridColumnGap: 24,
    },
    button: {
      width: 100,
      height: 42,
      borderRadius: 4,
      border: "1px solid #EEE",
    },
    buttonText: {
      fontSize: 14,
      fontWeight: 500,
      color: theme.palette.grey[600],
    },
    activatedButton: {
      backgroundColor: `${theme.palette.primary.main} !important`,
      "& p": {
        color: "#fff",
      },
    },
  }),
);

interface ChoseFileTypeProps {
  onClick: (type: TrealmImportType) => void;
}

const typeList = [
  {
    type: TrealmImportType.FundManager,
    name: "基金管理人",
  },
  {
    type: TrealmImportType.Fund,
    name: "直投基金",
  },
  {
    type: TrealmImportType.PortfolioCompany,
    name: "直投项目",
  },
  {
    type: TrealmImportType.FundOfFund,
    name: "母基金",
  },
  {
    type: TrealmImportType.CommittedFund,
    name: "子基金",
  },
  {
    type: TrealmImportType.CommittedFundPortfolioCompany,
    name: "子基金项目",
  },
  {
    type: TrealmImportType.ShareholderRecord,
    name: "持股路径",
  },
];

const ChoseFileType: React.FunctionComponent<ChoseFileTypeProps> = (props) => {
  const classes = useStyles();
  const { onClick } = props;
  const [active, setActive] = useState<number>();
  return (
    <div className={classes.root}>
      <Typography className={classes.title}>选择文件导入类型</Typography>
      <Box className={classes.buttonBox}>
        {typeList.map((item, index) => (
          <Button
            key={item.type}
            className={clsx(classes.button, index === active && classes.activatedButton)}
            onClick={() => {
              setActive(index);
              onClick(item.type);
            }}
          >
            <Typography className={classes.buttonText}>{item.name}</Typography>
          </Button>
        ))}
      </Box>
    </div>
  );
};

export default ChoseFileType;
