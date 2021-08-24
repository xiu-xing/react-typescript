import { Box, useMediaQuery, useTheme } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { CSSProperties, useLayoutEffect, useState } from "react";
import {
  CellBlock,
  FilterInputs,
  KeyValueBlock,
  LegoBlock,
  Maybe,
  Permission,
  TagBlock,
  TextAreaBlock,
} from "../../../../../generated/graphql";
import { getLockLimit } from "../../../../../utils/permission";
import ACPlaceholder from "../../components/ac-placeholder";
import Row from "../../components/row";
import BlockItem from "./item";

const useStyles = makeStyles(() =>
  createStyles({
    row: {
      "& >.col:not(:first-child)": {
        borderLeft: "1px solid #EEE",
        paddingLeft: 15,
      },
      "& >.col:not(:last-child)": {
        paddingRight: 15,
      },
    },
    content: {
      position: "relative",
      "& .row:not(:first-child)": {
        marginTop: 24,
      },
    },
    onData: {
      width: "100%",
      minHeight: 100,
      fontSize: 16,
      color: "#666",
      display: "grid",
      placeItems: "center",
    },
  }),
);

export type WebBlock = TextAreaBlock | KeyValueBlock | TagBlock | CellBlock | LegoBlock;

export interface BlockProps {
  rowStyle?: CSSProperties;
  blocks: WebBlock[];
  permissions?: Maybe<Permission[]>;
  filterInputs?: FilterInputs;
}

// eslint-disable-next-line react/display-name
const Block: React.FunctionComponent<BlockProps> = (props) => {
  const { rowStyle, permissions, blocks, filterInputs } = props;
  const classes = useStyles();
  const theme = useTheme();
  const [rows, setRows] = useState<Array<Array<WebBlock>>>([]);
  const [colNumber, setColNumber] = useState(3);
  const upLG = useMediaQuery(theme.breakpoints.up("lg"));
  const inSMAndMD = useMediaQuery(theme.breakpoints.between("sm", "md"));
  const downXS = useMediaQuery(theme.breakpoints.down("xs"));

  useLayoutEffect(() => {
    if (upLG) {
      setColNumber(3);
    }
    if (inSMAndMD) {
      setColNumber(2);
    }
    if (downXS) {
      setColNumber(1);
    }
  }, [upLG, inSMAndMD, downXS]);

  function layoutColumns(): void {
    const newRows: Array<Array<WebBlock>> = [];
    let rowItemNumber = 0;
    let row: Array<WebBlock> = [];
    if (!blocks || blocks.length <= 0) {
      return;
    }
    switch (colNumber) {
      case 1: {
        blocks.map((block) => {
          newRows.push([block]);
        });
        break;
      }
      case 2: {
        blocks.map((block, index) => {
          if (block.width >= 2 && row.length > 0) {
            newRows.push(row);
            row = [];
            rowItemNumber = 0;
          }
          if (block.width >= 2 && row.length === 0) {
            newRows.push([block]);
            return;
          }
          row.push(block);
          rowItemNumber += block.width ?? 2;
          if (rowItemNumber >= 2 || index === blocks?.length - 1) {
            newRows.push(row);
            row = [];
          }
        });
        break;
      }
      case 3: {
        blocks.map((block, index) => {
          row.push(block);
          rowItemNumber += block.width ?? 3;
          if (rowItemNumber >= 3 || index === blocks?.length - 1) {
            newRows.push(row);
            row = [];
            rowItemNumber = 0;
          }
        });
        break;
      }
    }

    setRows(newRows);
  }

  useLayoutEffect(() => {
    layoutColumns();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [colNumber, blocks]);

  return (
    <>
      {rows.length > 0 ? (
        <Box className={classes.content} style={{ ...(getLockLimit(permissions) && { minHeight: 100 }) }}>
          {rows.map((row, index) => (
            <Row key={index} wrap={false} className={classes.row} style={rowStyle}>
              {row.map((value, i) => (
                <BlockItem key={i} span={(value.width / colNumber) * 3} model={value} filterInput={filterInputs} />
              ))}
            </Row>
          ))}
          {getLockLimit(permissions) && <ACPlaceholder />}
        </Box>
      ) : (
        <div className={classes.onData}>暂无数据</div>
      )}
    </>
  );
};

export default Block;
