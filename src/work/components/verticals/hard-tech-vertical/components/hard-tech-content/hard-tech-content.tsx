import { CircularProgress } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { get } from "lodash";
import React, { useEffect, useState } from "react";
import { useKeyValueMapQuery } from "../../../../../generated/graphql";
import CommonAccordionPlaceholder from "../../../../common/accordion/components/placeholder";
import { KeyValueMapResult } from "../../hard-tech-vertical";
import Toolbar from "../toolbar/toolbar";
import VerticalSection from "./vertical-section";

const useStyles = makeStyles(() =>
  createStyles({
    title: {
      fontSize: 20,
      marginRight: 16,
      marginLeft: 8,
      color: "#333",
    },
    toolbar: {
      paddingTop: 8,
    },
    boxRoot: {
      flexGrow: 1,
      paddingLeft: 12,
      marginBottom: 24,
    },
    boxEmpty: {
      verticalAlign: "middle",
      width: "100%",
      height: "100%",
    },
    loading: {
      width: "100%",
      paddingLeft: "30%",
      paddingTop: "10%",
    },
  }),
);

interface HardTechVerticalContentProps {
  vertical: KeyValueMapResult;
}

const HardTechVerticalContent: React.FunctionComponent<HardTechVerticalContentProps> = ({ vertical }) => {
  const [secondVerticals, setSecondVerticals] = useState<KeyValueMapResult[]>();
  const classes = useStyles();

  const [getSecondVertical] = useKeyValueMapQuery({
    variables: {
      funcID: "pevc.vertical_from_hard_tech_list",
      requestBody: vertical.UnionID,
    },
  });

  useEffect(() => {
    const res = get(getSecondVertical, ["data", "keyValueMap", "data"]);

    if (res) setSecondVerticals(JSON.parse(res));
  }, [getSecondVertical]);

  if (getSecondVertical.fetching) {
    return (
      <div className={classes.loading}>
        <CircularProgress size={30} />
      </div>
    );
  }

  function contentComponent() {
    if (secondVerticals?.length ?? 0 > 0) {
      return secondVerticals?.map((SecondVerticalItem) => {
        return (
          <div className={classes.boxRoot} key={SecondVerticalItem.UnionID}>
            <VerticalSection secondLevelVertical={SecondVerticalItem} />
          </div>
        );
      });
    }

    return (
      <div className={classes.boxEmpty}>
        <CommonAccordionPlaceholder />
      </div>
    );
  }

  return (
    <>
      <Toolbar title={vertical.Name!} numberOfAccount={vertical.NumberOfEnterprise ?? "0"} />
      {contentComponent()}
    </>
  );
};

export default HardTechVerticalContent;
