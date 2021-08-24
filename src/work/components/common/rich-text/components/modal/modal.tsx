import { Popover } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import _ from "lodash";
import React, { ReactNode, useEffect, useRef, useState } from "react";
import { ModalModel } from "../../../../../models/modal/modal";
import ModalDisplay from "./modal-display";
import ModalContainer from "./modalContainer";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      display: "inline",
    },
    paper: {
      minWidth: 260,
      maxWidth: 560,
      pointerEvents: "auto",
    },
    popover: {
      pointerEvents: "none",
    },
  }),
);

type OriginDirectionType = "left" | "right";

interface ModalProps {
  children: ReactNode;
  modal: ModalModel;
}

const Modal: React.FunctionComponent<ModalProps> = (props) => {
  const classes = useStyles();
  const modalAnchorRef = useRef<HTMLDivElement | null>(null);
  const [modalOriginDirection, setModalOriginDirection] = useState<OriginDirectionType>("right");
  const { popoverAnchorRef, setModalOpen: setModalOpen, modalOpen: modalOpen } = ModalContainer.useContainer();

  // 防抖动,同时延迟 300 毫秒显示浮窗
  const openModal = _.debounce((event) => {
    if (event.pageX > document.documentElement.clientWidth * 0.5) {
      setModalOriginDirection("left");
    }
    setModalOpen(true);
  }, 300);

  function onMouseEnter(event: React.MouseEvent<HTMLDivElement, MouseEvent>): void {
    event.persist();

    openModal(event);
  }

  function onMouseLeave(): void {
    setModalOpen(false);
    openModal.cancel();
  }

  function onPopoverClose(): void {
    setModalOpen(false);
  }

  function scrollHandler(event: Event): void {
    if (event.target === document) {
      setModalOpen(false);
    }
  }

  useEffect(() => {
    window.addEventListener("scroll", scrollHandler);
    return (): void => {
      window.removeEventListener("scroll", scrollHandler);
      openModal.cancel();
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return (
    <div ref={modalAnchorRef} className={classes.root} onMouseEnter={onMouseEnter} onMouseLeave={onMouseLeave}>
      {props.children}
      <Popover
        className={classes.popover}
        classes={{
          paper: classes.paper,
        }}
        hideBackdrop
        disableScrollLock
        disableRestoreFocus
        anchorEl={modalAnchorRef.current}
        anchorOrigin={{
          vertical: "top",
          horizontal: modalOriginDirection,
        }}
        transformOrigin={{
          vertical: "top",
          horizontal: modalOriginDirection === "right" ? "left" : "right",
        }}
        action={popoverAnchorRef}
        open={modalOpen}
        onClose={onPopoverClose}
        // keepMounted
      >
        <ModalDisplay />
      </Popover>
    </div>
  );
};

export default Modal;
