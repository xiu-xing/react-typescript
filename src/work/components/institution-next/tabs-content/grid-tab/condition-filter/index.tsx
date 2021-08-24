import { Box, Button } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { CloseCircleOutline } from "mdi-material-ui";
import React, { useState } from "react";
import { withAlphaHex } from "with-alpha-hex";
import ConditionDialog from "../../../../common/condition-dialog";
import { Config } from "../../../../common/condition-dialog/types";
import ConfigSelectFilterArea from "../../../../common/config-select-filter-area";
import InstitutionGridTabContainer from "../container";
import SearchConditionInputIcon from "./search-condition-input-icon";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    customButton: {
      cursor: "pointer",
      fontSize: 14,
      lineHeight: "24px",
      color: "#333",
      fontWeight: theme.typography.fontWeightRegular,
      "&:hover": {
        borderColor: withAlphaHex("#000", 0.87),
      },
      "& :first-child": {
        marginRight: 4,
      },
    },
    button: {
      whiteSpace: "pre",
    },
  }),
);

interface ConditionFilterProps {
  conditionConfigs: Config;
}

const ConditionFilter: React.FunctionComponent<ConditionFilterProps> = (props) => {
  const classes = useStyles();
  const { conditionConfigs } = props;
  const { conditions, setConditions, updateCondition, updateConditions } = InstitutionGridTabContainer.useContainer();
  const [showConditionDialog, setShowConditionDialog] = useState(false);

  function openDialog() {
    setShowConditionDialog(true);
  }
  function closeDialog() {
    setShowConditionDialog(false);
  }

  return (
    <div className={classes.root}>
      <ConfigSelectFilterArea
        conditions={conditions}
        conditionConfigs={conditionConfigs}
        moreOptionButton
        onSelectChange={updateCondition}
        onMoreOptionClick={openDialog}
        suffix={
          <>
            <Box
              display="inline-flex"
              alignItems="center"
              className={classes.customButton}
              onClick={openDialog}
              border="1px solid #EEE"
              padding="5px 15px"
              borderRadius="4px"
            >
              <SearchConditionInputIcon type="FILTER" />
              全部筛选
            </Box>
            {conditions?.length !== 0 && (
              <Button
                className={classes.button}
                variant="outlined"
                color="primary"
                startIcon={<CloseCircleOutline />}
                disabled={conditions?.length === 0}
                onClick={() => setConditions([])}
              >
                清除
              </Button>
            )}
          </>
        }
      />
      {conditionConfigs && (
        <ConditionDialog
          config={conditionConfigs}
          conditions={conditions}
          closeDialog={closeDialog}
          showConditionDialog={showConditionDialog}
          updateConditions={updateConditions}
        />
      )}
    </div>
  );
};

export default ConditionFilter;
