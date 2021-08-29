import React from 'react';
import { Theme, makeStyles, createStyles, ButtonBase, Container, ButtonGroup, Checkbox, Typography, IconButton, TextField, Input } from '@material-ui/core';
import FromWrapper from './components/fromWapper';
import BasicTextField from './components/basic-text-field';
import Counter from './contains/for-exmaple';
import Scroll from './pages/scroll';

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
    </Counter.Provider>

  );
}

export default App;
