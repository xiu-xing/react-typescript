import { Box, CircularProgress, Typography, useMediaQuery, useTheme } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import { get } from "lodash";
import React, { CSSProperties, useEffect, useLayoutEffect, useState } from "react";
import {
  BlockSection as SectionModel,
  Filter,
  Maybe,
  NextPlatform,
  Tag as TagModel,
  useDataBlocksQuery,
} from "../../../../generated/graphql";
import { ActionModel, onAction } from "../../../../models/action/action-next";
import { useFilterInputs } from "../../../../utils/hooks";
import { getLockLimit } from "../../../../utils/permission";
import { useProfileEntity } from "../../../profile/atoms";
import FilterItem from "../../filter-item";
import { WebBlock } from "../../section-next/core/block";
import Space from "../../space";
import Tag from "../../tag";
import ACPlaceholder from "../ac-placeholder";
import Footnotes from "../footnotes";
import Row from "../row";
import Block from "./block";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      padding: "32px 0",
      width: "100%",
    },
    header: {
      display: "flex",
      flexDirection: "row",
      alignItems: "center",
    },
    title: {
      fontSize: 16,
      color: "#333",
      fontWeight: 500,
      marginRight: 6,
    },
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
    blur: {
      filter: "blur(4px)",
      userSelect: "none",
    },
    filters: {
      margin: "16px 0",
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

interface BlockSectionProps {
  section?: SectionModel;
  data?: Array<WebBlock>;
  style?: CSSProperties;
  rowStyle?: CSSProperties;
  blockId?: string;
}

// eslint-disable-next-line react/display-name
const BlockSection = React.forwardRef<HTMLDivElement, BlockSectionProps>((props, ref) => {
  const { section, data, style, rowStyle, blockId } = props;
  const classes = useStyles();
  const [entity] = useProfileEntity();
  const theme = useTheme();

  const [rows, setRows] = useState<Array<Array<WebBlock>>>([]);
  const [colNumber, setColNumber] = useState(3);
  const upLG = useMediaQuery(theme.breakpoints.up("lg"));
  const inSMAndMD = useMediaQuery(theme.breakpoints.between("sm", "md"));
  const downXS = useMediaQuery(theme.breakpoints.down("xs"));

  const [blocks, setBlocks] = useState<Array<WebBlock>>(data ?? []);
  const [fetching, setFetching] = useState(true);

  const [mixedFilterInputs, handleFilterInputChange] = useFilterInputs(section?.filters as Filter[]);

  const [dataBlockQueryResult, executeQuery] = useDataBlocksQuery({
    variables: {
      blockID: blockId ?? section?.blockID ?? "",
      entityID: entity.id,
      entityType: entity.type,
      platform: NextPlatform.PlatformWeb,
      filters: mixedFilterInputs,
    },
    pause: true,
  });

  const tag = (tag: Maybe<TagModel>, index: number) => {
    if (tag && tag.__typename === "TextTag") {
      return (
        <Tag
          key={(tag.name as string) + index}
          label={tag.name as string}
          onClick={onAction(ActionModel.fromJSON(tag.action))}
          style={{ cursor: tag.action ? "pointer" : "default", height: 22 }}
        />
      );
    }
    return null;
  };

  useEffect(() => {
    executeQuery();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [section, mixedFilterInputs, entity, blockId]);

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

  useEffect(() => {
    const data: Array<WebBlock> = get(dataBlockQueryResult, ["data", "dataBlocks"]);

    setFetching(dataBlockQueryResult.fetching);

    setBlocks(data);
  }, [dataBlockQueryResult]);

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
            rowItemNumber = 0;
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
    <div className={classes.root} ref={ref} style={style}>
      {section && (
        <Box className={classes.header}>
          <Typography className={classes.title}>{section.name}</Typography>
          <Space wrap size={12}>
            {section.tags && section.tags.length > 0 && section.tags.map((v, i) => tag(v, i))}
          </Space>
        </Box>
      )}
      <Box
        className={classes.content}
        style={{ ...(section && getLockLimit(section.permissions) && { minHeight: 100 }) }}
      >
        <Box className={clsx({ [classes.blur]: section ? getLockLimit(section.permissions) : false })}>
          {section && section.filters && (
            <div className={classes.filters}>
              <Space size="middle" wrap>
                {section.filters.map((f, i) => (
                  <FilterItem key={i} filter={f} onChange={handleFilterInputChange} />
                ))}
              </Space>
            </div>
          )}
          {fetching ? (
            <div className={classes.onData}>
              <CircularProgress size={30} />
            </div>
          ) : rows.length > 0 ? (
            rows.map((row, index) => (
              <Row key={index} wrap={false} className={classes.row} style={rowStyle}>
                {row.map((value, i) => (
                  <Block key={i} span={(value.width / colNumber) * 3} model={value} filters={mixedFilterInputs} />
                ))}
              </Row>
            ))
          ) : (
            <div className={classes.onData}>暂无数据</div>
          )}
          {section && section.footnotes && section.footnotes.length > 0 ? (
            <Footnotes footnotes={section.footnotes} />
          ) : null}
        </Box>
        {section && getLockLimit(section.permissions) && <ACPlaceholder />}
      </Box>
    </div>
  );
});

export default BlockSection;
