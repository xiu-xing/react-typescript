import React, { useMemo } from "react";
import { Block as BlockModel, FilterInputs } from "../../../../../generated/graphql";
import CellBlock from "./cell-block";
import KeyValueBlock from "./key-value-block";
import LegoBlock from "./lego-block";
import TagBlock from "./tag-block";
import TextAreaBlock from "./text-area-block";

interface BlockProp {
  model: BlockModel;
  span?: number;
  modal?: boolean;
  filters?: FilterInputs;
}

const Block: React.FunctionComponent<BlockProp> = (props) => {
  const { model, modal, filters } = props;

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
        return <LegoBlock model={model} filters={filters} />;
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

export default Block;
