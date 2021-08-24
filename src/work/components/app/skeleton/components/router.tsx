import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { HTMLProps } from "react";

const useStyles = makeStyles(
  createStyles({
    root: {},
  }),
);

type RouterProps = HTMLProps<HTMLDivElement>;

const Router: React.FunctionComponent<RouterProps> = (props) => {
  const classes = useStyles();
  const { className, ...leftProps } = props;
  return (
    <div {...leftProps} className={clsx(className, classes.root)}>
      {/* <Switch>
        <Route exact path="/" render={(): ReactNode => <Redirect to="/dashboard" />} />
        <Route path="/login" component={Authorization} exact />
        <Route path="/news" component={News} exact />
        <Route
          path="/profile"
          render={(props): ReactNode => {
            const keyString = props.location.search;

            return <Profile key={keyString} />;
          }}
          sensitive
          exact
        />
        <Route exact path="/advanced-search" component={AdvancedSearchTemplate} />
        <Route exact path="/advanced-search/template" component={AdvancedSearchTemplate} />
        <Route
          path="/advanced-search/search/:searchType/:templateId?"
          render={(props): ReactNode => <AdvancedSearch key={props.location.pathname} />}
        />
        <Route path="/vertical" component={Vertical} />
        <Route path="/dashboard" component={Dashboard} />
        <Route path="/setting" exact component={User} />
        <Route path="/404" component={NoMatchPage} />
        <Route component={NoMatchPage} /> */
      /* </Switch> */}
    </div>
  );
};

export default Router;
