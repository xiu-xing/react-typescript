import { Box, Chip, Typography } from "@material-ui/core";
import { createStyles, darken, makeStyles, Theme } from "@material-ui/core/styles";
import React from "react";
import { NextOperator, NextSearchConditionInput } from "../../generated/graphql";
import Space from "../common/space";
import AdvancedSearchContainer from "./container";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      maxHeight: 192,
      padding: "0 24px",
      overflowY: "auto",
      overflowX: "hidden",
    },
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

const RealmConditionArea: React.FC = () => {
  const classes = useStyles();
  const { conditions, updateCondition, computedConditionsConfigMap } = AdvancedSearchContainer.useContainer();

  const operator = (operator: NextOperator) => {
    switch (operator) {
      case NextOperator.IncludesAll:
        return <>and</>;
      case NextOperator.IncludesAny:
        return <>or</>;
      default:
        break;
    }
  };

  const split = (condition: NextSearchConditionInput) => {
    if (computedConditionsConfigMap.get(condition.id)?.mutiOperator) return operator(condition.operator.operator);
  };

  return conditions.length > 0 ? (
    <>
      <Box height={8} />
      <Space className={classes.root} wrap size={["large", "middle"]}>
        {conditions.map((c) => (
          <Box key={c.id} display="grid" alignItems="center" gridTemplateColumns="max-content 1fr" gridColumnGap="16px">
            <Typography noWrap className={classes.title}>
              {c.name}
              {computedConditionsConfigMap.get(c.id)?.mutiOperator && c.options.length > 1 && `（${c.operator.name}）`}
            </Typography>
            <Space wrap>
              {c.options.map((o) => (
                <Chip
                  key={o?.id}
                  label={o?.name}
                  className={classes.chip}
                  onDelete={() => {
                    updateCondition({
                      ...c,
                      options: [...c.options.filter((option) => option?.id !== o?.id)],
                    });
                  }}
                />
              ))}
            </Space>
          </Box>
        ))}
      </Space>
      <Box height={8} />
    </>
  ) : null;
};

export default RealmConditionArea;
