import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { format, fromUnixTime } from "date-fns";
import _ from "lodash";
import { AlertCircle } from "mdi-material-ui";
import React, { ReactNode, useEffect, useState } from "react";
import { useClient } from "urql";
import { useClient as useMuseClient } from "@momentum-valley/muse-js";
import { PlaceholderWEBP } from "../../../../assets/svg/placeholder";
import UserContainer from "../../../../containers/userContainer";
import {
  RiskDocument,
  RiskNode,
  RiskQuery,
  RiskQueryVariables,
  RiskType,
  TeamChannelDataDocument,
  TeamChannelDataQuery,
  TeamChannelDataQueryVariables,
} from "../../../../generated/graphql";
import CommonAccordionDetails from "../../../common/accordion/components/details";
import CommonAccordionLoading from "../../../common/accordion/components/loading";
import CommonAccordionPlaceholder from "../../../common/accordion/components/placeholder";
import CommonCell from "../../../common/cell/cell";
import CommonCellTag from "../../../common/cell/components/tag";
import EventDetailsDialog from "../../../risk-management/components/event-detail/event-detail-dialog";
import Card from "../card";
import CellGroup from "../cell-group/cell-group";
import MoreButton from "../cell-group/components/more-button";
import LoadMore from "../load-more";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    entitiyChange: {
      display: "flex",
      flexDirection: "row",
      alignItems: "center",
    },
    entities: {
      color: theme.palette.primary.main,
      fontSize: 14,
      fontWeight: 500,
    },
    image: {
      width: "100%",
      height: "100%",
      objectFit: "contain",
      pointerEvents: "none",
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
  }),
);

interface RisksOrganizationGroup {
  id: string;
  logo: string;
  name: string;
  type: string;
  risks: RiskNode[];
}

const RisksOrganization: React.FunctionComponent = () => {
  const classes = useStyles();
  const client = useClient();
  const [fetching, setFetching] = useState(true);
  const [noData, setNoData] = useState(false);
  const [groups, seGroups] = useState<RisksOrganizationGroup[]>([]);
  const [risk, setRisk] = useState<RiskNode | null>(null);
  const muse = useMuseClient();

  useEffect(() => {
    async function fetchData(): Promise<void> {
      try {
        const teamChannelDataQueryResult = await client
          .query<TeamChannelDataQuery, TeamChannelDataQueryVariables>(TeamChannelDataDocument, {
            dataID: "data_id_risk",
            teamGroupCodes: ["corporate_entity", "fund", "invested_company"],
            first: 5,
          })
          .toPromise();

        const groupPromises = (teamChannelDataQueryResult.data?.teamChannelData?.nodes ?? []).map(async (node) => {
          const risksQueryResult = await client
            .query<RiskQuery, RiskQueryVariables>(RiskDocument, {
              first: 1,
              filter: {
                entityRequest: {
                  entityId: node.entityID,
                  entityType: node.entityType,
                },
              },
            })
            .toPromise();

          return {
            id: node.entityID,
            logo: node.portraitURL,
            name: node.entityName,
            type: node.entityType,
            risks: (risksQueryResult.data?.risk?.nodes ?? []) as RiskNode[],
          };
        });

        const newGroups = await Promise.all(groupPromises);
        seGroups(newGroups as RisksOrganizationGroup[]);
        setFetching(false);

        if (newGroups.length === 0) {
          setNoData(true);
        }
      } catch (error) {
        setFetching(false);
        setNoData(true);
      }
    }
    fetchData();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  function detailsContentComponent(): ReactNode {
    if (fetching) {
      return <CommonAccordionLoading />;
    }

    if (noData) {
      return <CommonAccordionPlaceholder />;
    }

    return groups.map((group, groupIndex) => (
      <CellGroup
        key={groupIndex}
        heading={group.name}
        image={<img className={classes.image} src={group.logo ? group.logo : PlaceholderWEBP} />}
        actionArea={
          <MoreButton
            onClick={(): void => {
              muse.sendTrackingEvent("dashboard.my_institution_risks_read_more", {
                entity: {
                  id: group.id,
                  type: group.type,
                },
              });
              window.open(
                `/risk-management/search?id=${group.id}&type=${group.type}&name=${group.name}&logo=${group.logo}`,
              );
            }}
          />
        }
      >
        {group.risks.map((risk, riskIndex) => (
          <CommonCell
            key={riskIndex}
            heading={risk.title ?? ""}
            subheading={format(fromUnixTime(parseInt(risk.publishDate)), "yyyy-MM-dd")}
            tags={[
              <CommonCellTag key="1">{risk.tagName}</CommonCellTag>,
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
            onClick={(): void => {
              muse.sendTrackingEvent("dashboard.my_institution_risks_item_tap", {
                entity: {
                  id: group.id,
                  type: group.type,
                },
              });
              switch (risk.riskType) {
                case RiskType.Event:
                  setRisk(risk);
                  break;
                case RiskType.Sentiment:
                  window.open(risk?.content?.match(/^https?:/) ? risk.content : "//" + risk.content);
                  break;
                default:
                  break;
              }
            }}
          />
        ))}
      </CellGroup>
    ));
  }

  return (
    <Card>
      <CommonAccordionDetails
        footerButton={noData || fetching ? null : <LoadMore />}
        footerButtonClick={(): void => {
          muse.sendTrackingEvent("dashboard.my_institution_risks_read_more", {});
          window.open("/risk-management/institution");
        }}
        disableTopDivider
      >
        {detailsContentComponent()}
        <EventDetailsDialog
          open={risk != null}
          content={risk?.content ?? ""}
          tagCode={risk?.tagID ?? ""}
          setOpen={(open): void => {
            if (!open) {
              setRisk(null);
            }
          }}
        />
      </CommonAccordionDetails>
    </Card>
  );
};

export default RisksOrganization;
