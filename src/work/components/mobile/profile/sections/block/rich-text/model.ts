import _ from "lodash";
import { ActionModel } from "../action";

type RichTextPattern =
  | "plain"
  | "title"
  | "subtitle"
  | "break_line"
  | "footnote"
  | "image"
  | "logo"
  | "tag"
  | "increase"
  | "decrease";
// interface RichTextPayload {

// }

/**
 * RichTextModel
 */
export class RichTextModel {
  pattern: RichTextPattern = "plain";
  value = "";
  icon = "";
  isBold = false;
  action: ActionModel = new ActionModel();

  static fromJSON(json: unknown): RichTextModel {
    const newModel = new RichTextModel();
    const pattern = _.get(json, "pattern");
    pattern && (newModel.pattern = pattern);
    const value = _.get(json, "value");
    value && (newModel.value = value);
    const icon = _.get(json, "icon");
    icon && (newModel.icon = icon);
    const isBold = _.get(json, "is_bold");
    isBold && (newModel.isBold = isBold);
    const action = _.get(json, "action");
    action && (newModel.action = ActionModel.fromJSON(action));
    return newModel;
  }
}
