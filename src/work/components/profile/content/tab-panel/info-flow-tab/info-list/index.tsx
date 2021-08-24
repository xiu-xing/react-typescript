import { createStyles, makeStyles } from "@material-ui/core/styles";
import { format, formatDistanceStrict, fromUnixTime } from "date-fns";
import { zhCN } from "date-fns/locale";
import React from "react";
import { Action, InfoFlowItem, Tag } from "../../../../../../generated/graphql";
import { inDay } from "../../../../../../utils/date";
import InfoItem from "./info-item";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      maxWidth: 1300,
      position: "relative",
      margin: "auto",
      paddingTop: 8,
    },
    blur: {
      filter: "blur(4px)",
      userSelect: "none",
    },
    noData: {
      fontSize: 16,
      padding: 24,
      color: "#666",
      textAlign: "center",
    },
  }),
);

interface InfoListProps {
  items: InfoFlowItem[];
  fetching?: boolean;
}

const InfoList: React.FunctionComponent<InfoListProps> = (props) => {
  const classes = useStyles();
  const { items, fetching = true } = props;

  return (
    <div className={classes.root}>
      {items?.length > 0
        ? items.map((k, i) => (
            <InfoItem
              key={i}
              title={k.title as string}
              description={k.description as string}
              imgSrc={k.image as string}
              footnote={
                k.timestamp
                  ? inDay(k.timestamp)
                    ? formatDistanceStrict(fromUnixTime(k.timestamp), Date.now(), {
                        locale: zhCN,
                        addSuffix: true,
                      })
                    : format(fromUnixTime(k.timestamp), "yyyy-MM-dd")
                  : void 0
              }
              tags={k.tags as Tag[]}
              action={k.action as Action}
            />
          ))
        : !fetching && <div className={classes.noData}>暂无数据</div>}
    </div>
  );
};

export default InfoList;
