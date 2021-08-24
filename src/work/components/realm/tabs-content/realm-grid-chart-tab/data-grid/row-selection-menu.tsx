import { Button, ButtonBase, Popover, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import {
  ChevronDownBoxOutline,
  MinusBoxMultipleOutline,
  MinusBoxOutline,
  PlusBoxMultipleOutline,
  PlusBoxOutline,
} from "mdi-material-ui";
import React, { useEffect, useRef, useState } from "react";
import { useRealmSheetQuery } from "../../../../../generated/graphql";
import CommonGridContainer from "../../../../common/common-grid-components/grid/container";
import AdvancedSearchContainer from "../../../container";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    checkBoxMenu: {
      fontSize: 25,
      color: "#666",
    },
    buttonBox: {
      padding: "8px 0",
    },
    button: {
      display: "flex",
      width: "100%",
      padding: "6px 16px",
      justifyContent: "flex-start",
    },
    line: {
      borderTop: "1px solid rgb(224, 224, 224)",
    },
    icon: {
      color: "#666",
    },
    title: {
      paddingLeft: 4,
      color: "#666",
    },
  }),
);

interface RowSelectionMenuProps {
  id: string;
  onSelectedPageSections: () => void;
  onDeselectedPageSections: () => void;
}

const RowSelectionMenu: React.FunctionComponent<RowSelectionMenuProps> = (props) => {
  const classes = useStyles();
  const { id, onSelectedPageSections, onDeselectedPageSections } = props;
  const { realm, conditions, template } = AdvancedSearchContainer.useContainer();
  const { setRowSelections, sortColumns } = CommonGridContainer.useContainer();
  const [rowSelectionMenuOpen, setRowSelectionMenuOpen] = useState(false);
  const rowSelectionMenuButtonRef = useRef<HTMLButtonElement>(null);

  const [realmSheetResult, realmSheetQuery] = useRealmSheetQuery({
    variables: {
      realmID: realm,
      sheetID: id,
      columnIDs: [],
      conditions: conditions,
      orderColumns: sortColumns,
      first: 1000,
      templateID: template?.id,
    },
    requestPolicy: "network-only",
    pause: true,
  });

  useEffect(() => {
    if (realmSheetResult.fetching) return;

    const data = realmSheetResult.data?.realmSheet?.nodes;

    if (data) {
      const IDs = data.map((item) => {
        const id = {
          entityId: item?.entityID,
          entityType: item?.entityType,
        };

        return JSON.stringify(id);
      });

      setRowSelections(IDs);
    }
  }, [realmSheetResult]);

  const defaultSelectionOperationText = [
    {
      title: "选择页面结果",
      icon: <PlusBoxOutline className={classes.icon} />,
      onclick: onSelectedPageSections,
    },
    {
      title: "选择前一千条",
      icon: <PlusBoxMultipleOutline className={classes.icon} />,
      onclick: () => {
        realmSheetQuery();
      },
    },
    {
      title: "取消选择页面结果",
      icon: <MinusBoxOutline className={classes.icon} />,
      onclick: onDeselectedPageSections,
    },
    {
      title: "取消选择所有结果",
      icon: <MinusBoxMultipleOutline className={classes.icon} />,
      onclick: () => {
        setRowSelections([]);
      },
    },
  ];

  return (
    <>
      <Button ref={rowSelectionMenuButtonRef} onClick={() => setRowSelectionMenuOpen(true)}>
        <ChevronDownBoxOutline className={classes.checkBoxMenu} />
      </Button>
      <Popover
        open={rowSelectionMenuOpen}
        anchorEl={rowSelectionMenuButtonRef.current}
        onClose={() => setRowSelectionMenuOpen(false)}
        anchorOrigin={{
          vertical: "bottom",
          horizontal: "center",
        }}
        transformOrigin={{
          vertical: "top",
          horizontal: "center",
        }}
      >
        <div className={classes.buttonBox}>
          {defaultSelectionOperationText.map((item, index) => (
            <ButtonBase
              key={item.title}
              onClick={() => {
                item.onclick();
                setRowSelectionMenuOpen(false);
              }}
              className={clsx(classes.button, index === 2 && classes.line)}
            >
              {item.icon}
              <Typography className={classes.title}>{item.title}</Typography>
            </ButtonBase>
          ))}
        </div>
      </Popover>
    </>
  );
};

export default RowSelectionMenu;
