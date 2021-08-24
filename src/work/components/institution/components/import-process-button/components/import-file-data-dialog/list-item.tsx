import { Box, ListItem, Theme, Tooltip, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { ReactNode, useState } from "react";
import { PlaceholderWEBP } from "../../../../../../assets/svg/placeholder";
import { MatchItem } from "../../../../../../generated/graphql";
import { CancelWEBP, ErrorTip, ExclamationPointWEBP, MatchFailWEBP, MatchWEBP } from "../../../../assets/index";
import ImportResultListContainer from "../import-result-list/importResultListContainer";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    cell: {
      width: "100%",
      padding: "12px 24px",
    },
    listItemRoot: {
      paddingLeft: 0,
      paddingRight: 0,
      paddingBottom: 0,
      "&:hover": {
        backgroundColor: "rgba(25, 25, 25, 0.04)",
      },
    },
    showBackground: {
      paddingLeft: 0,
      paddingRight: 0,
      paddingBottom: 0,
      "&:hover": {
        backgroundColor: "rgba(198, 40, 40, 0.04)",
      },
    },
    row1: {
      display: "flex",
      justifyContent: "flex-start",
      alignItems: "center",
      fontSize: 16,
    },
    matchFail: {
      color: theme.palette.primary.main,
      cursor: "pointer",
      display: "flex",
      justifyContent: "flex-start",
      alignItems: "center",
    },
    clickMatchFail: {
      display: "flex",
      justifyContent: "flex-start",
      alignItems: "center",
      color: theme.palette.primary.main,
      cursor: "pointer",
    },
    matchImg: {
      marginRight: 10,
    },
    matchName: {
      marginRight: 6,
    },
    portraitURL: {
      marginRight: 8,
      height: 16,
      maxWidth: 100,
      objectFit: "cover",
    },
    info: {
      color: "#666666",
      fontSize: 14,
      lineHeight: "24px",
    },
    description: {
      color: "#999999",
      width: "100%",
      overflow: "hidden",
      textOverflow: "ellipsis",
      whiteSpace: "nowrap",
      lineHeight: "24px",
    },
    row: {
      width: "100%",
      marginTop: 3,
      marginBottom: 3,
    },
    virtualBox: {
      flexGrow: 1,
    },
    entityName: {
      color: theme.palette.primary.main,
      cursor: "pointer",
      maxWidth: "50%",
      overflow: "hidden",
      textOverflow: "ellipsis",
      whiteSpace: "nowrap",
    },
    matchNameInfo: {
      width: "85%",
      display: "flex",
      justifyContent: "flex-start",
      alignItems: "center",
      overflow: "hidden",
      textOverflow: "ellipsis",
      whiteSpace: "nowrap",
    },
  }),
);

interface DataListItemProps {
  item: MatchItem;
  index: number;
}

const DataListItem: React.FunctionComponent<DataListItemProps> = (props) => {
  const { item, index } = props;
  const classes = useStyles();
  const [activeIndex, setActiveIndex] = useState(-1);
  const { setMismatch, showMatchError, setShowMatchError } = ImportResultListContainer.useContainer();

  const findIndex = showMatchError.indexOf(index);

  function GetMatchImg(): ReactNode {
    return findIndex !== -1 ? (
      <img src={MatchFailWEBP} className={classes.matchImg} />
    ) : (
      <img src={MatchWEBP} className={classes.matchImg} />
    );
  }

  function GetTipInfo(): ReactNode {
    return findIndex !== -1 ? (
      <>
        <img src={CancelWEBP} />
        <Typography style={{ fontSize: 14, marginLeft: 2 }}>取消纠错</Typography>
      </>
    ) : (
      <>
        <img src={ExclamationPointWEBP} />
        <Typography style={{ fontSize: 14, marginLeft: 2 }}>匹配有误</Typography>
      </>
    );
  }

  return (
    <ListItem
      key={index}
      className={findIndex !== -1 ? classes.showBackground : classes.listItemRoot}
      onMouseLeave={(): void => {
        setActiveIndex(-1);
      }}
      onMouseEnter={(): void => {
        setActiveIndex(index);
      }}
    >
      <Box className={classes.cell}>
        <Box className={classes.row1}>
          <Box className={classes.matchNameInfo}>
            <Typography className={classes.matchName}>{item.matchName}</Typography>

            {GetMatchImg()}

            <img
              src={item.matchedEntity?.portraitURL ? item.matchedEntity?.portraitURL : PlaceholderWEBP}
              className={classes.portraitURL}
            />
            <Tooltip title={<Typography>{item.matchedEntity?.entityName ?? ""}</Typography>} placement={"top"}>
              <Typography
                className={classes.entityName}
                onClick={(): void => {
                  window.open(`/profile?id=${item.matchedEntity?.entityID}&type=${item.matchedEntity?.entityType}`);
                }}
              >
                {item.matchedEntity?.entityName}
              </Typography>
            </Tooltip>
          </Box>

          <Box className={classes.virtualBox}> </Box>
          {index === activeIndex ? (
            <Box
              className={findIndex !== -1 ? classes.clickMatchFail : classes.matchFail}
              onClick={(): void => {
                if (findIndex !== -1) {
                  setShowMatchError((oldValue) => {
                    const newValue = Array.from(oldValue);
                    newValue.splice(findIndex, 1);
                    return newValue;
                  });
                  setMismatch((oldValue) => {
                    const newValue = Array.from(oldValue);
                    newValue.splice(findIndex, 1);
                    return newValue;
                  });
                } else {
                  setShowMatchError((oldValue) => {
                    const newValue = Array.from(oldValue);
                    newValue.push(index);
                    return newValue;
                  });
                  setMismatch((oldValue) => {
                    const newValue = Array.from(oldValue);
                    newValue.push(item.matchName as string);
                    return newValue;
                  });
                }
              }}
            >
              {GetTipInfo()}
            </Box>
          ) : (
            showMatchError.includes(index) && <img src={ErrorTip} />
          )}
        </Box>
        <Box className={classes.row}>
          <Typography className={classes.info}>{item.matchedEntity?.info}</Typography>
        </Box>
        <Box className={classes.row}>
          <Typography className={classes.description}>{item.matchedEntity?.description}</Typography>
        </Box>
      </Box>
    </ListItem>
  );
};

export default DataListItem;
