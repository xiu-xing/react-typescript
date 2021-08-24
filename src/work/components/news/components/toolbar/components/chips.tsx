import { Chip, Collapse, IconButton, Theme } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { ChevronDown, ChevronUp, CloseCircle } from "mdi-material-ui";
import React, { useEffect, useState } from "react";
import AppContainer, { FixedTopStyleProps } from "../../../../../containers/appContainer";
import { NewsType } from "../../../../../models/news/news";
import NewsContainer, { NewsEntityProps } from "../../../newsContainer";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      position: "sticky",
      zIndex: 1,
      top: ({ fixedTopHeight }: FixedTopStyleProps): number => fixedTopHeight,
      backgroundColor: "#fff",
    },
    chipRoot: {
      margin: 5,
      padding: "0 8px",
      fontSize: 14,
      border: "none",
      color: "#333",
      background: "rgba(102, 140, 157, 0.14)",
    },
    chipDeleteIcon: {
      color: theme.palette.primary.main,
    },
    buttonContainerBox: {
      height: "100%",
      position: "relative",
    },
    buttonBox: {
      position: "absolute",
      bottom: 0,
    },
    expandedContainer: {
      display: "grid",
      gridTemplateColumns: "1fr 25px",
      gridTemplateRows: "auto",
      paddingTop: 6,
      margin: "12px 0 12px 18px",
    },

    newsContentTitleBar: {
      boxSizing: "border-box",
      height: 36,
      display: "flex",
      justifyContent: "space-between",
      alignItems: "center",
    },
    newsContentTitle: {
      fontSize: 20,
      paddingLeft: 18,
    },
    searchDiv: {
      width: 337,
      height: 36,
      color: "#999999",
      border: "1px solid #EEE",
      borderRadius: 4,
      display: "flex",
      alignItems: "center",
    },
    searchIcon: {
      marginRight: 8,
      marginLeft: 12,
    },
    moreButton: {
      marginTop: "8px",
      height: "25px",
      width: "25px",
    },
    collapseContainer: {
      display: "flex",
      // gridTemplateColumns: "50px 1fr ",
    },
    text: {
      minWidth: "42px",
      height: "42px",
      display: "inline",
      fontWeight: 400,
      color: "#666666",
      marginRight: "6px",
    },
  }),
);

const Chips: React.FunctionComponent = () => {
  const { fixedTopHeight } = AppContainer.useContainer();
  const classes = useStyles({ fixedTopHeight });
  const { keywords, setKeywords, entities, setEntities, newsType } = NewsContainer.useContainer();
  const [collapse, setCollapse] = useState(true);
  const [show, setShow] = useState(false);

  useEffect(() => {
    if (newsType === NewsType.All) {
      setShow(true);
      return;
    }

    setShow(false);
  }, [newsType]);

  const showButton = entities.length + keywords.length > 3;

  return show && (entities.length > 0 || keywords.length > 0) ? (
    <div className={classes.expandedContainer}>
      <Collapse in={collapse} collapsedHeight={42}>
        <div>
          <div>
            <span className={classes.text}>关键词</span>
            {keywords.length
              ? keywords.map((keyword, index) => {
                  return (
                    <Chip
                      key={keyword}
                      classes={{
                        root: classes.chipRoot,
                      }}
                      label={keyword}
                      onDelete={(): void => {
                        setKeywords((prevValue) => {
                          const newValue = Array.from(prevValue);
                          newValue.splice(index, 1);
                          return newValue;
                        });
                      }}
                      deleteIcon={<CloseCircle className={classes.chipDeleteIcon} fontSize="small" color="primary" />}
                    />
                  );
                })
              : null}
            {entities.map((entity: NewsEntityProps, index) => {
              const isKeyword = typeof entity === "string";
              return entity ? (
                <Chip
                  key={isKeyword && !entity ? `${entity}_${index}` : entity.id}
                  classes={{
                    root: classes.chipRoot,
                  }}
                  label={isKeyword ? entity : entity.primaryName}
                  onDelete={(): void => {
                    setEntities((oldValue) => {
                      const newValue = Array.from(oldValue);
                      newValue.splice(index, 1);
                      return newValue;
                    });
                  }}
                  deleteIcon={<CloseCircle className={classes.chipDeleteIcon} fontSize="small" color="primary" />}
                />
              ) : null;
            })}
          </div>
        </div>
      </Collapse>

      {/* {showButton && (
        <div className={classes.buttonContainerBox}>
          <Button
            color="primary"
            className={classes.buttonBox}
            onClick={(): void => {
              setCollapse((prev) => !prev);
            }}
          >
            {collapse ? "折叠" : "展开"}
          </Button>
        </div>
      )} */}
      {showButton && (
        <IconButton
          className={classes.moreButton}
          onClick={(): void => {
            setCollapse(!collapse);
          }}
        >
          {collapse ? <ChevronDown /> : <ChevronUp />}
        </IconButton>
      )}
    </div>
  ) : null;
};

export default Chips;
