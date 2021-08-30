import React from 'react';
import { Theme, makeStyles, createStyles, ButtonBase, Container, ButtonGroup, Checkbox, Typography, IconButton, TextField, Input, Box, Link } from '@material-ui/core';
import FromWrapper from './components/fromWapper';
import BasicTextField from './components/basic-text-field';
import Scroll from './pages/scroll';
import Counter from './containers/userContainer';
import BreakPoint from './pages/break-point';

const useStyle = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      height: "100vh",
      background: "#fff",
      display: "flex",
      flexDirection: "column",
      border: "1px solid black",
    },
    title: {
      fontSize: 18,
      lineHeight: "26px",
      fontWeight: theme.typography.fontWeightMedium,
      color: "white",
    },

  })
);

const App: React.FunctionComponent<{}> = () => {
  const classes = useStyle();
  return (
    <Counter.Provider>
      <Scroll />
      <BreakPoint/>
    </Counter.Provider>
  );
}

export default App;
