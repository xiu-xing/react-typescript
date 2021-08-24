import { TextField } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { Magnify } from "mdi-material-ui";
import React, { useMemo, useState } from "react";
import { SearchConditionInputCommonProps } from ".";
import { NextOperator } from "../../../../generated/graphql";
import { first } from "../../../../utils/tools";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      width: 337,
      "& .MuiInputBase-root": {
        fontSize: 14,
        paddingLeft: 12,
      },
      "& .MuiOutlinedInput-input": {
        padding: "6px 8px",
        height: 24,
      },
      "& .MuiOutlinedInput-notchedOutline": {
        borderColor: "#EEE",
      },
    },
  }),
);

// eslint-disable-next-line @typescript-eslint/no-empty-interface
interface InputProps extends SearchConditionInputCommonProps {}

const Input: React.FC<InputProps> = (props) => {
  const classes = useStyles();
  const { config, onChange, value } = props;
  const inputConfig = config.input.input_type_config;
  const [input, setInput] = useState<string>("");
  const defaultOperator = useMemo(() => first(config.input.operators), [config]);

  const selectedKeys = useMemo(() => {
    return value?.options.map((o) => o?.id ?? "") ?? [];
  }, [value]);

  const clearInput = () => setInput("");

  return (
    <TextField
      className={classes.root}
      variant="outlined"
      value={input}
      onChange={(e) => setInput(e.target.value)}
      placeholder={inputConfig.placeholder}
      InputProps={{
        startAdornment: <Magnify style={{ color: "#CCC" }} />,
      }}
      onKeyDown={(e) => {
        if (e.key === "Enter" && !!input) {
          const index = selectedKeys.findIndex((s) => s === input);
          if (!~index) {
            onChange?.({
              id: config.id,
              name: config.name,
              type: config.input.input_type,
              operator: {
                name: defaultOperator.name,
                operator: defaultOperator.operator,
              },
              options: [
                ...(value?.options ?? []),
                {
                  id: input,
                  name: input,
                  operator: NextOperator.IncludesAny,
                  values: [input],
                },
              ],
            });

            clearInput();
          }
        }
      }}
    />
  );
};

export default Input;
