import { TextField } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { Magnify } from "mdi-material-ui";
import React, { useEffect, useRef, useState } from "react";
import { useClient } from "urql";
import CommonGridContainer from "../../../../../common/common-grid-components/grid/container";
import InstitutionTrackGridTabContainer from "../../container";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      width: 186,
      "& .MuiInputBase-root": {
        height: 32,
        fontSize: 14,
        paddingLeft: 12,
        borderRadius: 4,
        backgroundColor: "#F5F6F9",
      },
      "& .MuiOutlinedInput-input": {
        padding: "6px 8px",
        height: 24,
      },
      "& .MuiInputBase-root::before": {
        content: "none",
      },
      "& .MuiInputBase-root::after": {
        content: "none",
      },
    },
  }),
);

const TrackSearchInput: React.FunctionComponent = () => {
  const classes = useStyles();
  const client = useClient();
  const { setGridFilterInputs, gridFilterInputs } = InstitutionTrackGridTabContainer.useContainer();
  const { setUseQueryEndCursor, setPage } = CommonGridContainer.useContainer();

  const [inputValue, setInputValue] = useState("");
  const timer = useRef();
  const [count, setCount] = useState(0);

  useEffect(() => {
    if (inputValue === "" && gridFilterInputs?.keywordFilterInput) {
      setPage(1);
      setUseQueryEndCursor(null);
      setGridFilterInputs((prev) => ({ ...prev, keywordFilterInput: undefined }));
      return;
    }

    if (!inputValue) return;
    setPage(1);
    setUseQueryEndCursor(null);
    setGridFilterInputs((prev) => {
      const newFilter = {
        ...prev,
        keywordFilterInput: {
          keywords: [inputValue],
        },
      };
      return newFilter;
    });
  }, [count]);

  return (
    <>
      <TextField
        className={classes.root}
        value={inputValue}
        onChange={(e) => {
          clearTimeout(timer.current);
          timer.current = setTimeout(() => {
            setCount((pre) => pre + 1);
          }, 1000) as any;
          setInputValue(e.target.value);
        }}
        onKeyDown={(e) => {
          if (e.keyCode === 13) {
            clearTimeout(timer.current);
            setCount((pre) => pre + 1);
          }
        }}
        InputProps={{
          startAdornment: <Magnify style={{ color: "#CCC" }} />,
        }}
        placeholder={"请输入关键字搜索"}
      />
    </>
  );
};

export default TrackSearchInput;
