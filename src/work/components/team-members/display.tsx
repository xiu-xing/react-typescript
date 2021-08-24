import { Box, Button, InputAdornment, TextField, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { Magnify, Plus } from "mdi-material-ui";
import Head from "next/head";
import React from "react";
import { useClient } from "urql";
import AppContainer from "../../containers/appContainer";
import { InvitationDocument, InvitationQuery, InvitationQueryVariables } from "../../generated/graphql";
import { parseError } from "../../utils/error";
import BackTopFab from "../common/back-top-fab/back-top-fab";
import Invitation from "../common/invitation";
import SnackbarContainer from "../common/snackbar/snackbarContainer";
import Members from "./components/members";
import TeamMembersContainer from "./container";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      display: "flex",
      justifyContent: "center",
    },
    content: {
      padding: 24,
      maxWidth: 832,
      flexGrow: 1,
    },
    title: {
      color: "#333",
      fontSize: "20px",
      marginBottom: "24px",
    },
    actionArea: {
      display: "flex",
      alignItems: "center",
      justifyContent: "space-between",
      marginBottom: "16px",
    },
    searchInput: {
      padding: 0,
      width: 337,
    },
    boldFont: {
      fontWeight: 500,
    },
  }),
);

const TeamMembersDisplay: React.FunctionComponent = () => {
  const classes = useStyles();
  const { setFilter, team } = TeamMembersContainer.useContainer();
  const { openSnackbar } = SnackbarContainer.useContainer();
  const { showDialog, closeDialog } = AppContainer.useContainer();

  const client = useClient();

  async function onInvitationButtonClick(): Promise<void> {
    if (team && team.id) {
      const result = await client
        .query<InvitationQuery, InvitationQueryVariables>(InvitationDocument, {
          teamID: team.id,
          expiredHour: 0,
        })
        .toPromise();

      if (result.error) {
        const error = parseError(result.error);
        openSnackbar(error.message ?? "邀请码生成失败，请稍后再试！", "error");
        return;
      }

      const invitationCode = result.data?.invitation.invitationCode;
      if (invitationCode) {
        showDialog({
          fullWidth: true,
          maxWidth: "xs",
          children: <Invitation code={invitationCode} />,
        });
      }
    }
  }

  return (
    <>
      <Head>
        <title>成员管理 | RimeData</title>
      </Head>
      <Box className={classes.root}>
        <Box className={classes.content}>
          <Typography className={classes.title}>成员管理</Typography>
          <Box className={classes.actionArea}>
            <TextField
              size="small"
              variant="outlined"
              placeholder="搜索成员"
              className={classes.searchInput}
              InputProps={{
                startAdornment: (
                  <InputAdornment position="start">
                    <Magnify style={{ color: "rgba(0,0,0,.12)" }} />
                  </InputAdornment>
                ),
              }}
              onChange={(e): void => {
                setFilter(e.target.value);
              }}
            />
            <Button variant="contained" color="primary" startIcon={<Plus />} onClick={onInvitationButtonClick}>
              <Typography noWrap className={classes.boldFont}>
                邀请成员
              </Typography>
            </Button>
          </Box>
          <Members />
        </Box>
        <BackTopFab />
      </Box>
      {/* <InvitationDialog
        open={open}
        onClose={onClose}
        link={invitationCode ? `${window.location.origin}/invitation/${invitationCode}` : ""}
      /> */}
    </>
  );
};

export default TeamMembersDisplay;
