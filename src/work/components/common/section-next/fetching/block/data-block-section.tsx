import { Box, CircularProgress, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import _, { get } from "lodash";
import React, { CSSProperties, useEffect, useState } from "react";
import {
  Block as BlockModel,
  BlockSection as BlockSectionModel,
  Filter,
  Maybe,
  NextPlatform,
  Tag as TagModel,
  useDataBlocksQuery,
} from "../../../../../generated/graphql";
import { ActionModel, onAction } from "../../../../../models/action/action-next";
import { useFilterInputs } from "../../../../../utils/hooks";
import { useProfileEntity } from "../../../../profile/atoms";
import Space from "../../../space";
import Tag from "../../../tag";
import Block, { WebBlock } from "../../core/block";
import SectionWrapper from "../../core/section";

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
    },
    circularProgress: {
      width: "100%",
      minHeight: 100,
      display: "grid",
      placeItems: "center",
    },
  }),
);

interface DataBlockSectionProps {
  section?: BlockSectionModel;
  data?: Array<BlockModel>;
  style?: CSSProperties;
  rowStyle?: CSSProperties;
  dataBlockId?: string;
}

// eslint-disable-next-line react/display-name
const DataBlockSection = React.forwardRef<HTMLDivElement, DataBlockSectionProps>((props, ref) => {
  const { section, data, style, rowStyle, dataBlockId } = props;
  const classes = useStyles();
  const [entity] = useProfileEntity();
  const [mixedFilterInputs, update] = useFilterInputs(section?.filters as Filter[]);
  const [blocks, setBlocks] = useState<Array<BlockModel>>(data ?? []);
  const [fetching, setFetching] = useState(true);
  const [dataBlockQueryResult, executeQuery] = useDataBlocksQuery({
    variables: {
      blockID: dataBlockId ?? section?.blockID ?? "",
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
  }, [section, mixedFilterInputs, entity]);

  useEffect(() => {
    const data: Array<BlockModel> = get(dataBlockQueryResult, ["data", "dataBlocks"]);

    setFetching(dataBlockQueryResult.fetching);

    setBlocks(data);
  }, [dataBlockQueryResult]);

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
      <SectionWrapper filters={section?.filters} filtersOnChange={update} footnotes={section?.footnotes}>
        {fetching ? (
          <div className={classes.circularProgress}>
            <CircularProgress size={30} />
          </div>
        ) : (
          <Block
            permissions={section?.permissions}
            rowStyle={rowStyle}
            blocks={_.filter(blocks, (block) => block.__typename != "LayoutKVBlock") as WebBlock[]}
            filterInputs={mixedFilterInputs}
          />
        )}
      </SectionWrapper>
    </div>
  );
});

export default DataBlockSection;
