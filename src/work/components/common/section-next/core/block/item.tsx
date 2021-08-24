import React, { useMemo } from "react";
import { Block as BlockModel, FilterInputs } from "../../../../../generated/graphql";
import CellBlock from "./cell";
import KeyValueBlock from "./key-value";
import LegoBlock from "./lego";
import TagBlock from "./tag";
import TextAreaBlock from "./text-area";

interface BlockProp {
  model: BlockModel;
  span?: number;
  modal?: boolean;
  filterInput?: FilterInputs;
}

const BlockItem: React.FunctionComponent<BlockProp> = (props) => {
  const { model, modal, filterInput } = props;

  const blockComponent = useMemo(() => {
    switch (model.__typename) {
      case "KeyValueBlock":
        return <KeyValueBlock model={model} modal={modal} />;
      case "TextAreaBlock":
        return <TextAreaBlock model={model} />;
      case "TagBlock":
        return <TagBlock model={model} modal={modal} />;
      case "CellBlock":
        return <CellBlock model={model} disableTitle />;
      case "LegoBlock":
        return <LegoBlock model={model} filters={filterInput} />;
      case "LayoutKVBlock":
        return <></>;
      default:
        // eslint-disable-next-line no-case-declarations
        const _exhaustiveCheck: never = model;
        return _exhaustiveCheck;
    }
  }, [model]);

  return blockComponent;
};

export default BlockItem;
