import React from "react";
import { makeStyles } from "@material-ui/core/styles";
import Typography from "@material-ui/core/Typography";
import { Box, Button } from "@material-ui/core";
import { ExportSource } from "..";
import Information from "../../../../icons/Info";
import AppContainer from "../../../../containers/appContainer";
import ExpertDemandContent from "../../form/expert-demand-content";
import { ContentProps } from "../../trendingExpert";

const useStyles = makeStyles((theme) => ({
  root: {
    display: "flex",
    marginBottom: "30px",
    "&:hover": {
      "& .subHover": {
        display: "block",
        fontSize: 12,
        fontWeight: 400,
        color: "#666666",
        marginTop: "2px",
      },
      "& .button": {
        display: "inline-flex",
        boxShadow: "none",
        "&:hover": {
          boxShadow: "none",
        },
      },
    },
  },
  image: {
    width: 60,
    height: 80,
    borderRadius: "4px",
    objectFit: "cover",
    objectPosition: "top",
  },
  content: {
    // minWidth: "308px",
    // marginLeft: "12px",
  },
  title: {
    fontSize: 14,
    fontWeight: 500,
    color: "#333333",
    textAlign: "start",
  },
  subtitle: {
    fontSize: 12,
    fontWeight: 400,
    color: "#666666",
    marginTop: "2px",
    textOverflow: "ellipsis",
    overflow: "hidden",
    display: "-webkit-box",
    WebkitLineClamp: 1,
    WebkitBoxOrient: "vertical",
    textAlign: "start",
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
    marginBottom: "6px",
    whiteSpace: "nowrap",
  },
  icon: {
    width: "14px",
    height: "14px",
  },
  btn: {
    height: 32,
    display: "none",
    minWidth: 70,
  },
  btnTitle: {
    fontSize: 14,
    color: "#fff",
    whiteSpace: "nowrap",
  },
}));

const ExpertItem: React.FunctionComponent<{
  data: ExportSource;
  index: number;
  popId?: string;
  content: ContentProps[];
}> = (props) => {
  const classes = useStyles();
  const { showDialog } = AppContainer.useContainer();
  const expGoodAt = props.data.expGoodAt.split("，");

  return (
    <Box className={classes.root}>
      <img className={classes.image} src={`${process.env.NEXT_PUBLIC_WINSIGHTS}/${props.data.expImg}`} />
      <Box minWidth={12} />
      <Box className={classes.content}>
        <Typography className={classes.title}>{`专家${props.index + 1}:${props.data.expSummary}`}</Typography>
        <Typography className={`${classes.subtitle} subHover`}>{props.data.expIntroduce}</Typography>
        <Box className={classes.bottom}>
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
            className={`${classes.btn} button`}
            variant="contained"
            color="primary"
            size="small"
            startIcon={<Information className={classes.icon} />}
            onClick={() => {
              showDialog({
                fullWidth: true,
                maxWidth: "sm",
                children: <ExpertDemandContent proId={props.popId} content={props.content} index={props.index} />,
              });
            }}
          >
            <Typography className={classes.btnTitle}>约访</Typography>
          </Button>
        </Box>
      </Box>
    </Box>
  );
};
export default ExpertItem;
