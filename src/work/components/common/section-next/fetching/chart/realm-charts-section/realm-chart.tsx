import { CircularProgress } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { useEffect, useMemo, useState } from "react";
import ConfigContainer from "../../../../../../containers/configContainer";
import { Permission, useRealmChartQuery } from "../../../../../../generated/graphql";
import { ChartDataModel } from "../../../../../../models/chart/chartData";
import { getFrequencyLimit, getLockLimit } from "../../../../../../utils/permission";
import AdvancedSearchContainer from "../../../../../realm/container";
import ACPlaceholder from "../../../components/ac-placeholder";
import Chart from "../../../core/chart";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      position: "relative",
      width: "100%",
    },
    fetching: {
      minHeight: 400,
      display: "grid",
      placeItems: "center",
    },
  }),
);

interface RealmChartProps {
  realmChartID: string;
}

const RealmChart: React.FunctionComponent<RealmChartProps> = (props) => {
  const classes = useStyles();
  const { realmChartID } = props;

  const [realmChartData, setRealmChartData] = useState<ChartDataModel>();
  const { realmChartConfigs } = ConfigContainer.useContainer();
  const [fetching, setFetching] = useState(false);
  const { realm, conditions } = AdvancedSearchContainer.useContainer();
  const [permissions, setPermissions] = useState<Permission[]>([]);

  const [realmChartQueryData, executeRealmChartQuery] = useRealmChartQuery({
    variables: {
      realmID: realm,
      chartID: realmChartID,
      conditions: conditions,
    },
    pause: false,
    requestPolicy: "network-only",
  });

  useEffect(() => {
    executeRealmChartQuery();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [realmChartID, conditions]);

  useEffect(() => {
    setFetching(realmChartQueryData.fetching);

    const permissions = realmChartQueryData.data?.realmChart?.permissions;
    setPermissions(permissions ?? []);

    if (!realmChartQueryData.fetching) {
      try {
        if (realmChartQueryData.data?.realmChart?.data)
          setRealmChartData(ChartDataModel.fromJSON(JSON.parse(realmChartQueryData.data?.realmChart?.data as string)));
        // eslint-disable-next-line no-empty
      } catch {}
    }
  }, [realmChartQueryData]);

  const accessControlComponent = useMemo(() => {
    const isLock = getLockLimit(permissions) || getFrequencyLimit(permissions);

    if (isLock) {
      return <ACPlaceholder style={{ backgroundColor: "#fff", left: 0, right: 0 }} />;
    }
    return null;
  }, [permissions]);

  return (
    <div className={classes.root}>
      {fetching ? (
        <div className={classes.fetching}>
          <CircularProgress size={30} />
        </div>
      ) : (
        realmChartConfigs && (
          <Chart chartID={realmChartID} chartData={realmChartData} chartConfigs={realmChartConfigs} />
        )
      )}
      {accessControlComponent}
    </div>
  );
};

export default RealmChart;
