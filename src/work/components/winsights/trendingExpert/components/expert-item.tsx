import React from "react";
import { makeStyles } from "@material-ui/core/styles";
import Grid from "@material-ui/core/Grid";
import Typography from "@material-ui/core/Typography";
import { Button } from "@material-ui/core";
import { ContentProps, Exports } from "..";
import Information from "../../../../icons/Info";
import AppContainer from "../../../../containers/appContainer";
import ExpertDemandContent from "../../form/expert-demand-content";

const useStyles = makeStyles((theme) => ({
  root: {
    display: "flex",
    marginBottom: "32px",
  },
  image: {
    width: 90,
    height: 120,
    borderRadius: "4px",
    objectFit: "cover",
    objectPosition: "top",
    marginRight: "12px",
  },
  content: {
    maxWidth: "540px",
  },
  title: {
    fontSize: 16,
    fontWeight: 500,
    color: "#333333",
  },
  subtitle: {
    fontSize: 14,
    fontWeight: 500,
    color: "#666666",
    marginTop: "6px",
  },
  bottom: {
    display: "flex",
    alignItems: "center",
    justifyContent: "space-between",
    marginTop: "10px",
  },
  tags: {
    display: "flex",
    flexWrap: "wrap",
  },
  tag: {
    color: theme.palette.primary.main,
    backgroundColor: "rgba(79, 112, 155, 0.12)",
    fontSize: 12,
    fontWeight: 500,
    borderRadius: "2px",
    padding: "2px 6px",
    marginRight: "12px",
    marginBottom: "4px",
    whiteSpace: "nowrap",
  },
  icon: {
    width: "14px",
    height: "14px",
  },
}));

const ExpertItem: React.FunctionComponent<{ data: Exports; index: number; content: ContentProps[]; proId: string }> = (
  props,
) => {
  const classes = useStyles();
  const { showDialog } = AppContainer.useContainer();
  const expGoodAt = props.data.expGoodAt.split("，");

  return (
    <Grid className={classes.root}>
      <img className={classes.image} src={`${process.env.NEXT_PUBLIC_WINSIGHTS}/${props.data.expImg}`} />
      <Grid className={classes.content}>
        <Grid item>
          <Typography className={classes.title}>{`专家${props.index + 1} ${props.data.expSummary}`}</Typography>
          <Typography className={classes.subtitle}>{props.data.expIntroduce}</Typography>
        </Grid>
        <Grid item container className={classes.bottom}>
          <div className={classes.tags}>
            {expGoodAt.length > 0 &&
              expGoodAt.map((item, index) => {
                return (
                  <div className={classes.tag} key={index}>
                    {item}
                  </div>
                );
              })}
          </div>
          <Button
            style={{ boxShadow: "none" }}
            variant="contained"
            color="primary"
            size="small"
            startIcon={<Information className={classes.icon} />}
            onClick={() => {
              showDialog({
                fullWidth: true,
                maxWidth: "sm",
                children: <ExpertDemandContent proId={props.proId} content={props.content} index={props.index} />,
              });
            }}
          >
            约访
          </Button>
        </Grid>
      </Grid>
    </Grid>
  );
};
export default ExpertItem;
