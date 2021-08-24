import { CircularProgress, createStyles, makeStyles } from "@material-ui/core";
import React, { ReactNode, useEffect } from "react";
import { ModalType } from "../../../../../models/modal/modal";
import { OverviewLayout } from "../../../modal/layout";
import EntityLayout from "./components/layouts/entity_layout";
import ModalContainer from "./modalContainer";

const useStyles = makeStyles(() =>
  createStyles({
    loadingContainer: {
      padding: 8,
    },
  }),
);

const ModalDisplay: React.FunctionComponent = () => {
  const classes = useStyles();
  const modalContainer = ModalContainer.useContainer();

  // 根据 ModalType 选择不同的布局
  function chooseLayout(): ReactNode {
    switch (modalContainer.modal.type) {
      case ModalType.ProfileOverview:
        return <OverviewLayout modalData={modalContainer.modalData} />;
      case ModalType.Entity:
        return <EntityLayout />;
      default:
        return null;
    }
  }

  useEffect(() => {
    if (modalContainer.modal.args.length) {
      modalContainer.executeModalDataQuery();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  function contentComponent(): ReactNode {
    if (modalContainer.fetching) {
      return (
        <div className={classes.loadingContainer}>
          <CircularProgress color="primary" thickness={2.8} size={30} />
        </div>
      );
    }
    return chooseLayout();
  }

  return <>{contentComponent()}</>;
};

export default ModalDisplay;
