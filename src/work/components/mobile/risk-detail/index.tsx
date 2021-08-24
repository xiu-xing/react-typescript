import { Box, createStyles, makeStyles } from "@material-ui/core";
import React, { useEffect, useState } from "react";
import {
  Block,
  LayoutKvBlock as LayoutKvBlockModel,
  LayoutKvBlockFieldsFragment,
  NextPlatform,
  useKeyValueMapQuery,
} from "../../../generated/graphql";
import { convertBlockProtos } from "../../../utils/blockProtos";
import KeyValueBlock from "../profile/sections/block/blocks/key-value";
import CellBlock from "../profile/sections/block/blocks/cell";
import LayoutKVBlock from "../profile/sections/block/blocks/layout-kv";
import TextAreaBlock from "../profile/sections/block/blocks/text-area";
import TagBlock from "../profile/sections/block/blocks/tag";
import nanoid from "nanoid";
import { RISK_DATA_KEY } from "../profile/sections/block/action";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      padding: "20px 14px 20px 16px",
    },
    title: {
      fontSize: 18,
      fontWeight: 500,
      marginBottom: 17,
    },
  }),
);

interface RiskDetailProps {
  title: string;
  riskId?: string;
}

const MobileRiskDetail: React.FunctionComponent<RiskDetailProps> = (props) => {
  const classes = useStyles();
  const [data, setData] = useState<string>();

  const requestBody = JSON.stringify({ "risk_id": props.riskId });

  const [riskDetail] = useKeyValueMapQuery({
    variables: {
      funcID: "risk.risk_entity",
      requestBody: requestBody,
      platform: NextPlatform.PlatformMobile,
    },
    requestPolicy: "network-only",
  });

  useEffect(() => {
    if (riskDetail.data?.keyValueMap?.data) setData(riskDetail.data?.keyValueMap?.data);
  }, [riskDetail]);

  function convertKVBlockFieldsFragment(data: LayoutKvBlockModel): LayoutKvBlockFieldsFragment {
    return {
      __typename: data.__typename,
      blockFields: data.fields,
      name: data.name,
    };
  }

  const blockComponent = (block: Block) => {
    switch (block.__typename) {
      case "KeyValueBlock":
        return <KeyValueBlock block={block} key={nanoid(8)} />;
      case "TextAreaBlock":
        return <TextAreaBlock block={block} key={nanoid(8)} />;
      case "TagBlock":
        return <TagBlock block={block} key={nanoid(8)} />;
      case "CellBlock":
        return <CellBlock block={block} key={nanoid(8)} />;
      case "LayoutKVBlock":
        return <LayoutKVBlock block={convertKVBlockFieldsFragment(block)} foldNode={false} key={nanoid(8)} />;
      default:
      // eslint-disable-next-line no-case-declarations
    }
  };

  return (
    <Box className={classes.root}>
      <Box className={classes.title}>{props.title}</Box>
      {data && convertBlockProtos(data).map((b) => blockComponent(b))}
    </Box>
  );
};

export default MobileRiskDetail;
