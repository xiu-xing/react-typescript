import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { ReactNode } from "react";
import CommonGridPaginationBar from "../../../../common/common-grid-components/grid-pagination-bar";
import CommonGridContainer from "../../../../common/common-grid-components/grid/container";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      height: "max-content",
      padding: "8px 16px 4px",
      borderBottom: "1px solid #e0e0e0",
    },
  }),
);

interface GridPaginationBarProps {
  suffix: ReactNode;
  prefix: ReactNode;
}

const GridPaginationBar: React.FunctionComponent<GridPaginationBarProps> = (props) => {
  const classes = useStyles();
  const { suffix, prefix } = props;
  const { page, pageSize, totalCount, setPage, setUseQueryEndCursor, hasNextPage, fetching } =
    CommonGridContainer.useContainer();

  return (
    <div className={classes.root}>
      <CommonGridPaginationBar
        prefix={prefix}
        suffix={suffix}
        page={page}
        pageSize={pageSize}
        totalCount={totalCount}
        setPage={setPage}
        setUseQueryEndCursor={setUseQueryEndCursor}
        hasNextPage={hasNextPage}
        fetching={fetching}
      />
    </div>
  );
};

export default GridPaginationBar;
