import React from "react";
import { Block as BlockModel, EntityType } from "../../../../../generated/graphql";
import CellBlock from "./blocks/cell";
import KeyValueBlock from "./blocks/key-value";
import LayoutKVBlock from "./blocks/layout-kv";
import LegoBlock from "./blocks/lego";
import TagBlock from "./blocks/tag";
import TextAreaBlock from "./blocks/text-area";

interface BlockSectionProps {
  block: BlockModel;
  entityId: string;
  entityType: EntityType;
  foldNode?: boolean;
}

const BlockSection: React.FunctionComponent<BlockSectionProps> = (props) => {
  const { block, entityId, entityType, foldNode } = props;

  const blockComponent = () => {
    switch (block.__typename) {
      case "KeyValueBlock":
        return <KeyValueBlock block={block} />;
      case "TextAreaBlock":
        return <TextAreaBlock block={block} />;
      case "TagBlock":
        return <TagBlock block={block} />;
      case "CellBlock":
        return <CellBlock block={block} />;
      case "LegoBlock":
        return <LegoBlock block={block} entityId={entityId} entityType={entityType} />;
      case "LayoutKVBlock":
        return <LayoutKVBlock block={block} foldNode={foldNode ?? false} />;
      default:
        // eslint-disable-next-line no-case-declarations
        const _exhaustiveCheck: never = block;
        return _exhaustiveCheck;
    }
  };

  return blockComponent();
};

export default BlockSection;
