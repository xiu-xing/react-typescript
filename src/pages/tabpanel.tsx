import React from 'react';
import { makeStyles, Theme } from '@material-ui/core/styles';
import AppBar from '@material-ui/core/AppBar';
import Tab from '@material-ui/core/Tab';
import { TabContext, TabList, TabPanel } from '@material-ui/lab';


const useStyles = makeStyles((theme: Theme) => ({
  root: {
    flexGrow: 1,
    backgroundColor: theme.palette.background.paper,
  },
}));

export default function LabTabs() {
  const classes = useStyles();
  const [value, setValue] = React.useState('1');

  const handleChange = (event: React.ChangeEvent<{}>, newValue: string) => {
    setValue(newValue);
  };

  return (
    <div className={classes.root}>
      <TabContext value={value}>
        {["股票","美股","港股","黄精","白井","利润"].map((item,index)=>{
          return <Tab label={item} onClick={()=>setValue(`${index+1}`)}/>
        })}
        <TabPanel value="1">Item 股票</TabPanel>
        <TabPanel value="2">Item 美股</TabPanel>
        <TabPanel value="3">Item 港股</TabPanel>
        <TabPanel value="4">Item 黄精</TabPanel>
        <TabPanel value="5">Item 白井</TabPanel>
        <TabPanel value="6">Item 利润</TabPanel>
      </TabContext>
    </div>
  );
}
