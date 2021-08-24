import { Button, CircularProgress } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import _ from "lodash";
import router from "next/router";
import { parseCookies } from "nookies";
import React, { ReactNode, useState } from "react";
import { useClient } from "urql";
import {
  ArticleType,
  ArticleUriDocument,
  ArticleUriQuery,
  ArticleUriQueryVariables,
  FetchType,
} from "../../generated/graphql";
import { Logo } from "../app/skeleton/components/appbar-next/assets";
import { APPBAR_HEIGHT } from "../app/skeleton/components/appbar-next/index-next";
import ArticleLimitedDialog from "../article/dialog/limited-dialog";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      height: "100vh",
      overflow: "hidden",
    },
    appBar: {
      width: "100%",
      display: "flex",
      justifyContent: "space-between",
      alignItems: "center",
      backgroundColor: theme.palette.primary.main,
      padding: "0 28px 0 13px",
      fontWeight: 500,
      minWidth: 554,
      height: APPBAR_HEIGHT,
    },
    appBarContentRight: {},
    logo: {
      height: 18,
      width: 140,
      "& #logo": {
        fill: "#ffffff",
      },
      cursor: "default",
    },
    logoButton: {
      marginRight: 40,
    },
    logoArea: {
      position: "relative",
    },
    downloadButton: {
      color: "#4F709B",
      background: "white",
      "&:hover": {
        color: "#4F709B",
        background: "white",
      },
      fontWeight: 500,
    },
    iframe: {
      height: `calc(100vh - ${APPBAR_HEIGHT}px)`,
      border: "none",
    },
  }),
);

interface ViewerProps {
  id?: string;
  url?: string;
}

const Viewer: React.FunctionComponent<ViewerProps> = (props) => {
  const classes = useStyles();

  const { id, url } = props;
  const client = useClient();
  const [isDownload, setIsDownload] = useState(false);
  const [numberOfUsedCount, setNumberOfUsedCount] = useState<number>();
  const [numberOfUnusedCount, setNumberOfUnusedCount] = useState<number>();
  const [limitedDialogOpen, setLimitedDialogOpen] = useState(false);

  function onLogoButtonClick(): void {
    if (!router.pathname.includes("dashboard")) {
      router.push("/dashboard");
    }
  }

  async function onDownloadButtonClick(): Promise<void> {
    if (!id) {
      return;
    }
    const res = await client
      .query<ArticleUriQuery, ArticleUriQueryVariables>(ArticleUriDocument, {
        id: id,
        articleType: ArticleType.ArticleTypeResearchReport,
        articleModuleID: "research.research_report",
        fetchType: FetchType.FetchTypeDownload,
      })
      .toPromise();
    if (res.error) {
      return;
    }
    if (
      res.data?.articleUri?.resourceURI &&
      res.data?.articleUri?.numOfUnusedDownload &&
      res.data?.articleUri?.numOfUnusedDownload > 0
    ) {
      setIsDownload(true);
      window.open(`${process.env.NEXT_PUBLIC_NGINX_RESOURCE_API}/${res.data?.articleUri?.resourceURI}`);
    } else {
      setNumberOfUnusedCount(res.data?.articleUri?.numOfUnusedDownload ?? undefined);
      setNumberOfUsedCount(res.data?.articleUri?.numOfUsedDownload ?? undefined);
      setLimitedDialogOpen(true);
    }
  }

  if (process.env.browser) {
    const cookies = parseCookies();
    window["accessToken"] = `${cookies["access_token"] ?? ""}`;
  }

  function contentComponent(): ReactNode {
    const isBrowser = _.get(process, "browser");
    if (!url && !isBrowser) {
      return (
        <div style={{ margin: "auto", paddingTop: 24, width: "max-content" }}>
          <CircularProgress color="primary" size={30} />
        </div>
      );
    }
    const fileURL = encodeURIComponent(`${process.env.NEXT_PUBLIC_NGINX_RESOURCE_API}/${url}`);
    return (
      <>
        <iframe className={classes.iframe} width="100%" src={process.env.NEXT_PUBLIC_PDF_VIEWER + `?file=${fileURL}`} />
      </>
    );
  }

  return (
    <div className={classes.root}>
      <ArticleLimitedDialog
        type="download"
        open={limitedDialogOpen}
        numberOfUsedCount={numberOfUsedCount}
        onClose={() => setLimitedDialogOpen(false)}
        numberOfUnusedCount={numberOfUnusedCount}
      />
      <div className={classes.appBar}>
        <div className={classes.logoArea}>
          <Button onClick={onLogoButtonClick} className={classes.logoButton} size="large">
            <Logo className={classes.logo} pointerEvents="none" />
          </Button>
        </div>
        <div className={classes.appBarContentRight}>
          <Button
            onClick={onDownloadButtonClick}
            className={classes.downloadButton}
            color="inherit"
            size="medium"
            variant="outlined"
            disabled={isDownload}
          >
            下载
          </Button>
        </div>
      </div>
      {contentComponent()}
    </div>
  );
};

export default Viewer;
