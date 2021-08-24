import { createStyles, makeStyles, StyledComponentProps, Theme } from "@material-ui/core/styles";
import { useClient } from "@momentum-valley/muse-js";
import clsx from "clsx";
import { format, fromUnixTime } from "date-fns";
import _ from "lodash";
import { AlertCircle, ChevronRight } from "mdi-material-ui";
import React from "react";
import { RiskNode, RiskType } from "../../../../../generated/graphql";
import CommonCell from "../../../../common/cell/cell";
import CommonCellTag from "../../../../common/cell/components/tag";
import RiskManagementContainer from "../../../riskManagementContainer";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      cursor: "default",
    },
    hoverRipple: {
      cursor: "pointer",
      "&:hover": {
        background: "rgba(0, 0, 0, 0.04)",
      },
    },
    dataCell: {
      display: "grid",
      gridAutoFlow: "column",
      gridColumnGap: 2,
      justifyContent: "center",
      alignItems: "center",
    },
    alertIcon: {
      fontSize: 16,
    },
    tag: {
      fontFamily: "Noto Sans SC",
      marginRight: 12,
      fontSize: 12,
      color: theme.palette.primary.main,
    },
    actionBox: {
      fontFamily: "Noto Sans SC",
      cursor: "pointer",
      color: theme.palette.primary.main,
      fontSize: 14,
      fontWeight: 500,

      display: "flex",
      alignItems: "center",
      marginLeft: 38,
    },
    actionIcon: {
      marginLeft: 4,
    },
    subheading: {
      textAlign: "justify",
    },
  }),
);

interface RiskItemProps extends StyledComponentProps<"root"> {
  data: RiskNode;
  showAction?: boolean;
  disableRipple?: boolean;
  entityID?: string;
  entityType?: string;
  primaryName?: string;
}

const RiskItem: React.FunctionComponent<RiskItemProps> = (props) => {
  const classes = useStyles();
  const { data: risk, entityID, entityType, primaryName, showAction, disableRipple } = props;
  const { setRiskDetail } = RiskManagementContainer.useContainer();
  const muse = useClient();
  const publishDate = !isNaN(Number(risk.publishDate))
    ? format(fromUnixTime(parseInt(risk.publishDate)), "yyyy-MM-dd")
    : risk.publishDate.split(" ")[0];

  function showDetail(): void {
    muse.sendTrackingEvent("risk_management.risk_item_tap", {
      entity: {
        id: entityID as string,
        type: entityType as string,
      },
    });

    if (risk.riskType == RiskType.Event) {
      setRiskDetail(risk);
      return;
    }
    if (risk.riskType == RiskType.Sentiment) {
      if (risk.content) {
        let url = risk.content;
        if (url.indexOf("http") === -1) {
          url = "http://" + url;
        }
        window.open(url);
      }
    }
  }

  return (
    <CommonCell
      classes={{
        root: clsx(classes.root, disableRipple ? undefined : classes.hoverRipple, props.classes?.root),
        subheading: classes.subheading,
      }}
      heading={risk.title || ""}
      headingLineLimit={1}
      subheading={risk.abstract ? `${publishDate} | ${risk.abstract}` : publishDate}
      tags={[
        risk.source ? (
          <CommonCellTag key={0} className={classes.tag}>
            {risk.source}
          </CommonCellTag>
        ) : null,
        <CommonCellTag key={1} className={classes.tag}>
          {risk.tagName}
        </CommonCellTag>,
        risk.negativeSentimentLevel ? (
          <CommonCellTag key={2} backgroundColor="rgba(255,0,0,0.12)">
            <div className={classes.dataCell}>
              {_.range(1, Number(risk.negativeSentimentLevel) + 1).map((i) => (
                <AlertCircle className={classes.alertIcon} fontSize="small" color="error" key={i} />
              ))}
            </div>
          </CommonCellTag>
        ) : null,
      ]}
      actions={
        showAction ? (
          <div className={classes.actionBox} onClick={disableRipple ? showDetail : undefined}>
            查看详情
            <ChevronRight className={classes.actionIcon} fontSize="small" color="primary" />
          </div>
        ) : null
      }
      disableRipple={disableRipple}
      onClick={!disableRipple ? showDetail : undefined}
    />
  );
};

export default RiskItem;
