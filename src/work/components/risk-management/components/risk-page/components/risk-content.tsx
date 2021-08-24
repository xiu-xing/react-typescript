import DateFnsUtils from "@date-io/date-fns";
import { Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import _ from "lodash";
import { ChevronDown } from "mdi-material-ui";
import React, { useEffect, useState } from "react";
import UserContainer from "../../../../../containers/userContainer";
import { Role } from "../../../../../generated/graphql";
import RiskSection, { RiskSectionProps } from "./risk-section";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      paddingLeft: 6,
      marginTop: 6,
    },
    loadMore: {
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
      padding: "14px 0",
      // boxShadow: "0px 2px 1px -1px rgba(0,0,0,0.2), 0px 1px 1px 0px rgba(0,0,0,0.14), 0px 1px 3px 0px rgba(0,0,0,0.12)",
      backgroundColor: "#fff",
      cursor: "pointer",
      marginBottom: 52,
    },
    loadMoreText: {
      fontSize: 14,
    },
  }),
);

const PAGE_SIZE = 3;

const RiskContent: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  const dateUtils = new DateFnsUtils();
  const now = new Date();
  const {
    user,
    isRimeActive,
    setTrailServiceDialogOpen,
    setInstitutionAuthenticationDialog,
    setActiveServiceDialogOpen,
  } = UserContainer.useContainer();
  const [endDate, setEndDate] = useState<Date>(
    ((): Date => {
      const date = new Date();
      const month = date.getMonth();
      date.setMonth(month - 1);
      return date;
    })(),
  );
  const riskSections: Array<RiskSectionProps> = [
    {
      startTime: ((): string => {
        const date = new Date();
        date.setHours(0);
        date.setMinutes(0);
        date.setSeconds(0);
        return `${date.getTime()}`;
      })(),
      endTime: `${now.getTime()}`,
      title: "今日",
    },
    {
      startTime: ((): string => {
        const date = new Date();
        date.setHours(0);
        date.setMinutes(0);
        date.setSeconds(0);
        const day = date.getDate();
        date.setDate(day - 30);
        return `${date.getTime()}`;
      })(),
      endTime: ((): string => {
        const date = new Date();
        date.setHours(23);
        date.setMinutes(59);
        date.setSeconds(59);
        return `${date.getTime()}`;
      })(),
      title: "近 30 日",
    },
  ];
  const [dateList, setDateList] = useState<RiskSectionProps[]>(riskSections);

  useEffect(() => {
    if (isRimeActive && riskSections.length == 2) {
      riskSections.push({
        startTime: `${dateUtils.startOfMonth(endDate).getTime()}`,
        endTime: `${dateUtils.endOfMonth(endDate).getTime()}`,
        title: `${endDate.getMonth() + 1} 月`,
      });
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [riskSections]);

  function generateNextPage(): RiskSectionProps[] {
    const date = new Date(endDate);
    return _.range(0, PAGE_SIZE).map(() => {
      date.setMonth(date.getMonth() - 1);
      return {
        startTime: `${dateUtils.startOfMonth(date).getTime()}`,
        endTime: `${dateUtils.endOfMonth(date).getTime()}`,
        title:
          now.getFullYear() != date.getFullYear()
            ? `${date.getFullYear()} 年 ${date.getMonth() + 1} 月`
            : `${date.getMonth() + 1} 月`,
      };
    });
  }

  function onLoadMoreClick(): void {
    //
    setDateList((oldValue) => {
      const newValue = Array.from(oldValue);
      return newValue.concat(generateNextPage());
    });
    setEndDate((oldValue) => {
      const date = new Date(oldValue);
      date.setMonth(date.getMonth() - PAGE_SIZE);
      return date;
    });
  }

  return (
    <div className={classes.root}>
      {dateList.map((dateProps, index) => {
        return <RiskSection key={index} {...dateProps} defaultExpanded={index === 0} />;
      })}
      <div
        className={classes.loadMore}
        onClick={(): void => {
          if (isRimeActive) {
            onLoadMoreClick();
          }
          if (user?.role == Role.IndividualFree || user?.role == Role.IndividualPremium) {
            setInstitutionAuthenticationDialog(true);
          }
          if (user?.role == Role.Basic ) {
            setTrailServiceDialogOpen(true);
          }
          if (user?.role == Role.Expired) {
            setActiveServiceDialogOpen(true);
          }
        }}
      >
        <Typography className={classes.loadMoreText} color="primary">
          查看更多月份
        </Typography>
        <ChevronDown fontSize="small" color="primary" />
      </div>
    </div>
  );
};

export default RiskContent;
