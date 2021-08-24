import { CircularProgress, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import _, { get } from "lodash";
import React, { CSSProperties, useEffect, useState } from "react";
import {
  Block as BlockModel,
  BlockSection as SectionModel,
  Filter,
  useRealmDataBlocksQuery,
} from "../../../../../generated/graphql";
import { useFilterInputs } from "../../../../../utils/hooks";
import AdvancedSearchContainer from "../../../../realm/container";
import BlockSection, { WebBlock } from "../../core/block";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      padding: "32px 0",
      width: "100%",
    },
    title: {
      fontSize: 16,
      color: "#333",
      fontWeight: 500,
    },
    circularProgress: {
      width: "100%",
      minHeight: 100,
      fontSize: 16,
      color: "#666",
      display: "grid",
      placeItems: "center",
    },
  }),
);

interface RealmDataBlockSectionProps {
  section?: SectionModel;
  data?: Array<BlockModel>;
  style?: CSSProperties;
  rowStyle?: CSSProperties;
  blockID?: string;
}

// eslint-disable-next-line react/display-name
const RealmDataBlockSection: React.FunctionComponent<RealmDataBlockSectionProps> = (props) => {
  const { section, data, style, rowStyle, blockID } = props;
  const classes = useStyles();
  const { realm, conditions } = AdvancedSearchContainer.useContainer();
  const [, handleFilterInputChange] = useFilterInputs(section?.filters as Filter[]);
  const [blocks, setBlocks] = useState<Array<BlockModel>>(data ?? []);
  const [fetching, setFetching] = useState(false);

  const [realmDataBlockQueryResult, executeQuery] = useRealmDataBlocksQuery({
    variables: {
      realmID: realm,
      blockID: blockID ? blockID : section?.blockID ?? "",
      conditions: conditions,
    },
    pause: true,
    requestPolicy: "network-only",
  });

  useEffect(() => {
    executeQuery();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [section, conditions, blockID, realm]);

  useEffect(() => {
    const data: Array<BlockModel> = get(realmDataBlockQueryResult, ["data", "realmDataBlocks"]);
    setFetching(realmDataBlockQueryResult.fetching);
    if (data) {
      setBlocks(data);
    }
  }, [realmDataBlockQueryResult]);

  return (
    <div className={classes.root} style={style}>
      {section && <Typography className={classes.title}>{section.name}</Typography>}
      {fetching ? (
        <div className={classes.circularProgress}>
          <CircularProgress size={30} />
        </div>
      ) : (
        <BlockSection
          permissions={section?.permissions}
          rowStyle={rowStyle}
          blocks={_.filter(blocks, (block) => block.__typename != "LayoutKVBlock") as WebBlock[]}
        />
      )}
    </div>
  );
};

export default RealmDataBlockSection;
