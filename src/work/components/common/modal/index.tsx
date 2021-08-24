import { CircularProgress, Paper } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import Tippy from "@tippyjs/react";
import clsx from "clsx";
import React, { ReactNode, useEffect } from "react";
import { useClient } from "urql";
import {
  ChartDocument,
  EntityType,
  FilterInputs,
  ModalDocument,
  OverviewModalDocument,
} from "../../../generated/graphql";
import { ModalModel, ModalType } from "../../../models/modal/modal-next";
import InstitutionTrackGridTabContainer from "../../institution-tracking/tabs-content/track-tab/container";
import TrackGridTabContainer from "../../track/tabs-content/track-tab/container";
import { useFetching, useModalData, useModalOpen } from "./atom";
import { DirectLayout, EntityLayout, OverviewLayout } from "./layout";
import ChartLayout from "./layout/chart";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      display: "inline-flex !important",
      verticalAlign: "middle",
    },
    paper: {
      minWidth: 140,
      maxWidth: 560,
      pointerEvents: "auto",
    },
    popover: {
      pointerEvents: "none",
      "&:focus": {
        outline: 0,
      },
    },
    loadingContainer: {
      padding: 8,
    },
  }),
);

interface ModalProps {
  children: ReactNode;
  modal: ModalModel;
  className?: string;
}

const Modal: React.FunctionComponent<ModalProps> = (props) => {
  const classes = useStyles();
  const { modal } = props;
  const [modalOpen, setModalOpen] = useModalOpen();
  const [fetching, setFetching] = useFetching();
  const [, setModalData] = useModalData();

  let chartFilter: FilterInputs | undefined;

  try {
    const { gridFilters } = TrackGridTabContainer.useContainer();
    chartFilter = {};
    chartFilter.dateRangeSelectorFilterInput = gridFilters?.dateRangeSelectorFilterInput;
  } catch (error) {}

  try {
    const { gridFilterInputs } = InstitutionTrackGridTabContainer.useContainer();
    chartFilter = gridFilterInputs;
  } catch (error) {}

  function onMouseEnter(): void {
    setModalOpen(true);
  }

  function onMouseLeave(): void {
    setModalOpen(false);
  }

  function scrollHandler(event: Event): void {
    if (event.target === document) {
      setModalOpen(false);
    }
  }

  const client = useClient();
  function executeModalDataQuery(): void {
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
      case ModalType.Entities: {
        client
          .query(ModalDocument, {
            entityID: modal.args["entity_id"],
            entityType: modal.args["entity_type"] as EntityType,
            modalID: modal.args["modal_id"],
          })
          .toPromise()
          .then((res) => {
            setFetching(false);
            if (res.data && res.data.modal) {
              const dataMap: Map<string, unknown> = new Map(Object.entries(res.data.modal));
              setModalData(dataMap);
            }
          });
        break;
      }
      case ModalType.Chart: {
        client
          .query(ChartDocument, {
            chartID: modal.args["chart_id"],
            entityID: modal.args["entity_id"],
            entityType: modal.args["entity_type"] as EntityType,
            origin: modal.args["origin"],
            filters: chartFilter,
          })
          .toPromise()
          .then((res) => {
            setFetching(false);
            if (res.data && res.data.chart) {
              const dataMap: Map<string, unknown> = new Map(Object.entries(res.data.chart));
              setModalData(dataMap);
            }
          });
        break;
      }
      case ModalType.Direct: {
        setFetching(false);
      }
    }
  }

  useEffect(() => {
    window.addEventListener("scroll", scrollHandler);
    return (): void => {
      window.removeEventListener("scroll", scrollHandler);
      setModalOpen(false);
      // openModal.cancel();
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  useEffect(() => {
    if (modal.type && modal.args && modalOpen) {
      executeModalDataQuery();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [modalOpen]);

  function layout(): ReactNode {
    switch (modal.type) {
      case ModalType.ProfileOverview:
        return <OverviewLayout />;
      case ModalType.Entities:
        return <EntityLayout />;
      case ModalType.Direct:
        return <DirectLayout arg={modal.args} />;
      case ModalType.Chart:
        return <ChartLayout args={modal.args} />;
      default:
        return null;
    }
  }

  function contentComponent(): ReactNode {
    if (fetching) {
      return (
        <div className={classes.loadingContainer}>
          <CircularProgress color="primary" thickness={2.8} size={30} />
        </div>
      );
    }
    return layout();
  }

  return (
    <Tippy
      className={classes.popover}
      delay={[300, 0]}
      interactive
      maxWidth={560}
      appendTo={document.body}
      content={<Paper className={classes.paper}>{contentComponent()}</Paper>}
      placement="right"
      popperOptions={{
        strategy: "fixed",
        modifiers: [
          {
            name: "preventOverflow",
            enabled: true,
          },
        ],
      }}
    >
      <div className={clsx(classes.root, props.className)} onMouseEnter={onMouseEnter} onMouseLeave={onMouseLeave}>
        {props.children}
      </div>
    </Tippy>
  );
};

export default Modal;
