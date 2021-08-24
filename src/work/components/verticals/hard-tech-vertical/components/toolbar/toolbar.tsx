import { Button, createStyles, Divider, makeStyles, Typography } from "@material-ui/core";
import clsx from "clsx";
import _ from "lodash";
import { ArrowRightCircle } from "mdi-material-ui";
import { useRouter } from "next/router";
import React, { useEffect, useState } from "react";
import AppContainer, { FixedTopStyleProps } from "../../../../../containers/appContainer";
import HardTechVerticalContainer from "../../hardTechContainer";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      position: "fixed",
      zIndex: 1000,
      backgroundColor: "#fff",
      width: "100%",
      top: ({ fixedTopHeight }: FixedTopStyleProps): number => fixedTopHeight,
    },

    shadow: {
      boxShadow: "4px 1px 4px 0px rgba(0, 0, 0, 0.2)",
    },

    toolbarBox: {
      minHeight: 40,
      display: "flex",
      alignItems: "center",
      padding: "28px 6px 16px 12px",
    },

    title: {
      fontSize: 20,
      whiteSpace: "pre-wrap",
    },

    detailText: {
      fontSize: 14,
      color: "#4F709B",
    },

    detailButton: {
      marginLeft: 30,
    },

    detailIcon: {
      width: 16,
      height: 16,
      color: "#4F709B",
    },
  }),
);

interface ToolbarProps {
  title: string;
  numberOfAccount: string;
}

const Toolbar: React.FunctionComponent<ToolbarProps> = (props) => {
  const { fixedTopHeight } = AppContainer.useContainer();
  const { currentVertical } = HardTechVerticalContainer.useContainer();
  const classes = useStyles({ fixedTopHeight });
  const router = useRouter();
  const { title, numberOfAccount } = props;

  const [showShadow, setShowShadow] = useState(false);

  const scrollHandler = _.throttle(() => {
    if (document.documentElement.scrollTop == 0) {
      setShowShadow(false);
    } else {
      setShowShadow(true);
    }
  }, 150);

  useEffect(() => {
    window.addEventListener("scroll", scrollHandler);
    return (): void => {
      window.removeEventListener("scroll", scrollHandler);
    };
  }, []);

  return (
    <>
      <div className={clsx(classes.root)}>
        <div className={classes.toolbarBox}>
          {typeof title === "string" ? (
            <Typography className={classes.title}>
              {title}（{numberOfAccount ?? 0}）
            </Typography>
          ) : (
            title
          )}

          <Button
            className={classes.detailButton}
            size="small"
            color="primary"
            startIcon={<ArrowRightCircle />}
            classes={{
              startIcon: classes.detailIcon,
            }}
            onClick={() => {
              window.open("/profile?id=" + currentVertical!.UnionID + "&type=VERTICAL");
            }}
          >
            查看详情
          </Button>
        </div>
        {showShadow ? <Divider className={classes.shadow} /> : undefined}
      </div>
    </>
  );
};

export default Toolbar;
