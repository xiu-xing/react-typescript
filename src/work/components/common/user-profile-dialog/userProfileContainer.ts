import { useState, useEffect } from "react";
import { createContainer } from "unstated-next";
// import { ReviewType, useSearchReviewProgressQuery, SearchReviewProgressDocument } from "../../../generated/graphql";
import { useClient } from "urql";

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
function useUserProfile() {
  const [processStatus, setProcessStatus] = useState("loading");

  const client = useClient();
  // function executeSearchReviewProgressQuery(): void {
  //   client
  //     .query(SearchReviewProgressDocument, {
  //       reviewType: ReviewType.UserInfoCollection,
  //     })
  //     .toPromise()
  //     .then((res) => {
  //       if (res.data) {
  //         const status = res.data.searchReviewProgress;

  //         if (status) {
  //           setProcessStatus(status);
  //           return;
  //         }
  //       }
  //       if (res.error) {
  //         setProcessStatus("error");
  //       }
  //     });
  // }

  // const [searchReviewProgressQueryResult, executeSearchReviewProgressQuery] = useSearchReviewProgressQuery({
  //   variables: {
  //     reviewType: ReviewType.UserInfoCollection,
  //   },
  //   pause: true,
  //   requestPolicy: "network-only",
  // });

  // useEffect(() => {
  //   if (searchReviewProgressQueryResult.data) {
  //     const status = searchReviewProgressQueryResult.data.searchReviewProgress;

  //     if (status) {
  //       setProcessStatus(status);
  //       return;
  //     }
  //   }
  //   if (searchReviewProgressQueryResult.error) {
  //     setProcessStatus("error");
  //   }
  //   // eslint-disable-next-line react-hooks/exhaustive-deps
  // }, [searchReviewProgressQueryResult]);

  return {
    processStatus,
    setProcessStatus,
    // searchReviewProgressQueryResult,
    // executeSearchReviewProgressQuery,
  };
}

const UserProfileContainer = createContainer(useUserProfile);
export default UserProfileContainer;
