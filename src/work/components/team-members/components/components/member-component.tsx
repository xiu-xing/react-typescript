import { Avatar as MuiAvatar, Box, IconButton, ListItem, Menu, MenuItem, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { format, fromUnixTime } from "date-fns";
import { DotsVertical, ExitToApp } from "mdi-material-ui";
import React, { useState } from "react";
import { DefaultAvatarWebP } from "../../../../assets/webp/avatar";
import { UserInfo } from "../../../../generated/graphql";
import { getResourceUrl } from "../../../../utils/url";
import BasicEllipsisText from "../../../common/ellipsis-text/basic-ellipsis-text";
import TeamMembersContainer from "../../container";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      padding: "18px 0",
      borderBottom: "1px solid #EEE",
    },
    avatar: {
      width: 28,
      height: 28,
      background: "white",
      marginInlineEnd: "8px",
    },
    cell: {
      padding: "0 4px",
      overflow: "hidden",
      textOverflow: "ellipsis",
      whiteSpace: "nowrap",
    },
    member: {
      display: "flex",
      alignItems: "center",
    },
    memberText: {
      color: "#333",
      fontSize: "14px",
    },
    emailText: {
      color: "#666",
      fontSize: "12px",
    },
    inviterText: {
      color: "#666",
      fontSize: "14px",
    },
    deleteMemberIcon: {
      color: "#666",
    },
    nameBox: {
      margin: 0,
      padding: 0,
    },
    textEllipsis: {
      maxWidth: "100%",
      overflow: "hidden",
      textOverflow: "ellipsis",
      whiteSpace: "nowrap",
      wordBreak: "break-all",
    },
  }),
);

interface MemberComponentProps {
  member: UserInfo;
}

const MemberComponent: React.FunctionComponent<MemberComponentProps> = (props: MemberComponentProps) => {
  const classes = useStyles();
  const { member } = props;
  const [anchorEl, setAnchorEl] = useState<null | HTMLElement>(null);
  const { deleteMember } = TeamMembersContainer.useContainer();

  const handleClick = (event: React.MouseEvent<HTMLButtonElement>): void => {
    setAnchorEl(event.currentTarget);
  };

  const handleClose = (): void => {
    setAnchorEl(null);
  };

  return (
    <>
      <ListItem className={classes.root}>
        <Box className={classes.cell} flex={4}>
          <Box className={classes.member}>
            <MuiAvatar className={classes.avatar} variant="circle" src={getResourceUrl(member.avatar)}>
              <img src={DefaultAvatarWebP} />
            </MuiAvatar>
            <div className={classes.nameBox}>
              <BasicEllipsisText className={classes.memberText}>{member.userName}</BasicEllipsisText>
              {member.email != "" && (
                <BasicEllipsisText className={classes.emailText} showTooltip>
                  {member.email}
                </BasicEllipsisText>
              )}
            </div>
          </Box>
        </Box>
        <Box className={classes.cell} flex={2}>
          <Typography className={classes.inviterText}>
            {format(fromUnixTime(member.createdAt), "yyyy-MM-dd")}
          </Typography>
        </Box>
        <Box className={classes.cell} flex={2}>
          <Typography className={classes.inviterText}>{member.inviterUsername}</Typography>
        </Box>
        <IconButton size="small" onClick={handleClick}>
          <DotsVertical />
        </IconButton>
      </ListItem>
      <Menu
        getContentAnchorEl={null}
        anchorOrigin={{
          vertical: "bottom",
          horizontal: "center",
        }}
        anchorEl={anchorEl}
        open={Boolean(anchorEl)}
        onClose={handleClose}
        keepMounted
      >
        <MenuItem
          onClick={(): void => {
            deleteMember(member.userID);
            handleClose();
          }}
        >
          <ExitToApp className={classes.deleteMemberIcon} />
          <Typography className={classes.memberText}>移除成员</Typography>
        </MenuItem>
      </Menu>
    </>
  );
};

export default MemberComponent;
