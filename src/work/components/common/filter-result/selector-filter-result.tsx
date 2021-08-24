import { Box, Chip, darken, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { ReactNode } from "react";
import { SelectorConditionInput } from "../filter-condition-context";
import Space from "../space";
import { FilterResultItemCommonProps } from "./filter-result-item";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    title: {
      fontSize: 14,
      color: "#666",
      lineHeight: "24px",
    },
    chip: {
      color: "#333",
      fontSize: 14,
      borderRadius: 20,
      lineHeight: "24px",
      backgroundColor: "#E9EDF3",
      "& .MuiChip-label": {
        paddingRight: 0,
      },
      "& .MuiChip-deleteIcon": {
        width: 20,
        height: 20,
        margin: "0 12px 0 2px",
        color: theme.palette.primary.main,
      },
      "& .MuiChip-deleteIcon:hover": {
        color: darken(theme.palette.primary.main, 0.2),
      },
      "&:focus": {
        backgroundColor: darken("#E9EDF3", 0.2),
      },
    },
  }),
);

interface SelectorFilterResultProps extends FilterResultItemCommonProps {
  input?: SelectorConditionInput;
}

const SelectorFilterResult: React.FunctionComponent<SelectorFilterResultProps> = (props) => {
  const classes = useStyles();

  const { input, onDelete } = props;

  function chipNodes(input: SelectorConditionInput): ReactNode {
    return (
      <Chip
        label={input.filterValue?.key}
        className={classes.chip}
        onDelete={() => {
          onDelete(
            {
              ...input,
              filterValue: undefined,
              type: "Selector",
            },
            true,
          );
        }}
      />
    );
  }

  function contentComponent(): ReactNode {
    if (!input || !input.filterValue) {
      return null;
    }
    return (
      <Box
        key={input.filterID || ""}
        display="grid"
        alignItems="center"
        gridTemplateColumns="max-content 1fr"
        gridColumnGap="16px"
      >
        <Typography noWrap className={classes.title}>
          {input.filterName}
        </Typography>
        <Space wrap size={[16, 8]}>
          {chipNodes(input)}
        </Space>
      </Box>
    );
  }

  return <>{contentComponent()}</>;
};

export default SelectorFilterResult;
