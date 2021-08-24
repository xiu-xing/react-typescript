import { Typography } from "@material-ui/core";
import _ from "lodash";
import React, { ReactNode } from "react";
import { ActionType } from "../../../../../../generated/graphql";
import RichText from "../rich-text";
import { RichTextModel } from "../rich-text/model";

export const RISK_DATA_KEY = "risk_detail_data";

export class ActionModel {
  type = "";
  args: Map<string, string> = new Map();
  data: Record<string, string> = Object.create(null);

  static fromJSON(json: unknown): ActionModel {
    const actionModel = new ActionModel();
    const type = _.get(json, "type");
    type && (actionModel.type = type);
    const args = _.get(json, "args");
    args && (actionModel.args = args);
    const data = _.get(json, "data");
    data && (actionModel.data = data);
    return actionModel;
  }
}

export const getActionHandler = (action: ActionModel, title?: string, entityName?: string) => {
  switch (action.type) {
    case ActionType.Profile:
      if (action.args["entity_id"] && action.args["entity_type"]) {
        return () =>
          window.open(`js://webview/profile?id=${action.args["entity_id"]}&type=${action.args["entity_type"]}`);
      }
      break;
    case ActionType.SubProfile:
      if (action.args["entity_id"] && action.args["entity_type"] && action.args["sub_profile_id"]) {
        return () =>
          window.open(
            `js://webview/sub-profile?id=${action.args["entity_id"]}&type=${action.args["entity_type"]}&subProfileId=${action.args["sub_profile_id"]}`,
          );
      }
      break;
    case ActionType.ExternalLink:
      if (action.args) {
        let url = action.args["url"] ?? `/`;
        if (url.indexOf("http") === -1) {
          url = "http://" + url;
        }
        return () => window.open(url);
      }
      break;
    case ActionType.RiskDetail:
      if (action.data) {
        if (action.args) {
          const riskId = action.args["risk_id"];

          return () => {
            window.open(`js://webview/risk-detail?title=${title}&entityName=${entityName}&riskId=${riskId}`);
          };
        }
      }
      break;
    case ActionType.FullScreenChart:
      if (action.args["entity_id"] && action.args["entity_type"] && action.args["chart_id"]) {
        return () =>
          window.open(
            `js://webview/chart?entityId=${action.args["entity_id"]}&entityType=${action.args["entity_type"]}&chartId=${action.args["chart_id"]}`,
          );
      }
      break;
    case ActionType.FullScreenGraph:
      if (action.args["entity_id"] && action.args["entity_type"] && action.args["graph_id"]) {
        return () =>
          window.open(
            `js://webview/chart?entityId=${action.args["entity_id"]}&entityType=${action.args["entity_type"]}&graphId=${action.args["graph_id"]}`,
          );
      }
      return undefined;
  }
};

export function getRichTextComponent(content: string): ReactNode {
  try {
    const model: RichTextModel[] = JSON.parse(content);
    return <RichText models={model} />;
  } catch (error) {
    return <Typography>-</Typography>;
  }
}
