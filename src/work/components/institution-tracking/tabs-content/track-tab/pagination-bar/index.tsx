import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { ReactNode } from "react";
import CommonGridPaginationBar from "../../../../common/common-grid-components/grid-pagination-bar";
import CommonGridContainer from "../../../../common/common-grid-components/grid/container";
import InstitutionTrackGridTabContainer from "../container";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      height: "max-content",
      borderBottom: "1px solid #e0e0e0",
      padding: "10px 16px 12px",
    },
  }),
);

interface InstitutionTrackGridPaginationBarProps {
  suffix?: ReactNode;
  prefix?: ReactNode;
}

const InstitutionTrackGridPaginationBar: React.FunctionComponent<InstitutionTrackGridPaginationBarProps> = (props) => {
  const classes = useStyles();
  const { setTimelineEntity } = InstitutionTrackGridTabContainer.useContainer();
  const { page, pageSize, totalCount, setPage, setUseQueryEndCursor, hasNextPage, fetching } =
    CommonGridContainer.useContainer();

  const { suffix, prefix } = props;

  return (
    <div className={classes.root}>
      <CommonGridPaginationBar
        prefix={prefix}
        suffix={suffix}
        totalCount={totalCount}
        pageSize={pageSize}
        page={page}
        setPage={setPage}
        setUseQueryEndCursor={setUseQueryEndCursor}
        hasNextPage={hasNextPage}
        fetching={fetching}
        setTimelineEntity={setTimelineEntity}
      />
    </div>
  );
};

export default InstitutionTrackGridPaginationBar;
