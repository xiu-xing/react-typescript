import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { ReactElement, useEffect, useState } from "react";
import { Tab, useRealmTabsQuery } from "../../generated/graphql";
import { APPBAR_HEIGHT } from "../app/skeleton/components/appbar-next";
import ConditionDialog from "../common/condition-dialog";
import ConditionTagGroupArea from "../common/condition-tag-group-area";
import AdvancedSearchContainer from "./container";
import PresetTemplates from "./preset-templates";
import SimpleConditionEditor from "./simple-condition-input-editor";
import TabsContent from "./tabs-content";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      height: `calc(100vh - ${APPBAR_HEIGHT}px)`,
      display: "flex",
      flexDirection: "column",
    },
    displayContent: {
      height: "100%",
      overflowY: "hidden",
    },
    title: {
      padding: "20px 24px",
      fontSize: 20,
    },
    topBox: {
      backgroundColor: "#FFF",
      padding: "4px 24px ",
    },
    filterBox: {
      display: "flex",
    },
    inputLabel: {
      display: "flex",
      alignItems: "center",
      color: theme.palette.primary.main,
    },
    selectStyle: {
      minWidth: "100px",
    },
    dialogContent: {
      padding: 32,
      position: "relative",
      textAlign: "center",
    },
    fileInput: {
      width: 385,
      height: 170,
      opacity: 0,
      position: "absolute",
      top: 32,
      left: 32,
      cursor: "pointer",
    },
    labelBox: {
      width: 385,
      height: 170,
      textAlign: "center",
      border: `2px dashed ${theme.palette.primary.main}`,
      borderRadius: 8,
      display: "flex",
      flexDirection: "column",
      alignItems: "center",
      justifyContent: "center",
    },
    labelText: {
      fontWeight: 500,
      fontSize: 16,
    },
    primaryText: {
      fontWeight: 500,
      fontSize: 16,
      color: theme.palette.primary.main,
    },
    downloadButton: {
      marginTop: 24,
    },
    docx: {
      fontSize: 24,
      marginRight: 4,
    },
  }),
);

const RealmDisplay: React.FC = () => {
  const classes = useStyles();
  const [tabs, setTabs] = useState<Tab[]>();
  const {
    realm,
    title,
    conditions,
    searchConditionConfig,
    isAllRequiredConditionOffered,
    updateCondition,
    updateConditions,
    computedConditionsConfigMap,
    conditionEditorOpen,
    closeConditionEditor,
  } = AdvancedSearchContainer.useContainer();
  const [realmTabsResult] = useRealmTabsQuery({
    variables: {
      realmID: realm,
    },
  });

  useEffect(() => {
    const data = realmTabsResult.data?.realmTabs;

    if (data) setTabs(data as Tab[]);
  }, [realmTabsResult]);

  function displayContent(): ReactElement {
    if (!isAllRequiredConditionOffered) return <PresetTemplates />;
    return (
      <>
        <div className={classes.topBox}>
          <ConditionTagGroupArea
            conditions={conditions}
            computedConditionsConfigMap={computedConditionsConfigMap}
            onDelete={updateCondition}
          />
        </div>
        {tabs && tabs.length > 0 && <TabsContent tabs={tabs} />}
      </>
    );
  }

  return (
    <>
      <div className={classes.root}>
        {title && (
          <Box>
            <Typography noWrap className={classes.title}>
              {decodeURIComponent(title)}
            </Typography>
          </Box>
        )}
        <SimpleConditionEditor />
        {displayContent()}
        {searchConditionConfig && (
          <ConditionDialog
            showConditionDialog={conditionEditorOpen}
            closeDialog={closeConditionEditor}
            config={searchConditionConfig}
            conditions={conditions}
            updateConditions={updateConditions}
          />
        )}
      </div>
    </>
  );
};

export default RealmDisplay;
