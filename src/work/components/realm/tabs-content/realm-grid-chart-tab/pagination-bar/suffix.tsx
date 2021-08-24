import { Button, SvgIcon, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import GetAppIcon from "@material-ui/icons/GetApp";
import React from "react";
import GridTabContainer from "../container";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    buttonText: {
      margin: "0px 16px",
      fontSize: 14,
      display: "flex",
      alignItems: "center",
      whiteSpace: "pre",
    },
  }),
);

interface SuffixProps {
  onClickExport: () => void;
}

const Suffix: React.FunctionComponent<SuffixProps> = ({ onClickExport }) => {
  const classes = useStyles();
  const { setColumnsEditorOpen } = GridTabContainer.useContainer();

  return (
    <>
      <Button
        className={classes.root}
        style={{ marginRight: 0 }}
        onClick={(): void => {
          setColumnsEditorOpen(true);
        }}
      >
        <SvgIcon viewBox="0 0 1024 1024" style={{ fontSize: 16 }}>
          <path d="M397.03466665 63.99999999c32 0 58.048 40.32 58.048 89.6v716.8c0 49.28-26.112 89.6-58.048 89.6H164.71466665C132.77866665 959.99999999 106.66666665 919.67999999 106.66666665 870.39999999V153.59999999C106.66666665 104.31999999 132.77866665 63.99999999 164.71466665 63.99999999h232.32z m448 0c32 0 58.048 40.32 58.048 89.6v716.8c0 49.28-26.112 89.6-58.048 89.6h-232.32C580.77866665 959.99999999 554.66666665 919.67999999 554.66666665 870.39999999V153.59999999c0-49.28 26.112-89.6 58.048-89.6h232.32zM375.46666665 691.19999999h-192v192h192v-192z m448 0h-192v192h192v-192z m-448-268.8h-192v192h192v-192z m448 0h-192v192h192v-192z m-448-275.2h-192v192h192v-192z m448 0h-192v192h192v-192z" />
        </SvgIcon>
        <Typography className={classes.buttonText} style={{ margin: "0 4px" }}>
          编辑列
        </Typography>
      </Button>
      <Button className={classes.root} onClick={onClickExport}>
        <GetAppIcon style={{ color: "#666", fontSize: 20 }} />
        <Typography className={classes.buttonText} style={{ margin: "0 4px" }}>
          导出
        </Typography>
      </Button>
    </>
  );
};

export default Suffix;
