import { createStyles, makeStyles, Theme } from "@material-ui/core";
import { get } from "lodash";
import Head from "next/head";
import React from "react";
import SimpleBar from "simplebar-react";
import { KeyValueMapQuery, useKeyValueMapQuery } from "../../../generated/graphql";
import Navigation from "../../common/navigation/navigation";
import HardTechVerticalContent from "./components/hard-tech-content/hard-tech-content";
import HardTechVerticalContainer from "./hardTechContainer";

export const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    outermostBox: {
      height: "calc(100vh - 126px)",
      marginTop: 78,
    },
    root: {
      width: 1316,
      margin: "auto",
    },
    navigationBox: {
      top: 48,
      bottom: 0,
      paddingRight: 4,
      paddingLeft: 24,
      width: 148,
      backgroundColor: "white",
      position: "fixed",
      zIndex: 1,
    },
    navigationList: {
      paddingTop: 28,
    },
    navigationTitle: {
      fontSize: "22px",
      color: "#333333",
      lineHeight: "26px",
      marginBottom: 16,
    },
    contentContainer: {
      minWidth: 700,
      paddingLeft: 148,
    },
    navigationItem: {
      fontSize: 14,
      color: "#333",
      padding: 6,
      lineHeight: "150%",
      userSelect: "none",
    },
    navigationItemBox: {
      display: "flex",
      cursor: "pointer",
      alignItems: "center",
      justifyContent: "flex-start",
    },
    navigationlable: {
      width: "3px",
      height: "14px",
      backgroundColor: "#FFF",
    },
    selectedItem: {
      color: theme.palette.primary.main,
    },
    selectedLable: {
      backgroundColor: theme.palette.primary.main,
    },
  }),
);

export interface KeyValueMapResult {
  UnionID?: string;
  Name?: string;
  NumberOfEnterprise?: string;
  NextLevel?: KeyValueMapResult[];
}

const HardTechVerticalDisplay: React.FunctionComponent = (props) => {
  const classes = useStyles();

  const { currentVertical, setCurrentVertical, firstLevelItems } = HardTechVerticalContainer.useContainer();

  return (
    <SimpleBar style={{ height: "calc(100vh - 48px)" }}>
      <div className={classes.outermostBox}>
        <div className={classes.root}>
          <div className={classes.navigationBox}>
            <SimpleBar style={{ height: "100%" }}>
              <div className={classes.navigationList}>
                <Navigation
                  title="硬科技"
                  items={firstLevelItems}
                  onChange={(value) => {
                    setCurrentVertical(firstLevelItems[value].data as KeyValueMapResult);
                  }}
                ></Navigation>
              </div>
            </SimpleBar>
          </div>
          <div className={classes.contentContainer}>
            {currentVertical && <HardTechVerticalContent vertical={currentVertical} />}
          </div>
        </div>
      </div>
    </SimpleBar>
  );
};

const HardTechVertical: React.FunctionComponent = () => {
  const [keyValueMapQueryResult] = useKeyValueMapQuery({
    variables: {
      funcID: "pevc.vertical_from_hard_tech_of_level_one",
    },
  });

  function contentComponent(data: KeyValueMapQuery) {
    const res = get(data, ["keyValueMap"]);

    return (
      <HardTechVerticalContainer.Provider initialState={res?.data && JSON.parse(res.data)}>
        <HardTechVerticalDisplay />
      </HardTechVerticalContainer.Provider>
    );
  }

  if (keyValueMapQueryResult.fetching || keyValueMapQueryResult.error || !keyValueMapQueryResult.data) {
    return null;
  }

  return (
    <>
      <Head>
        <title>硬科技赛道 | RimeData</title>
      </Head>
      {contentComponent(keyValueMapQueryResult.data)}
    </>
  );
};

export default HardTechVertical;
