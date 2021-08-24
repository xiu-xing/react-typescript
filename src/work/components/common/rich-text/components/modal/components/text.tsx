import React, { HTMLProps, ReactNode } from "react";
import { RichTextModel } from "../../../../../../models/richText/index";
import RichText from "../../../rich-text";
import ModalContainer from "../modalContainer";

interface TextProps extends HTMLProps<HTMLDivElement> {
  fieldId: string;
}

const Text: React.FunctionComponent<TextProps> = (props) => {
  const { fieldId, className } = props;
  const { modalData } = ModalContainer.useContainer();

  function contentComponent(): ReactNode {
    if (!modalData) {
      return null;
    }
    const textData = modalData.get(fieldId);
    if (Array.isArray(textData) && textData.length && textData) {
      return (
        <RichText
          classes={{ text: className }}
          values={textData.map((value: unknown) => RichTextModel.fromJSON(value))}
          showModal={false}
        />
      );
    }
    return null;
  }

  return <>{contentComponent()}</>;
};

export default Text;
