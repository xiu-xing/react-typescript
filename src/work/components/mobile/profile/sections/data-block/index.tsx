import { Box, ButtonBase, CircularProgress, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { ChevronDown, ChevronUp } from "mdi-material-ui";
import React, { useEffect, useState } from "react";
import { useClient } from "urql";
import {
  Block,
  BlockSection as BlockSectionModel,
  DataBlocksDocument,
  DataBlocksQuery,
  DataBlocksQueryVariables,
  EntityType,
  FilterInputs,
  NextPlatform,
} from "../../../../../generated/graphql";
import NoData from "../../no-data";
import BlockSection from "../block";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    blockBox: {
      position: "relative",
    },
    title: {
      fontSize: 14,
      color: "#333",
      lineHeight: "24px",
      fontWeight: 500,
    },
    titleBox: {
      display: "flex",
      justifyContent: "space-between",
      paddingBottom: 12,
    },
    button: {
      padding: "0px 4px",
    },
    buttonIcon: {
      color: theme.palette.primary.main,
      fontSize: 20,
      borderRadius: 4,
    },
    fetching: {
      position: "absolute",
      top: "40%",
      left: "40%",
    },
    buttonText: {
      fontSize: 12,
      color: theme.palette.primary.main,
    },
  }),
);

interface DataBlockSectionProps {
  section?: BlockSectionModel;
  blockID?: string;
  entityId: string;
  entityType: EntityType;
  filters?: FilterInputs;
}

const DataBlockSection: React.FunctionComponent<DataBlockSectionProps> = (props) => {
  const classes = useStyles();
  const { section, entityId, entityType, filters } = props;

  const [blocks, setBlocks] = useState<Block[]>([]);
  const [unFoldBlocks, setUnFoldBlocks] = useState<Block[]>();
  const [open, setOpen] = useState(false);
  const [fetching, setFetching] = useState(false);
  const [showNoData, setShowNodata] = useState(false);

  const client = useClient();

  const executeDataBlockQuery = (id?: string) => {
    setFetching(true);
    const blockID = id ?? props.blockID ?? section?.blockID ?? "";

    client
      .query<DataBlocksQuery, DataBlocksQueryVariables>(DataBlocksDocument, {
        blockID: blockID,
        entityID: entityId,
        entityType: entityType,
        filters: filters,
        platform: NextPlatform.PlatformMobile,
      })
      .toPromise()
      .then((res) => {
        setFetching(false);
        if (res.error) return setShowNodata(true);

        const data = res.data?.dataBlocks as Block[];

        if (!data && blocks.length === 0) return setShowNodata(true);

        if (id) return setUnFoldBlocks(data);
        setBlocks(data);
      });
  };

  async function onButtonClick(): Promise<void> {
    if (!open) {
      executeDataBlockQuery(section?.unfoldBlockID ?? "");

      return setOpen(!open);
    }

    setUnFoldBlocks(undefined);
    return setOpen(!open);
  }

  useEffect(() => {
    setOpen(false);
    setShowNodata(false);

    executeDataBlockQuery();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [filters]);

  return (
    <div className={classes.root}>
      {section?.name && (
        <div className={classes.titleBox}>
          <Typography className={classes.title}>{section.name}</Typography>
          {section?.unfoldBlockID && (
            <ButtonBase onClick={onButtonClick} className={classes.button}>
              {open ? (
                <>
                  <Box className={classes.buttonText}>收起</Box>
                  <ChevronUp className={classes.buttonIcon} />
                </>
              ) : (
                <>
                  <Box className={classes.buttonText}>展开</Box>
                  <ChevronDown className={classes.buttonIcon} />
                </>
              )}
            </ButtonBase>
          )}
        </div>
      )}
      <div className={classes.blockBox}>
        {!unFoldBlocks &&
          blocks.map((block, index) => (
            <div key={`b_${index}`} style={{ marginTop: index != 0 ? 16 : 0 }}>
              <BlockSection block={block} entityId={entityId} entityType={entityType} />
            </div>
          ))}
        {unFoldBlocks &&
          unFoldBlocks.map((block, index) => (
            <div key={`ub_${index}`} style={{ marginTop: index != 0 ? 16 : 0 }}>
              <BlockSection block={block} entityId={entityId} entityType={entityType} />
            </div>
          ))}
        {/* {fetching && <CircularProgress size={30} className={classes.fetching} />} */}
        {showNoData && <NoData />}
      </div>
    </div>
  );
};

export default DataBlockSection;
