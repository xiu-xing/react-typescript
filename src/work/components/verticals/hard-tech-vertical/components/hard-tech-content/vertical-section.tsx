import { ButtonBase, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import { useRouter } from "next/router";
import React from "react";
import Space from "../../../../common/space";
import { KeyValueMapResult } from "../../hard-tech-vertical";

const useStyles = makeStyles((theme) =>
  createStyles({
    commomRoot: {
      display: "grid",
      gridGap: "16px",
    },
    commomBox: {
      width: "100%",
      borderRadius: 4,
      display: "flex",
      alignItems: "center",
      textAlign: "center",
    },
    commomText: {
      textAlign: "center",
      fontSize: 14,
      color: "#fff",
      fontWeight: 500,
      cursor: "pointer",
      userSelect: "none",
    },
    commomButtonBase: {
      width: "100%",
      height: "100%",
      borderRadius: 4,
      padding: "4px 12px",
    },
    subSections: {
      display: "flex",
      flexDirection: "column",
    },
    secondRoot: {
      gridTemplateColumns: "150px 1fr",
    },
    thirdRoot: {
      gridTemplateColumns: "160px 1fr",
    },
    secondBox: {
      backgroundColor: "#86A2BF",
    },
    thirdBox: {
      backgroundColor: "#9FBBD2",
    },
    boxGap: {
      gap: "12px",
      flexWrap: "wrap",
    },
    tag: {
      borderRadius: 4,
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
      color: "#4F709B",
      textIndent: "12px",
    },
    fourthButtonBase: {
      width: "100%",
      height: "100%",
      borderRadius: "4px",
      backgroundColor: "rgba(113,146,186,0.1)",
      padding: "4px 12px",
    },
    fourthText: {
      color: theme.palette.primary.main,
    },
  }),
);

interface VerticalSectionProps {
  secondLevelVertical: KeyValueMapResult;
}
interface VerticalTagProps {
  vertical: KeyValueMapResult;
  index: any;
}
const VerticalTag: React.FunctionComponent<VerticalTagProps> = (props) => {
  const classes = useStyles();
  const router = useRouter();
  const { index, vertical } = props;
  return (
    <div className={classes.tag}>
      <ButtonBase
        className={classes.fourthButtonBase}
        key={index}
        onClick={() => {
          window.open("/profile?id=" + vertical.UnionID + "&type=VERTICAL");
        }}
      >
        <Typography className={clsx(classes.commomText, classes.fourthText)}>{vertical.Name}</Typography>
        <Typography
          className={clsx(classes.commomText, classes.fourthText)}
        >{`（${vertical.NumberOfEnterprise}）`}</Typography>
      </ButtonBase>
    </div>
  );
};

const VerticalSection: React.FunctionComponent<VerticalSectionProps> = (props) => {
  const classes = useStyles();
  const router = useRouter();
  const { secondLevelVertical } = props;

  let thirdLevelVerticalsList: KeyValueMapResult[] = [];
  if (secondLevelVertical.NextLevel) {
    thirdLevelVerticalsList = secondLevelVertical.NextLevel;
  }

  return (
    <>
      <div className={clsx(classes.commomRoot, classes.secondRoot)} key={secondLevelVertical.UnionID + "box"}>
        <div className={clsx(classes.commomBox, classes.secondBox)}>
          <ButtonBase
            className={classes.commomButtonBase}
            key={secondLevelVertical.UnionID}
            onClick={() => {
              window.open("/profile?id=" + secondLevelVertical.UnionID + "&type=VERTICAL");
            }}
          >
            <Typography className={classes.commomText}>
              {secondLevelVertical.Name}
              {thirdLevelVerticalsList.length === 0 ? <br /> : null}（{secondLevelVertical.NumberOfEnterprise}）
            </Typography>
          </ButtonBase>
        </div>
        <div className={clsx(classes.commomRoot, classes.thirdRoot)}>
          {thirdLevelVerticalsList &&
            thirdLevelVerticalsList.map((thirdVertical: KeyValueMapResult, index) => {
              return (
                <React.Fragment key={index}>
                  <div className={clsx(classes.commomBox, classes.thirdBox)}>
                    <ButtonBase
                      className={classes.commomButtonBase}
                      onClick={() => {
                        window.open("/profile?id=" + thirdVertical.UnionID + "&type=VERTICAL");
                      }}
                    >
                      <Typography
                        className={classes.commomText}
                      >{`${thirdVertical.Name}（${thirdVertical.NumberOfEnterprise}）`}</Typography>
                    </ButtonBase>
                  </div>
                  <Space wrap size={12}>
                    {thirdVertical.NextLevel &&
                      thirdVertical.NextLevel?.map((vertical: KeyValueMapResult, index: React.Key | undefined) => {
                        return <VerticalTag vertical={vertical} index={index ?? 0} key={vertical.UnionID} />;
                      })}
                  </Space>
                </React.Fragment>
              );
            })}
        </div>
      </div>
    </>
  );
};

export default VerticalSection;
