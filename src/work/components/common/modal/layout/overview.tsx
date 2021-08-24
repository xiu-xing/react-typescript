import { Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { ReactNode } from "react";
import { Block as BlockModel } from "../../../../generated/graphql";
import EntityAvatar from "../../entity-avatar-next/entity-avatar";
import Block from "../../section/block-section/block";
import { useModalData } from "../atom";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      padding: "24px",
      zIndex: 1,
    },
    header: {
      display: "flex",
      flexDirection: "row",
      marginBottom: 8,
      // justifyContent: "center",
      alignItems: "center",
    },
    entityLogo: {
      width: 30,
      height: 30,
      marginRight: 8,
    },
    primaryName: {
      fontSize: 16,
      color: "#333",
      fontWeight: 500,
      overflow: "hidden",
      textOverflow: "ellipsis",
      whiteSpace: "nowrap",
    },
    contentBox: {
      display: "flex",
      flexDirection: "column",
      height: "min-content",
    },
    block: {
      marginBottom: 8,
    },
  }),
);

interface OverviewLayoutProps {
  modalData?: Map<string, unknown> | null;
}

export const OverviewLayout: React.FunctionComponent<OverviewLayoutProps> = (props) => {
  const classes = useStyles();
  const { modalData } = props;
  const [modalDataState] = useModalData();

  function layout(): ReactNode {
    if (!modalDataState && !modalData)
      return (
        <Typography
          style={{
            fontSize: 14,
            color: "#666",
          }}
        >
          暂无数据
        </Typography>
      );

    const blocks = modalData
      ? (modalData.get("blocks") as BlockModel[])
      : (modalDataState?.get("blocks") as BlockModel[]);
    const logoURI: unknown = modalData ? modalData.get("logoURI") : modalDataState?.get("logoURI");
    const primaryName: unknown = modalData ? modalData.get("primaryName") : modalDataState?.get("primaryName");

    return (
      <>
        <div className={classes.header}>
          <EntityAvatar src={typeof logoURI === "string" ? logoURI : ""} className={classes.entityLogo} />
          <Typography className={classes.primaryName}>{typeof primaryName === "string" ? primaryName : ""}</Typography>
        </div>
        <div className={classes.contentBox}>
          {blocks &&
            blocks?.map((value, index) => {
              return (
                <div key={index} className={classes.block}>
                  <Block model={value} modal />
                </div>
              );
            })}
        </div>
      </>
    );
  }

  return <div className={classes.root}>{layout()}</div>;
};
