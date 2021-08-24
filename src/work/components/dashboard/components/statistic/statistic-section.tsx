import { Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import ArrowForwardIosIcon from "@material-ui/icons/ArrowForwardIos";
import { useClient } from "@momentum-valley/muse-js";
import clsx from "clsx";
import React, { ReactNode, useEffect, useState } from "react";
import UserContainer from "../../../../containers/userContainer";
import { BusinessCardInformation, JoinStatus, Role, useBussinessCardDetailQuery } from "../../../../generated/graphql";
import {
  InstitutionBackgroundWebP,
  InstitutionFailedBackgroundWebP,
  InstitutionSuccessBackgroundWebP,
} from "../../assets/webp";
import DashboardSection from "../section";
import ChannelDataCell from "./channel-data-cell";
const useStyles = makeStyles(() =>
  createStyles({
    root: {
      display: "grid",
      gridAutoFlow: "column",
      gridTemplateColumns: "1fr 1fr",
      gridColumnGap: 24,
    },
    cellBox: {
      display: "grid",
      gridTemplateColumns: "2fr 1fr",
      gridColumnGap: 16,
    },
    institutionCard: {
      backgroundSize: "cover",
      height: "156px",
      width: "421px",
      cursor: "pointer",
      color: "#ffffff",
    },
    institutionDefaultBackground: {
      backgroundImage: `url(${InstitutionBackgroundWebP})`,
    },
    institutionSuccessBackground: {
      backgroundImage: `url(${InstitutionSuccessBackgroundWebP})`,
    },
    institutionFailedBackground: {
      backgroundImage: `url(${InstitutionFailedBackgroundWebP})`,
    },
    icon: {
      marginTop: "8px",
      height: "12px",
      width: "12px",
    },
    describe: {
      paddingTop: "27px",
      paddingLeft: "24px",
    },
    authentication: {
      marginTop: "12px",
      width: "90px",
      height: "30px",
      borderRadius: "13px",
      display: "flex",
      justifyContent: "center",
    },
    authenticationDefaultBackground: {
      background: "#5EB0C0",
    },
    authenticationSuccessBackground: {
      background: "#7A8ED9",
    },
    authenticationFailedBackground: {
      background: "#909090",
    },
    authenticationText: {
      marginTop: "4px",
    },
    description: {
      fontSize: "18px",
      fontWeight: 500,
      color: "#FFFFFF",
      lineHeight: "28px",
    },
  }),
);

const StatisticSection: React.FunctionComponent<{}> = () => {
  const { user, setInstitutionAuthenticationDialog } = UserContainer.useContainer();
  const classes = useStyles();
  const muse = useClient();

  const [bussinessCardDetail, setBussinessCardDetail] = useState<BusinessCardInformation>();
  const [bussinessCardDetailQueryResult, executeBussinessCardDetailQuery] = useBussinessCardDetailQuery({
    pause: true,
    requestPolicy: "cache-and-network",
  });

  useEffect(() => {
    // 未加入 team 的用户，查询上传名片的任务状态
    if (user?.role == Role.IndividualFree || user?.role == Role.IndividualPremium) {
      executeBussinessCardDetailQuery();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [user]);

  useEffect(() => {
    if (bussinessCardDetailQueryResult.data) {
      const bussinessCardDetailTemp = bussinessCardDetailQueryResult.data.bussinessCardDetail;
      bussinessCardDetailTemp && setBussinessCardDetail(bussinessCardDetailTemp);
    }
  }, [bussinessCardDetailQueryResult]);

  function verificationComponent(): ReactNode {
    if (bussinessCardDetail?.joinStatus === JoinStatus.JoinEnd && !bussinessCardDetail.success) {
      return (
        <div
          className={clsx(classes.institutionCard, classes.institutionFailedBackground)}
          onClick={(): void => {
            setInstitutionAuthenticationDialog(true);
          }}
        >
          <div className={classes.describe}>
            <Typography className={classes.description}>审核未通过，请重新认证</Typography>
            <Typography variant="subtitle1">失败原因：照片有误</Typography>
            <div className={clsx(classes.authentication, classes.authenticationFailedBackground)}>
              <Typography variant="caption" className={classes.authenticationText}>
                重新认证
              </Typography>
              <ArrowForwardIosIcon className={classes.icon} />
            </div>
          </div>
        </div>
      );
    }
    if (bussinessCardDetail?.joinStatus === JoinStatus.JoinEnd && bussinessCardDetail.success) {
      return (
        <div
          className={clsx(classes.institutionCard, classes.institutionSuccessBackground)}
          onClick={(): void => {
            setInstitutionAuthenticationDialog(true);
          }}
        >
          <div className={classes.describe}>
            <Typography className={classes.description}>请验证手机完成认证</Typography>
            <Typography variant="subtitle1">解锁更多功能</Typography>
            <div className={clsx(classes.authentication, classes.authenticationSuccessBackground)}>
              <Typography variant="caption" className={classes.authenticationText}>
                立即认证
              </Typography>
              <ArrowForwardIosIcon className={classes.icon} />
            </div>
          </div>
        </div>
      );
    }
    return (
      <div
        className={clsx(classes.institutionCard, classes.institutionDefaultBackground)}
        onClick={(): void => {
          setInstitutionAuthenticationDialog(true);
        }}
      >
        <div className={classes.describe}>
          <Typography className={classes.description}>认证机构，查看全量数据</Typography>
          <Typography variant="subtitle1">解锁更多功能</Typography>
          <div className={clsx(classes.authentication, classes.authenticationDefaultBackground)}>
            <Typography variant="caption" className={classes.authenticationText}>
              立即认证
            </Typography>
            <ArrowForwardIosIcon className={classes.icon} />
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className={classes.root}>
      <DashboardSection heading="我的关注">
        <div className={classes.cellBox}>
          <ChannelDataCell
            type="risk"
            channelId="channel_id_dashboard_risk_user_followed"
            onClick={(): void => {
              muse.sendTrackingEvent("dashboard.my_subscribe_risks_tap", {});
              window.open("/risk-management/favors");
            }}
          />
          <ChannelDataCell
            type="news"
            channelId="channel_id_dashboard_news_user_followed"
            onClick={(): void => {
              muse.sendTrackingEvent("dashboard.my_subscribe_news_tap", {});
              window.open("/news/my-follow");
            }}
          />
        </div>
      </DashboardSection>
      <DashboardSection heading="我的机构">
        {user && (user?.role == Role.IndividualFree || user?.role == Role.IndividualPremium)? (
          verificationComponent()
        ) : (
          <div className={classes.cellBox}>
            <ChannelDataCell
              type="risk"
              channelId="channel_id_dashboard_risk_team"
              onClick={(): void => {
                muse.sendTrackingEvent("dashboard.my_institution_risks_tap", {});
                window.open("/risk-management/institution");
              }}
            />
            <ChannelDataCell
              type="news"
              channelId="channel_id_dashboard_news_team"
              onClick={(): void => {
                muse.sendTrackingEvent("dashboard.my_institution_news_tap", {});
                window.open("/news/my-institution");
              }}
            />
          </div>
        )}
      </DashboardSection>
    </div>
  );
};

export default StatisticSection;
