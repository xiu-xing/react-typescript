import React, { ReactNode, useMemo } from "react";
import { EntityInput } from "../../../../generated/graphql";
import PaginationBar from "../../pagination-bar";

interface CommonGridPaginationBarProps {
  suffix?: ReactNode;
  prefix?: ReactNode;
  page: number;
  pageSize: number;
  totalCount: number;
  setPage: React.Dispatch<React.SetStateAction<number>>;
  setUseQueryEndCursor: React.Dispatch<React.SetStateAction<string | null>>;
  hasNextPage: boolean | undefined;
  fetching: boolean;
  setTimelineEntity?: React.Dispatch<React.SetStateAction<EntityInput | undefined>>;
}

const CommonGridPaginationBar: React.FunctionComponent<CommonGridPaginationBarProps> = (props) => {
  const {
    suffix,
    prefix,
    page,
    pageSize,
    totalCount,
    setPage,
    setUseQueryEndCursor,
    hasNextPage,
    fetching,
    setTimelineEntity,
  } = props;

  const disableBackwardButtonMemo = useMemo(() => {
    if (fetching) {
      return true;
    }
    return undefined;
  }, [fetching]);

  const disableForwardButtonMemo = useMemo(() => {
    if (fetching) {
      return true;
    }
    if (hasNextPage == undefined || hasNextPage) {
      return undefined;
    }
    return true;
  }, [fetching, hasNextPage]);

  const onClickPreviousPage = () => {
    const newPage = page - 2;
    const end = newPage ? newPage * pageSize - 1 : null;
    setPage((prev) => {
      return prev - 1;
    });

    setUseQueryEndCursor(end ? btoa(end.toString()) : null);
  };

  const onClickNextPage = () => {
    const end = page * pageSize - 1;
    setPage((prev) => {
      return prev + 1;
    });

    setUseQueryEndCursor(btoa(end.toString()));
  };

  const onPageChanged = (page: number) => {
    if (page === 1) {
      setTimelineEntity && setTimelineEntity(undefined);
      setUseQueryEndCursor(null);
    } else {
      const end = (page - 1) * pageSize - 1;
      setTimelineEntity && setTimelineEntity(undefined);
      setPage(page - 1);
      setUseQueryEndCursor(btoa(end.toString()));
    }
  };

  return (
    <PaginationBar
      count={totalCount}
      pageSize={pageSize}
      page={page}
      onClickNextPage={onClickNextPage}
      onClickPreviousPage={onClickPreviousPage}
      onPageChanged={onPageChanged}
      prefix={prefix}
      suffix={suffix}
      disableBackwardButton={disableBackwardButtonMemo}
      disableForwardButton={disableForwardButtonMemo}
    />
  );
};

export default CommonGridPaginationBar;
