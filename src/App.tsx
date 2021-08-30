import React from "react";
import { Theme, makeStyles, createStyles, Box } from "@material-ui/core";
import Scroll from "./pages/scroll";
import Counter from "./containers/userContainer";
import BreakPoint from "./pages/break-point";
import StateHook from "./pages/react-hooks/state_hook";

const useStyle = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      height: "100vh",
      background: "#fff",
      display: "flex",
      margin:"auto",
    },
  })
);

const App: React.FunctionComponent<{}> = () => {
  const classes = useStyle();
  return (
    <Box maxWidth={"80%"} className={classes.root}>
      <Counter.Provider>
        {/* <Scroll /> */}
        {/* <BreakPoint/> */}
        <StateHook />
      </Counter.Provider>
    </Box>
  );
};

export default App;
