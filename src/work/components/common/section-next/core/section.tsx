import { Box } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import React from "react";
import { Filter, Footnote, Maybe, Permission } from "../../../../generated/graphql";
import { getLockLimit } from "../../../../utils/permission";
import FilterItem, { FilterInputType } from "../../filter-item";
import Space from "../../space";
import Footnotes from "../components/footnotes";

const useStyles = makeStyles(() =>
  createStyles({
    filters: {
      margin: "16px 0",
    },
    onData: {
      width: "100%",
      minHeight: 100,
      fontSize: 16,
      color: "#666",
      display: "grid",
      placeItems: "center",
    },
    blur: {
      filter: "blur(4px)",
      userSelect: "none",
    },
  }),
);

interface SectionWrapperProps {
  filters?: Filter[] | null;
  filtersOnChange: (value: FilterInputType) => void;
  footnotes?: Footnote[] | null;
  permissions?: Maybe<Permission[]>;
}

const SectionWrapper: React.FunctionComponent<SectionWrapperProps> = (props) => {
  const classes = useStyles();
  const { filters, filtersOnChange, footnotes, permissions } = props;

  return (
    <Box className={clsx({ [classes.blur]: getLockLimit(permissions) })}>
      {filters && (
        <div className={classes.filters}>
          <Space size="middle" wrap>
            {filters.map((f, i) => (
              <FilterItem key={i} filter={f} onChange={filtersOnChange} />
            ))}
          </Space>
        </div>
      )}
      {props.children}
      {footnotes && footnotes.length > 0 ? <Footnotes footnotes={footnotes} /> : null}
    </Box>
  );
};

export default SectionWrapper;
