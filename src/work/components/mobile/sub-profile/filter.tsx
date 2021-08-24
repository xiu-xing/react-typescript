import { Box, ButtonBase, Dialog, DialogContent, IconButton, Slide, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { TransitionProps } from "@material-ui/core/transitions";
import clsx from "clsx";
import { useAtom } from "jotai";
import { Tune } from "mdi-material-ui";
import React, { useCallback, useEffect, useMemo, useState } from "react";
import { Filter as FilterModel, FilterInputs } from "../../../generated/graphql";
import { getMobileDefaultFilterInputs } from "../../../utils/hooks";
import FilterInput, { FilterInputType } from "../common/filter";
import { bottomSheepOpenAtom, useFilterInputs } from "./states";

const Transition = React.forwardRef(function Transition(
  props: TransitionProps & { children?: React.ReactElement<any, any> },
  ref: React.Ref<unknown>,
) {
  return <Slide direction="up" ref={ref} {...props} />;
});

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      margin: "0 16px",
      "& .MuiSvgIcon-root": {
        width: "1.25rem",
        height: "1.25rem",
      },
    },
    title: {
      fontWeight: theme.typography.fontWeightMedium,
    },
    dialog: {
      "& .MuiDialog-container": {
        paddingTop: "30%",
      },
    },
    dialogContent: {
      position: "relative",
    },
    button: {
      padding: 12,
      fontSize: 16,
      fontWeight: theme.typography.fontWeightMedium,
    },
    a6: {
      color: "#A6A6A6",
    },
    bgPrimary: {
      background: theme.palette.primary.main,
    },
    white: {
      color: "#fff",
    },
    bgWhite: {
      background: "#fff",
    },
    borderTop: {
      borderTop: "1px solid #EEE",
    },
  }),
);

interface FilterProps {
  filters: FilterModel[];
}

const Filter: React.FC<FilterProps> = (props) => {
  const classes = useStyles();
  const { filters } = props;
  // const [open, setOpen] = useState(false);
  const [open, setOpen] = useAtom(bottomSheepOpenAtom);
  const [filterInputs, setFilterInputs] = useFilterInputs();
  const defaultFilterInputs = useMemo(() => getMobileDefaultFilterInputs(filters), [filters]);
  const [bufferedFilterInputs, setBufferedFilterInputs] = useState<FilterInputs>(defaultFilterInputs);

  useEffect(() => {
    setFilterInputs(defaultFilterInputs);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  useEffect(() => {
    if (open) {
      setBufferedFilterInputs({ ...filterInputs });
    }
  }, [filterInputs, open]);

  const reset = () => setBufferedFilterInputs(defaultFilterInputs);

  const handleFilterItemOnChange = (value: FilterInputType) => {
    switch (value.type) {
      case "DateFilterInput":
        {
          delete value.type;
          setBufferedFilterInputs((prev) => ({
            ...prev,
            dateFilterInputs: [...(prev.dateFilterInputs ?? []).filter((f) => f?.filterID !== value.filterID), value],
          }));
        }
        break;
      case "MultiSelectorFilterInput":
        {
          delete value.type;
          setBufferedFilterInputs((prev) => ({
            ...prev,
            multiSelectorFilterInputs: [
              ...(prev.multiSelectorFilterInputs ?? []).filter((f) => f?.filterID !== value.filterID),
              value,
            ],
          }));
        }

        break;
      case "SelectorFilterInput":
        {
          delete value.type;
          setBufferedFilterInputs((prev) => ({
            ...prev,
            selectorFilterInputs: [
              ...(prev.selectorFilterInputs ?? []).filter((f) => f?.filterID !== value.filterID),
              value,
            ],
          }));
        }
        break;
      case "CheckboxFilterInput":
        {
          delete value.type;
          setBufferedFilterInputs((prev) => ({
            ...prev,
            checkboxFilterInputs: [
              ...(prev.checkboxFilterInputs ?? []).filter((f) => f?.filterID !== value.filterID),
              value,
            ],
          }));
        }
        break;
      case "DateRangeFilterInput":
        {
          delete value.type;
          setBufferedFilterInputs((prev) => ({
            ...prev,
            dateRangeFilterInputs: [...(prev.dateRangeFilterInputs ?? []).filter((f) => f?.id !== value.id), value],
          }));
        }
        break;
      case "DateRangeSelectorFilterInput": {
        delete value.type;
        setBufferedFilterInputs((prev) => ({
          ...prev,
          dateRangeSelectorFilterInput: [
            ...(prev.dateRangeSelectorFilterInput ?? []).filter((f) => f?.filterID !== value.filterID),
            value,
          ],
        }));
      }
    }
  };

  const getValue = useCallback(
    (id: string, type: FilterModel["__typename"]): FilterInputType | undefined => {
      switch (type) {
        case "SelectorFilter":
          {
            const s =
              bufferedFilterInputs.selectorFilterInputs?.[
                bufferedFilterInputs.selectorFilterInputs?.findIndex((f) => f?.filterID === id)
              ];
            if (s)
              return {
                type: "SelectorFilterInput",
                ...s,
              };
          }
          break;
        //TODO
        case "CheckboxFilter":
        case "DateRangeFilter":
        case "DateRangeSelectorFilter":
          {
            const d =
              bufferedFilterInputs.dateRangeSelectorFilterInput?.[
                bufferedFilterInputs.dateRangeSelectorFilterInput?.findIndex((f) => f?.filterID === id)
              ];
            if (d)
              return {
                type: "DateRangeSelectorFilterInput",
                ...d,
              };
          }
          break;
        case "DayFilter":
        case "MonthFilter":
        case "YearFilter":
        case "NestedCheckboxFilter":
        default:
          break;
      }
    },
    [bufferedFilterInputs],
  );

  return (
    <>
      <IconButton className={classes.root} size="small" color="primary" onClick={() => setOpen((prev) => !prev)}>
        <Tune />
      </IconButton>
      <Dialog
        className={classes.dialog}
        fullScreen
        fullWidth
        open={open}
        onClose={() => setOpen(false)}
        TransitionComponent={Transition}
        // BackdropProps={{
        //   //Issue https://github.com/mui-org/material-ui/issues/5750
        //   onTouchMove: (event) => {
        //     let target: HTMLElement | null = event.target as HTMLDivElement;
        //     while (target != null && target !== document.body) {
        //       const scrollHeight: number = target.scrollHeight;
        //       const clientHeight: number = target.clientHeight;
        //       if (scrollHeight > clientHeight) {
        //         return;
        //       }
        //       target = target.parentElement;
        //     }
        //     event.preventDefault();
        //   },
        // }}
      >
        <DialogContent className={classes.dialogContent}>
          <Typography className={classes.title}>筛选</Typography>
          <Box height={16} />
          {filters.length > 0 &&
            filters.map((f) => (
              <FilterInput
                key={f.id as string}
                filter={f}
                value={getValue(f.id as string, f.__typename)}
                onChange={handleFilterItemOnChange}
                style={{ marginBottom: 32 }}
              />
            ))}
        </DialogContent>
        <Box width={1} display="grid" gridTemplateColumns="repeat(2,1fr)">
          <ButtonBase className={clsx(classes.button, classes.a6, classes.bgWhite, classes.borderTop)} onClick={reset}>
            重置
          </ButtonBase>
          <ButtonBase
            className={clsx(classes.button, classes.bgPrimary, classes.white)}
            color="primary"
            onClick={() => {
              setOpen(false);
              setFilterInputs(bufferedFilterInputs);
            }}
          >
            确定
          </ButtonBase>
        </Box>
      </Dialog>
    </>
  );
};

export default Filter;
