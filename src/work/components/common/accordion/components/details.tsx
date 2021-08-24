import { AccordionDetails, AccordionDetailsProps, ButtonBase, Divider } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { ReactNode } from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      padding: 0,
      display: "flex",
      flexDirection: "column",
    },
    topDivider: {
      marginBottom: 8,
    },
    bottomDivider: {
      marginTop: 8,
    },
    footerButton: {
      height: 52,
    },
  }),
);

interface CommonAccordionDetailsProps extends AccordionDetailsProps {
  footerButton?: ReactNode;
  footerButtonClick?: () => void;
  disableTopDivider?: boolean;
}

const CommonAccordionDetails: React.FunctionComponent<CommonAccordionDetailsProps> = (props) => {
  const classes = useStyles();
  const { footerButton, footerButtonClick, disableTopDivider, children, ...leftProps } = props;

  return (
    <AccordionDetails {...leftProps} className={classes.root}>
      {!disableTopDivider && <Divider className={classes.topDivider} />}
      {children}
      {footerButton && (
        <>
          <Divider className={classes.bottomDivider} />
          <ButtonBase className={classes.footerButton} onClick={footerButtonClick}>
            {footerButton}
          </ButtonBase>
        </>
      )}
    </AccordionDetails>
  );
};

export default CommonAccordionDetails;
