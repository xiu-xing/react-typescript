import { Box } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import {
  EntityInput,
  EntityType,
  Func,
  FuncType,
  LegoBlock as LegoBlockModel,
} from "../../../../../../generated/graphql";
import ChartSection from "../../chart";
import DataBlockSection from "../../data-block";

const useStyles = makeStyles(() =>
  createStyles({
    title: {
      fontSize: 12,
      color: "#999",
    },
    legoBox: {
      "&:not(:last-child)": {
        marginTop: 16,
      },
    },
  }),
);

interface LegoBlockProps {
  block: LegoBlockModel;
  entityId: string;
  entityType: EntityType;
}

const LegoBlock: React.FunctionComponent<LegoBlockProps> = (props) => {
  const classes = useStyles();
  const { block, entityId, entityType } = props;

  const funcsContent = (func: Func, index: number) => {
    const entity: EntityInput = {
      entityId: entityId,
      entityType: entityType,
    };

    switch (func.funcType) {
      case FuncType.FuncTypeChart:
        return <ChartSection name={func.funcName as string} id={func.funcID} {...entity} />;
      case FuncType.FuncTypeDataBlock:
        return <DataBlockSection blockID={func.funcID} {...entity} />;
      // 以下暂无
      // case FuncType.FuncTypeUndefined:
      // case FuncType.FuncTypeKeyValueMap:
      // case FuncType.FuncTypeSubProfile:
      // case FuncType.FuncTypeInfoFlow:
      // case FuncType.FuncTypeList:
      // case FuncType.FuncTypeGraph:
      default:
        console.error("Error FuncType From LegoBlock");
        break;
    }
  };

  return (
    <div>
      <div className={classes.legoBox}>
        {block.funcs?.map((func, index) => (
          <Box key={func.funcID + index}>
            {index != 0 && <Box height={16} />}
            {funcsContent(func, index)}
          </Box>
        ))}
      </div>
    </div>
  );
};

export default LegoBlock;
