import { createStyles, makeStyles } from "@material-ui/core/styles";
import { useClient } from "@momentum-valley/muse-js";
import React, { useEffect, useState } from "react";
import { GroupOverview } from "../../../../generated/graphql";
import InstitutionContainer, { InstitutionType } from "../../institutionContainer";
import InstitutionTab from "./institution-tab";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      display: "flex",
      marginTop: 24,
      marginBottom: 24,
      width: "max-content",
    },
  }),
);

const InstitutionTabs: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  const { setInstitutionChildrenType, setTopHeight, setGroupTotalMap, TeamGroupOverviewQueryResult } =
    InstitutionContainer.useContainer();
  const [groupOverview, setGroupOverview] = useState<GroupOverview[]>([]);
  const [activeIndex, setActiveIndex] = useState(0);
  const muse = useClient();

  const results = [
    { code: "institutional_subject", name: "机构主体", count: 0 },
    { code: "fof", name: "母基金", count: 0 },
    { code: "fund", name: "基金", count: 0 },
    { code: "invested_fund", name: "对外投资基金", count: 0 },
    { code: "invested_company", name: "项目企业", count: 0 },
    { code: "invested_fund_investments", name: "对外投资基金项目", count: 0 },
    { code: "lp", name: "LP", count: 0 },
    { code: "co_ins_investor", name: "同行机构", count: 0 },
    { code: "vertical_preference", name: "投资方向", count: 0 },
  ];

  function resizeHandler(): void {
    const topEl = document.getElementById("institution_top");
    if (topEl) {
      setTopHeight(topEl.clientHeight);
    }
  }

  useEffect(() => {
    window.addEventListener("resize", resizeHandler);
    return (): void => {
      window.removeEventListener("resize", resizeHandler);
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  useEffect(() => {
    const res = TeamGroupOverviewQueryResult.data?.teamGroupOverview;
    const groupTotalMap: Map<string, number> = new Map();
    results.forEach(function (item, index) {
      const data = res?.find((elem) => {
        return elem?.code == item.code;
      });
      results[index].count = data?.count ?? 0;
      groupTotalMap[item.code] = data?.count ?? 0;
    });
    setGroupOverview(results as GroupOverview[]);
    setGroupTotalMap(groupTotalMap);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [TeamGroupOverviewQueryResult]);

  return (
    <div className={classes.root}>
      {groupOverview.map((value, index) => {
        return (
          <InstitutionTab
            key={index}
            name={value.name}
            count={value.count}
            active={index === activeIndex}
            onClick={(): void => {
              if (index === activeIndex) {
                return;
              }
              setActiveIndex(index);
              muse.sendTrackingEvent("institution.tab_change", {
                tab: value.code,
              });
              setInstitutionChildrenType(value.code as InstitutionType);
            }}
          />
        );
      })}
    </div>
  );
};

export default InstitutionTabs;
