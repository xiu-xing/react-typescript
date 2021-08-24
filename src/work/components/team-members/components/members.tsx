import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React from "react";
import Placeholder from "../../common/placeholders/placeholder";
import { ColumnConfig, columnConfig, columns } from "../config";
import TeamMembersContainer from "../container";
import MemberComponent from "./components/member-component";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      padding: 8,
    },
    header: {
      display: "flex",
      alignItems: "center",
      marginBottom: "4px",
    },
    headerCellText: {
      fontWeight: 500,
    },
    cell: {
      padding: "0 4px",
      overflow: "hidden",
      textOverflow: "ellipsis",
      whiteSpace: "nowrap",
    },
  }),
);

const Members: React.FunctionComponent = () => {
  const classes = useStyles();
  const { displayMembers } = TeamMembersContainer.useContainer();

  return (
    <Box className={classes.root}>
      <Box className={classes.header}>
        {columns.map((column) => {
          const config: ColumnConfig = columnConfig[column];
          return (
            <Box className={classes.cell} key={config.name} flex={config.flex || ""}>
              <Typography className={classes.headerCellText}>{config.name}</Typography>
            </Box>
          );
        })}
      </Box>
      {displayMembers.length > 0 ? (
        displayMembers.map((member) => <MemberComponent key={member.userID} member={member} />)
      ) : (
        <Placeholder />
      )}
    </Box>
  );
};

export default Members;
