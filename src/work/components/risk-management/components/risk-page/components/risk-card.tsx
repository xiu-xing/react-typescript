import { CircularProgress, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { useClient } from "@momentum-valley/muse-js";
import { format } from "date-fns";
import { ChevronRight } from "mdi-material-ui";
import React, { useEffect, useState } from "react";
import { PlaceholderWEBP } from "../../../../../assets/svg/placeholder";
import { EntityType, RiskNode, useRiskQuery } from "../../../../../generated/graphql";
import CommonAccordion, { CommonAccordionProps } from "../../../../common/accordion/accordion";
import CommonAccordionDetails from "../../../../common/accordion/components/details";
import CommonAccordionPlaceholder from "../../../../common/accordion/components/placeholder";
import RiskItem from "../../risk-list/components/risk-item";
const useStyles = makeStyles(() =>
  createStyles({
    contentBox: {
      borderTop: "1px solid #EEE",
    },
    listBox: {
      // padding: 16,
      // display: "grid",
      // gridRowGap: 16,
    },
    logo: {
      width: "auto",
      height: "auto",
      maxWidth: 30,
      maxHeight: 30,
      objectFit: "contain",
    },
    loadMoreText: {
      fontSize: 14,
    },
    buttonIcon: {
      marginTop: 2,
    },
    loadingBox: {
      minHeight: 96,
      borderTop: "1px solid #EEE",

      display: "flex",
      justifyContent: "center",
      alignItems: "center",
    },
  }),
);
interface Entity {
  logo: string;
  name: string;
  id: string;
  type: EntityType;
}

const PAGE_SIZE = 5;

interface RiskCardProps extends Omit<CommonAccordionProps, "children"> {
  data: Entity;
  filter: {
    startTime: string;
    endTime: string;
  };
}

const RiskCard: React.FunctionComponent<RiskCardProps> = (props) => {
  const classes = useStyles();

  const { data, filter, onChange, ...restProps } = props;
  const muse = useClient();
  const [expanded, setExpanded] = useState(props.defaultExpanded);
  const [fetching, setFetching] = useState(true);
  const [risks, setRisks] = useState<RiskNode[]>([]);
  const [riskQueryResult, executeRiskQuery] = useRiskQuery({
    variables: {
      first: PAGE_SIZE,
      filter: {
        entityRequest: {
          entityId: data.id,
          entityType: data.type,
        },
        startTime: format(Number(filter.startTime), "yyyy-MM-dd HH:mm:ss"),
        endTime: format(Number(filter.endTime), "yyyy-MM-dd HH:mm:ss"),
      },
    },
    pause: true,
  });

  useEffect(() => {
    if (risks.length || !fetching) {
      return;
    }
    if (data && expanded) {
      executeRiskQuery();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [expanded]);

  useEffect(() => {
    if (riskQueryResult.error) {
      setFetching(false);
      return;
    }
    if (riskQueryResult.data) {
      const nodes = riskQueryResult.data?.risk.nodes;
      const riskList: RiskNode[] = [];
      nodes?.forEach((value) => {
        value && riskList.push(value);
      });
      setRisks(riskList);
      setFetching(false);
    }
  }, [riskQueryResult]);

  function loadingComponent(): JSX.Element {
    return (
      <div className={classes.loadingBox}>
        <CircularProgress size={30} />
      </div>
    );
  }

  function contentComponent(): JSX.Element {
    return (
      <CommonAccordionDetails
        className={classes.contentBox}
        footerButton={
          <>
            <Typography className={classes.loadMoreText} color="primary">
              查看更多
            </Typography>
            <ChevronRight className={classes.buttonIcon} fontSize="small" color="primary" />
          </>
        }
        footerButtonClick={(): void => {
          muse.sendTrackingEvent("risk_management.read_more", {
            entity: {
              id: data.id,
              type: data.type,
            },
          });
          window.open(
            `/risk-management/search?id=${data.id}&type=${data.type}&name=${encodeURIComponent(
              data.name,
            )}&logo=${encodeURIComponent(data.logo)}`,
          );
        }}
      >
        <div className={classes.listBox}>
          {fetching || risks.length ? (
            risks.map((risk, index) => {
              return (
                <RiskItem
                  key={index}
                  data={risk}
                  entityID={data.id}
                  entityType={data.type}
                  primaryName={data.name}
                  showAction
                />
              );
            })
          ) : (
            <CommonAccordionPlaceholder />
          )}
        </div>
      </CommonAccordionDetails>
    );
  }

  return (
    <CommonAccordion
      image={<img className={classes.logo} src={data.logo ? data.logo : PlaceholderWEBP} />}
      heading={data.name}
      {...restProps}
      onChange={(event, _expanded: boolean): void => {
        setExpanded(_expanded);
        onChange?.(event, _expanded);
      }}
    >
      {fetching ? loadingComponent() : contentComponent()}
    </CommonAccordion>
  );
};

export default RiskCard;
