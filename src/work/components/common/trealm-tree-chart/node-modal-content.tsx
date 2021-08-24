import { CircularProgress, Paper } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { useEffect, useState } from "react";
import { useClient } from "urql";
import { EntityType, OverviewModalDocument } from "../../../generated/graphql";
import { ModalModel, ModalType } from "../../../models/modal/modal-next";
import { OverviewLayout } from "../modal/layout";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      padding: 8,
      minWidth: 140,
      display: "flex",
      alignItems: "center",
      justifyItems: "center",
      width: "fit-content",
    },
  }),
);

interface NodeModalContentProps {
  modal: ModalModel;
  activated?: boolean;
}

const NodeModalContent: React.FunctionComponent<NodeModalContentProps> = (props) => {
  const classes = useStyles();
  const { modal, activated } = props;
  const client = useClient();
  const [fetching, setFetching] = useState(true);
  const [modalData, setModalData] = useState<Map<string, unknown>>();

  function executeModalDataQuery() {
    setFetching(true);
    switch (modal.type) {
      case ModalType.ProfileOverview: {
        client
          .query(OverviewModalDocument, {
            entityID: modal.args["entity_id"],
            entityType: modal.args["entity_type"] as EntityType,
            modalID: modal.args["modal_id"],
          })
          .toPromise()
          .then((res) => {
            setFetching(false);
            if (res.data && res.data.overviewModal) {
              const dataMap: Map<string, unknown> = new Map(Object.entries(res.data.overviewModal));
              setModalData(dataMap);
            }
          });
        break;
      }
    }
  }

  useEffect(() => {
    if (activated) {
      executeModalDataQuery();
    }
  }, [modal, activated]);

  const layout = () => {
    switch (modal.type) {
      case ModalType.ProfileOverview:
        return <OverviewLayout modalData={modalData} />;
      default:
        return <></>;
    }
  };

  return <Paper className={classes.root}>{fetching ? <CircularProgress size={30} /> : layout()}</Paper>;
};

export default NodeModalContent;
