import { Box, Button, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { Home } from "mdi-material-ui";
import React, { useEffect, useState } from "react";
import UserContainer from "../../containers/userContainer";
import ImportProcessButton from "./components/import-process-button/import-process-button";
import InstitutionTable from "./components/institution-table/institution-table";
import InstitutionTabs from "./components/institution-tabs/institution-tabs";
import InstitutionContainer, { tableConfigs } from "./institutionContainer";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      display: "flex",
      flexDirection: "column",
      height: "100%"
    },
    topBox: {
      width: "100%",
    },
    titleBox: {
      marginTop: 24,
      marginLeft: 24,
      display: "flex",
      alignItems: "center",
    },
    title: {
      fontSize: 20,
      marginRight: 16,
    },
    iconBox: {
      display: "flex",
      alignItems: "center",
      fontSize: 14,
      cursor: "pointer",
    },
    homeIcon: {
      fontSize: 16,
    },
    homeText: {
      fontSize: 14,
      marginLeft: 4,
    },
    tabBox: {
      width: "100%",
      overflowX: "auto",
    },
    virtual: {
      flexGrow: 1,
    },
  }),
);

type Timer = NodeJS.Timer | null;
const InstitutionDisplay: React.FunctionComponent<{}> = () => {
  const classes = useStyles();

  const { institutionChildrenType, isProRole } = InstitutionContainer.useContainer();
  const { defaultTeam } = UserContainer.useContainer();
  const [entityID, setEntityID] = useState("");
  const [entityType, setEntityType] = useState("");

  useEffect(() => {
    if (defaultTeam) {
      setEntityID(defaultTeam.entityId as string);
      setEntityType(defaultTeam.entityType as string);
    }
  }, [defaultTeam]);

  return (
    <div className={classes.root}>
      <div className={classes.topBox}>
        <div className={classes.titleBox}>
          <Typography className={classes.title}>机构全貌</Typography>
          <Button
            className={classes.iconBox}
            onClick={(): void => {
              if (entityID && entityType) {
                window.open(`/profile?id=${entityID}&type=${entityType}`);
              }
            }}
          >
            <Home fontSize="small" color="primary" className={classes.homeIcon} />
            <Typography color="primary" className={classes.homeText}>
              公众主页
            </Typography>
          </Button>
          <Box className={classes.virtual}> </Box>
          {isProRole && <ImportProcessButton />}
        </div>
        <div className={classes.tabBox}>
          <InstitutionTabs />
        </div>
      </div>
      {tableConfigs.map((value, index) => {
        return (
            <InstitutionTable key={index} id={value.id} code={value.type} active={value.type === institutionChildrenType} />
        );
      })}
    </div>
  );
};

export default InstitutionDisplay;
