import { PopoverActions } from "@material-ui/core";
import { useRef, useState } from "react";
import { createContainer } from "unstated-next";
import { useClient } from "urql";
import {
  EntityType,
  LegacyEntityType,
  ModalDataDocument,
  ModalDataQuery,
  ModalDataQueryVariables,
  OverviewModalDocument,
  OverviewModalQuery,
  OverviewModalQueryVariables,
} from "../../../../../generated/graphql";
import { ModalModel } from "../../../../../models/modal/modal";
import { ModalType } from "../../../../../models/modal/modal";

interface ModalInitialState {
  modal: ModalModel;
}

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
function useModal(initialState: ModalInitialState = { modal: new ModalModel() }) {
  const [modalOpen, setModalOpen] = useState(false);
  const [modal] = useState(initialState.modal);
  const [dataId, setDataId] = useState("");
  const [modalData, setModalData] = useState<Map<string, unknown> | null>(null);
  const popoverAnchorRef = useRef<PopoverActions | null>(null);
  const [fetching, setFetching] = useState(false);
  // const [modalDataQueryResult, executeModalDataQuery] = useModalDataQuery({
  //   variables: {
  //     entityID: modal.args[0],
  //     entityType: modal.args[1] as EntityType,
  //     modalID: modal.args[2],
  //   },
  //   pause: true,
  // });

  const client = useClient();
  function executeModalDataQuery(): void {
    setFetching(true);
    if (modal.type === ModalType.ProfileOverview) {
      client
        .query<OverviewModalQuery, OverviewModalQueryVariables>(OverviewModalDocument, {
          entityID: modal.args[0],
          entityType: modal.args[1] as EntityType,
        })
        .toPromise()
        .then((res) => {
          setFetching(false);
          if (res.data && res.data.overviewModal) {
            if (res.data && res.data.overviewModal) {
              const dataMap: Map<string, unknown> = new Map(Object.entries(res.data.overviewModal));
              setModalData(dataMap);
            }
          }
        });
    } else {
      client
        .query<ModalDataQuery, ModalDataQueryVariables>(ModalDataDocument, {
          entityID: modal.args[0],
          entityType: modal.args[1] as LegacyEntityType,
          modalID: modal.args[2],
        })
        .toPromise()
        .then((res) => {
          setFetching(false);
          if (res.data && res.data.modalData) {
            const newDataId = res.data.modalData.dataID;
            newDataId && setDataId(newDataId);
            const dataJSONString = res.data.modalData.data;
            if (dataJSONString) {
              const dataJSON = JSON.parse(dataJSONString);

              const dataMap: Map<string, unknown> = new Map(Object.entries(dataJSON));
              setModalData(dataMap);
            }
          }
        });
    }
  }

  // useEffect(() => {
  //   if (modalDataQueryResult.data && modalDataQueryResult.data.modalData) {
  //     const newDataId = modalDataQueryResult.data.modalData.dataID;
  //     newDataId && setDataId(newDataId);
  //     const dataJSONString = modalDataQueryResult.data.modalData.data;
  //     if (dataJSONString) {
  //       const dataJSON = JSON.parse(dataJSONString);

  //       const dataMap: Map<string, unknown> = new Map(Object.entries(dataJSON));
  //       setModalData(dataMap);
  //     }
  //   }
  //   // eslint-disable-next-line @typescript-eslint/no-empty-function
  //   return (): void => {};
  // }, [modalDataQueryResult]);

  return {
    modalOpen,
    setModalOpen,
    popoverAnchorRef,
    modal,
    dataId,
    setDataId,
    modalData,
    setModalData,
    // modalDataQueryResult,
    executeModalDataQuery,
    fetching,
  };
}

const ModalContainer = createContainer(useModal);
export default ModalContainer;
