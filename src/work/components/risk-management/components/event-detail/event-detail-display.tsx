import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { ReactNode } from "react";
import ConfigContainer from "../../../../containers/configContainer";
import { RichTextModel } from "../../../../models/richText/index";
import { TableColumnModel } from "../../../../models/table/tableColumn";
import Field from "./event-detail-field";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      height: (autoHeight): string | undefined => (!autoHeight ? "100%" : undefined),
      display: "flex",
      flexDirection: "column",
    },
    value: {
      fontWeight: 500,
    },
  }),
);

export interface DataTableColumnsDisplayProps {
  tagCode: string;
  content: string;
}

const EventDetailsDisplay: React.FunctionComponent<DataTableColumnsDisplayProps> = (props) => {
  const classes = useStyles(props);
  const configContainer = ConfigContainer.useContainer();
  const tableModel = configContainer.riskEventConfig?.[props.tagCode];

  function contentComponent(): ReactNode {
    if (!tableModel) {
      return;
    }
    if (tableModel.id) {
      const fields: ReactNode[] = [];
      try {
        const jsonData = JSON.parse(props.content);
        Object.entries(tableModel.columns).forEach(([childKey, childJSON]) => {
          if (typeof childKey === "string") {
            const tableColumnModel = TableColumnModel.fromJSON(childJSON);
            if (jsonData[childKey]) {
              const eventDetailModelArray: RichTextModel[] = [];
              const length = jsonData[childKey].length;
              for (let i = 0; i < length; i++) {
                const eventDetailModel = jsonData[childKey][i] as RichTextModel;
                eventDetailModelArray.push(eventDetailModel);
                if (i < length - 1) {
                  const comma = new RichTextModel();
                  comma.value = ", ";
                  eventDetailModelArray.push(comma);
                }
              }
              fields.push(
                <Field
                  key={childKey}
                  label={tableColumnModel.title}
                  values={eventDetailModelArray}
                  richtext
                  className={classes.value}
                />,
              );
            }
          }
        });
      } catch (err) {
        // console.log(err);
      }
      return <div className={classes.root}>{fields}</div>;
    }
  }

  return <>{contentComponent()}</>;
};

export default EventDetailsDisplay;
