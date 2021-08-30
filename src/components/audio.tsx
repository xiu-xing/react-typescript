import { Box, createStyles, makeStyles, Theme } from "@material-ui/core";
import Slider from "@material-ui/core/Slider";
import React from "react";
import Typography from "@material-ui/core/Typography";
import { Play, Pause } from "mdi-material-ui";
import { useEffect, useRef, useState } from "react";
import Restart from "../icons/Restart";
import Forward from "../icons/Forward";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "flex",
      alignItems: "center",
    },
    slider: {
      width: "400px",
      margin: "0 20px",
    },
    switch: {
      width: "24px",
      height: "24px",
      borderRadius: "50%",
      margin: "0 14px",
      color: theme.palette.primary.main,
      backgroundColor: "rgba(79, 112, 155, 0.12)",
    },
    icon: {
      color: theme.palette.primary.main,
    },
    currentTime: {
      fontSize: 14,
      color: "#666666",
      marginLeft: "25px",
    },
    time: {
      fontSize: 14,
      color: "#666666",
    },
  })
);

const Audio: React.FunctionComponent<{ videoId?: string }> = (props) => {
  const classes = useStyles();
  const [value, setValue] = useState<number | string | Array<number | string>>(
    0
  );
  const [on_off, setOnOff] = useState<boolean>(false);
  const rootRef = useRef<HTMLAudioElement | null>(null);
  const [allTime, setAllTime] = useState<string>("00:00");
  const [currentTime, setCurrentTime] = useState<string>("00:00");
  const [time,setTime] = useState<number>(0);
  const [t,setT] = useState<number>(0);

  const handleSliderChange = (
    event: React.ChangeEvent<{}>,
    newValue: number | number[]
  ) => {
    if (
      rootRef.current?.currentTime !== undefined &&
      typeof newValue === "number"
    ) {
      rootRef.current.currentTime =
        (newValue / 100) * rootRef.current?.duration;
    }
    setValue(newValue);
  };

  function audioPlay() {
    setOnOff((on_off) => !on_off);
    if (!on_off) {
      rootRef.current?.play();
    } else {
      rootRef.current?.pause();
    }
  }

  function audioGo() {
    if (
      rootRef.current?.currentTime !== undefined &&
      typeof value === "number"
    ) {
      rootRef.current.currentTime += 10;
      const newValue: number =
        (rootRef.current?.currentTime / rootRef.current?.duration) * 100;
      setValue(newValue);
    }
  }

  function audioBack() {
    if (
      rootRef.current?.currentTime !== undefined &&
      typeof value === "number"
    ) {
      rootRef.current.currentTime -= 10;
      const newValue: number =
        (rootRef.current?.currentTime / rootRef.current?.duration) * 100;
      setValue(newValue);
    }
  }

  function canplay() {
    if (rootRef.current?.duration) {
      const allTime =
        (Math.floor(rootRef.current?.duration / 60) + "").padStart(2, "0") +
        ":" +
        (Math.floor(rootRef.current?.duration % 60) + "").padStart(2, "0");
      setAllTime(allTime);
    }
  }

  function timeUpdate() {
    setT(t=>t+1);
  }

  useEffect(() => {
    rootRef.current?.addEventListener("canplay", canplay);
    rootRef.current?.addEventListener("timeupdate", timeUpdate);
    return () => {
      rootRef.current?.removeEventListener("canplay", canplay);
      rootRef.current?.removeEventListener("timeupdate", timeUpdate);
    };
  }, []);

  useEffect(()=>{
    if (rootRef.current?.currentTime) {
      
      const newValue =
        (rootRef.current?.currentTime / rootRef.current?.duration) * 100;
        if (rootRef.current?.currentTime-time>1) {
      console.log("111111111111111111",rootRef.current?.currentTime,time,rootRef.current?.currentTime-time>2,value);

          setValue(newValue);
          setTime(rootRef.current?.currentTime);
        }
      const newCurrentTime =
        (Math.floor(rootRef.current?.currentTime / 60) + "").padStart(2, "0") +
        ":" +
        (Math.floor(rootRef.current?.currentTime % 60) + "").padStart(2, "0");
      setCurrentTime(newCurrentTime);
    }
  },[t])

  return (
    <Box className={classes.root}>
      <Restart onClick={audioBack} className={classes.icon} />
      {!on_off && <Play onClick={audioPlay} className={classes.switch} />}
      {on_off && <Pause onClick={audioPlay} className={classes.switch} />}
      <Forward onClick={audioGo} className={classes.icon} />
      <Typography className={classes.currentTime}>{currentTime}</Typography>
      <Slider
        className={classes.slider}
        value={typeof value === "number" ? value : 0}
        onChange={handleSliderChange}
        aria-labelledby="input-slider"
      />
      <Typography className={classes.time}>{allTime}</Typography>
      <audio
        loop
        ref={rootRef}
        src="https://winsights.com.cn//Wins.Expert.H5/api/link/insight/stream/1756314784"
      />
    </Box>
  );
};
export default Audio;
