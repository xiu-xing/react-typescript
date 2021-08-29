import { Box } from "@material-ui/core";
import React from "react";
import Counter from "../../contains/for-exmaple";
import SearchInput from "./components/search_input";

const Scroll: React.FunctionComponent<{}> = () => {
  const counter = Counter.useContainer();
  function getCurrentInput(parms: string) {

  }
  return (
    <Box>
      <SearchInput getCurrentInput={getCurrentInput} />
      <button onClick={counter.decrement}>-</button>
      <span>{counter.count}</span>
      <button onClick={counter.increment}>+</button>
    </Box>
  )
}

export default Scroll;