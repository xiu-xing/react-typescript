import { Box, CircularProgress, Divider, IconButton, List, ListItem, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { useClient } from "@momentum-valley/muse-js";
import clsx from "clsx";
import _ from "lodash";
import React, { ReactNode, useCallback, useEffect } from "react";
import { uid } from "react-uid";
import { withAlphaHex } from "with-alpha-hex";
import UserContainer from "../../../../../containers/userContainer";
import { EntityType } from "../../../../../generated/graphql";
import { Vertical } from "../../../../../models/vertical/vertical";
import Placeholder from "../../../../common/placeholders/placeholder";
import { SVGEdition, SVGSortAsc, SVGSortDefault, SVGSortDesc } from "../../assets";
import { config } from "../../config";
import VerticalContainer from "../../verticalContainer";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      width: "100%",
      marginTop: "4px",
      minWidth: 500,
    },
    header: {
      width: "100%",
      display: "flex",
      alignItems: "center",
      height: 48,
      padding: "0 24px",
    },
    sortingHeaderCell: {
      cursor: "defalut",
      display: "flex",
      alignItems: "center",
      "& span": {
        cursor: "default",
      },
    },
    sortingHeaderAlignRight: {
      justifyContent: "flex-end",
    },
    sortingSVG: {
      marginLeft: 4,
      minWidth: 16,
      maxWidth: 16,
      pointerEvents: "none",
    },
    editionSVG: {
      pointerEvents: "none",
    },
    item: {
      padding: "0 24px",
      height: 63,
      borderRadius: "28px",
    },
    cell: {
      padding: "0 4px",
      minWidth: 100,
      overflow: "hidden",
      textOverflow: "ellipsis",
      whiteSpace: "nowrap",
    },
    textEllipsis: {
      overflow: "hidden",
      textOverflow: "ellipsis",
      whiteSpace: "nowrap",
    },
    editionColumn: {
      width: 80,
    },
    button: {
      "&:hover": {
        backgroundColor: withAlphaHex(theme.palette.primary.main, 0.16),
      },
    },
    divider: {
      marginLeft: "28px",
      marginRight: "28px",
    },
    placeholder: {
      height: 50,
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
    },
    noMoreText: {
      fontSize: 14,
      fontWeight: 500,
      color: "#9b9b9b",
    },
  }),
);

const Result: React.FunctionComponent = () => {
  const classes = useStyles();
  const {
    sorting,
    fetching,
    loadMore,
    setSorting,
    hasNextPage,
    selectedColumnIds,
    secondLevelVerticals,
    setEditionDialogOpen,
  } = VerticalContainer.useContainer();
  const muse = useClient();

  const onPageScroll = useCallback(
    _.debounce(() => {
      const bodyHeight = document.body.clientHeight;
      if (document.documentElement.scrollTop + bodyHeight + 30 >= document.body.scrollHeight && !fetching) {
        loadMore();
      }
    }, 25),
    [],
  );

  function onSortingChange(columnId: string): void {
    if (!sorting) {
      setSorting({
        order_field: columnId,
        order_type: "ASC",
      });
      return;
    }
    if (sorting.order_field === columnId) {
      switch (sorting.order_type) {
        case "ASC":
          setSorting({
            order_field: columnId,
            order_type: "DESC",
          });
          break;
        case "DESC":
          setSorting(undefined);
          break;
      }
      return;
    }
    setSorting({
      order_type: "ASC",
      order_field: columnId,
    });
  }

  useEffect(() => {
    document.body.onscroll = onPageScroll;
    return (): void => {
      document.body.onscroll = null;
    };
  }, [onPageScroll]);

  function sortingSVG(columnId: string): ReactNode {
    if (!sorting || sorting.order_field !== columnId) {
      return <SVGSortDefault className={classes.sortingSVG} />;
    }
    if (sorting.order_type === "ASC") {
      return <SVGSortAsc className={classes.sortingSVG} />;
    }
    return <SVGSortDesc className={classes.sortingSVG} />;
  }

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  function sortableHeaderCellComponent(column: any, columnId: string): ReactNode {
    const align = column["align"];

    return (
      <Box
        key={columnId}
        flex={column["flexGrow"] || 1}
        textAlign={align}
        fontWeight={500}
        onClick={(): void => {
          onSortingChange(columnId);
        }}
        className={clsx(
          classes.cell,
          classes.sortingHeaderCell,
          align === "right" ? classes.sortingHeaderAlignRight : "",
        )}
      >
        <span className={classes.textEllipsis}>{column["name"]}</span>
        {sortingSVG(columnId)}
      </Box>
    );
  }

  const renderResult = (data: Array<Vertical>): JSX.Element => {
    return (
      <>
        <List>
          {data.map((vertical, index) => (
            <div key={uid(index)}>
              {!index ? null : <Divider className={classes.divider} />}
              <ListItem
                button
                className={classes.item}
                classes={{
                  button: classes.button,
                }}
                onClick={(): void => {
                  muse.sendTrackingEvent("vertical.item_tap", {
                    entity: {
                      id: vertical.id,
                      type: EntityType.Vertical,
                    },
                  });
                }}
                component="a"
                href={`/profile?id=${vertical.id}&type=VERTICAL`}
                target="_blank"
              >
                {selectedColumnIds.map((columnId: string) => {
                  const column = config.columns[columnId];
                  const align = column["align"];
                  return (
                    <Box
                      className={classes.cell}
                      key={columnId}
                      flex={column["flexGrow"] || 1}
                      textAlign={align}
                      color="#333"
                    >
                      {vertical[columnId]}
                    </Box>
                  );
                })}
                <Box className={classes.editionColumn} key={"editionColumn"} textAlign={"right"} color="#333" />
              </ListItem>
            </div>
          ))}
        </List>
        {fetching ? (
          <Box className={classes.placeholder}>
            <CircularProgress size={30} />
          </Box>
        ) : hasNextPage ? null : (
          <Box className={classes.placeholder}>
            <Typography className={classes.noMoreText}>滑到底啦！</Typography>
          </Box>
        )}
      </>
    );
  };

  return (
    <Box className={classes.root}>
      <Typography component="div" className={classes.header}>
        {selectedColumnIds.map((columnId: string) => {
          const column = config.columns[columnId];
          if (column) {
            const sortable = column["sortable"];
            const align = column["align"];
            return sortable ? (
              sortableHeaderCellComponent(column, columnId)
            ) : (
              <Box
                key={columnId}
                flex={column["flexGrow"] || 1}
                textAlign={align}
                fontWeight={500}
                className={classes.cell}
              >
                {column["name"]}
              </Box>
            );
          }
          return null;
        })}
        <Box className={classes.editionColumn} textAlign={"right"} color="#333">
          <IconButton
            onClick={(): void => {
              setEditionDialogOpen(true);
            }}
          >
            <SVGEdition className={classes.editionSVG} />
          </IconButton>
        </Box>
      </Typography>
      {secondLevelVerticals.length > 0 ? (
        renderResult(secondLevelVerticals)
      ) : fetching ? (
        <Placeholder content={<CircularProgress size={30} />} />
      ) : (
        <Placeholder />
      )}
    </Box>
  );
};

export default Result;
