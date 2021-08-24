import { StyledComponentProps } from "@material-ui/core";
import React, { HTMLProps } from "react";
import { uid } from "react-uid";
import { RichTextModel } from "../../../models/richText";
import IconElement from "./components/icon-element/icon-element";
import TextElement from "./components/text-element";

export type RichTextClassKey = "text" | "icon" | "link";

/**
 * 可以提供 classes 属性，以修改副文本样式： classes.text | classes.icon | classes.link
 */
export interface RichTextProps extends Omit<HTMLProps<HTMLElement>, "value">, StyledComponentProps<RichTextClassKey> {
  values: RichTextModel[];
  // 解决嵌套 modal 的问题
  showModal?: boolean;
  showPlaceHolder?: boolean;
}

/**
 * 副文本
 * @param props
 */
const RichText: React.FunctionComponent<RichTextProps> = (props) => {
  const { classes, showModal } = props;

  return (
    <React.Fragment>
      {props.values.length > 0
        ? props.values.map((value: RichTextModel, index: number) => {
            if (value.icon) {
              return <IconElement dataSource={value} key={uid(value, index)} />;
            } else {
              return <TextElement classes={classes} showModal={showModal} dataSource={value} key={uid(value, index)} />;
            }
          })
        : props.showPlaceHolder
        ? "-"
        : null}
    </React.Fragment>
  );
};

RichText.defaultProps = {
  showPlaceHolder: false,
};

export default RichText;
