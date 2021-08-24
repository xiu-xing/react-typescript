import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import AppContainer, { FixedTopStyleProps } from "../../containers/appContainer";
import InstitutionDisplay from "./institution-display";
import InstitutionContainer from "./institutionContainer";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      display: "flex",
      flexDirection: "column",
      height: ({ fixedTopHeight }: FixedTopStyleProps): string => `calc(100vh - ${fixedTopHeight}px)`,
      overflowY: "hidden",
      minWidth: 600,
    },
  }),
);

const Institution: React.FunctionComponent<{}> = () => {
  const { fixedTopHeight } = AppContainer.useContainer();
  const classes = useStyles({ fixedTopHeight });
  return (
    <InstitutionContainer.Provider>
      <div className={classes.root}>
        <InstitutionDisplay />
      </div>
    </InstitutionContainer.Provider>
  );
};

export default Institution;
