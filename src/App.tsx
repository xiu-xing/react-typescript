import React from 'react';
import { Theme, makeStyles, createStyles, ButtonBase, Container, ButtonGroup, Checkbox, Typography, IconButton, TextField, Input, Box, Link } from '@material-ui/core';
import FromWrapper from './components/fromWapper';
import BasicTextField from './components/basic-text-field';
import Counter from './containers/userContainer';
import LabTabs from './pages/tabpanel';

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
  function CounterDisplay() {
    let counter = Counter.useContainer()
    return (
      <div>
        <button onClick={counter.decrement}>-</button>
        <p>You clicked {counter.count} times</p>
        <button onClick={counter.increment}>+</button>
        <div>
          <div>
            <div>
              <div>SUPER EXPENSIVE RENDERING STUFF</div>
            </div>
          </div>
        </div>
      </div>
    )
  }
  return (
    <FromWrapper title="提交表单" onSubmit={() => { }}>
      <BasicTextField
        required
        label="姓名"
        helperText="请输入您的姓名"
        variant="standard"
      />
      <BasicTextField
        required
        label="电话"
        helperText="请输入您的电话"
        variant="standard" />
      <Input type="number" defaultValue="Hello world" inputProps={{ 'aria-label': 'description' }} />
      {/* //Provider */}
      <Box onClick={()=>{window.location.href="./pages/stepper"}}>
      stepper
      </Box>
      <LabTabs/>
    </FromWrapper>
  );
}

export default App;
