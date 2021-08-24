import { Button, CircularProgress, fade, Paper, TextField, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { Add } from "@material-ui/icons";
import { useClient as useMuseClient } from "@momentum-valley/muse-js";
import Tippy from "@tippyjs/react";
import { Check, Magnify } from "mdi-material-ui";
import React, { useEffect, useMemo, useRef, useState } from "react";
import SimpleBar from "simplebar-react";
import { OperationResult, useClient } from "urql";
import {
  EntityType,
  EntityWithNameInput,
  TrealmImportType,
  TrealmSuggestion,
  TrealmSuggestionsDocument,
  TrealmSuggestionsQuery,
  TrealmSuggestionsQueryVariables,
  useTrealmDeleteEntitiesMutation,
  useTrealmEntityImportMutation,
} from "../../../../../../generated/graphql";
import CommonGridContainer from "../../../../../common/common-grid-components/grid/container";
import SnackbarContainer from "../../../../../common/snackbar/snackbarContainer";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      width: 186,
      "& .MuiInputBase-root": {
        height: 32,
        fontSize: 14,
        paddingLeft: 12,
        borderRadius: 4,
        backgroundColor: "#F5F6F9",
      },
      "& .MuiOutlinedInput-input": {
        padding: "6px 8px",
        height: 24,
      },
      "& .MuiInputBase-root::before": {
        content: "none",
      },
      "& .MuiInputBase-root::after": {
        content: "none",
      },
    },
    paper: {
      minWidth: 186,
      paddingTop: 8,
    },
    noSuggestion: {
      color: "#999",
      fontSize: 16,
      fontWeight: 500,
      textAlign: "center",
    },
    suggestionButton: {
      width: "100%",
      display: "flex",
      justifyContent: "space-between",
      padding: "6px 10px 6px 16px",
    },
    suggestionIcon: {
      color: "#666",
      fontSize: 24,
    },
    suggestionText: {
      fontSize: 14,
      color: "#333",
      maxWidth: 112,
      textOverflow: "ellipsis",
      whiteSpace: "nowrap",
      overflow: "hidden",
    },
    addButton: {
      width: "100%",
      height: 34,
      backgroundColor: fade(theme.palette.primary.main, 0.04),
    },
    addText: {
      textAlign: "center",
      color: theme.palette.primary.main,
      fontSize: 12,
      fontWeight: 500,
      padding: "9px 0",
    },
  }),
);

interface SuggestionsSearchInputProps {
  importType: TrealmImportType;
}

const SuggestionsSearchInput: React.FunctionComponent<SuggestionsSearchInputProps> = ({ importType }) => {
  const classes = useStyles();
  const client = useClient();
  const { setRowSelections, setUpdateGridRow } = CommonGridContainer.useContainer();
  const muse = useMuseClient();
  const { openSnackbar } = SnackbarContainer.useContainer();

  const [inputValue, setInputValue] = useState("");
  const [open, setOpen] = useState(false);
  const [fetching, setFetching] = useState(true);
  const [suggestions, setSuggestions] = useState<TrealmSuggestion[]>([]);
  const [isTrackedList, setIsTrackedList] = useState<string[]>([]);
  const [addTrackList, setAddTrackList] = useState<EntityWithNameInput[]>([]);
  const [unTrackList, setUnTrackList] = useState<string[]>([]);

  const [, executeTrealmEntityImportMutation] = useTrealmEntityImportMutation();
  const [, executeTrealmDeleteEntitiesMutation] = useTrealmDeleteEntitiesMutation();

  const getSuggestions = () => {
    client
      .query<TrealmSuggestionsQuery, TrealmSuggestionsQueryVariables>(
        TrealmSuggestionsDocument,
        {
          importType: importType,
          keyword: inputValue,
          first: 50,
        },
        {
          requestPolicy: "network-only",
        },
      )
      .toPromise()
      .then((res) => {
        const data = res.data?.trealmSuggestions?.nodes;
        const list = (data ?? []) as TrealmSuggestion[];
        const isExistList: string[] = [];
        list.forEach((item) => item.isExist && isExistList.push(item.entityID));

        setIsTrackedList(isExistList);
        return setSuggestions(list);
      })
      .finally(() => {
        setFetching(false);
      });
  };

  const suggestionClick = (item: TrealmSuggestion) => {
    if (unTrackList.includes(item.entityID)) return setUnTrackList((prev) => prev.filter((id) => id !== item.entityID));

    if (addTrackList.some((i) => i.entityId === item.entityID))
      return setAddTrackList((prev) => prev.filter((i) => i.entityId !== item.entityID));

    const isTracked = isTrackedList.includes(item.entityID);

    if (isTracked) {
      const newUnTrackList = [...unTrackList, item.entityID ?? ""];
      return setUnTrackList(newUnTrackList);
    }

    const newAddTrackList = [
      ...addTrackList,
      { entityId: item.entityID, entityType: item.entityType ?? EntityType.Organization, entityName: item.primaryName },
    ];
    setAddTrackList(newAddTrackList);
    return;
  };

  const inputLock = useRef(false);

  useEffect(() => {
    const inputLockInterval = setInterval(() => {
      inputLock.current = false;
    }, 500);
    return () => {
      clearInterval(inputLockInterval);
    };
  }, []);

  useEffect(() => {
    if (inputLock.current == true) {
      return;
    }
    if (!inputValue || inputValue.length <= 1) {
      setOpen(false);
      setSuggestions([]);
      inputLock.current = true;
      return;
    }

    setFetching(true);
    setOpen(true);
    getSuggestions();
    inputLock.current = true;
  }, [inputValue]);

  const apply = () => {
    const promiseList: Promise<OperationResult>[] = [];
    const musePromises: Promise<void>[] = [];
    if (addTrackList.length > 0) {
      const addPromise = executeTrealmEntityImportMutation({
        input: { importType: importType, entities: addTrackList },
      });
      promiseList.push(addPromise);
      musePromises.push(
        muse.sendTrackingEvent("trealm.import_entities", {
          "import_type": importType.toString(),
          "import_entities": addTrackList.map((item) => ({
            id: item.entityId,
            type: item.entityType,
          })),
        }),
      );
    }

    if (unTrackList.length > 0) {
      const unTrackPromise = executeTrealmDeleteEntitiesMutation({
        input: {
          importType: importType,
          entityIDs: unTrackList,
        },
      });
      promiseList.push(unTrackPromise);
      musePromises.push(
        muse.sendTrackingEvent("trealm.delete_entities", {
          "import_type": importType.toString(),
          "delete_entities": unTrackList,
        }),
      );
    }

    if (promiseList.length > 0) {
      Promise.all(promiseList).then((res) => {
        if (res.some((item) => item.error)) return openSnackbar("操作失败", "error");

        setUnTrackList([]);
        setIsTrackedList([]);
        setAddTrackList([]);
        setRowSelections([]);
        setInputValue("");
        setUpdateGridRow((prev) => !prev);
        openSnackbar("操作成功", "success");
      });

      Promise.all(musePromises);
    }

    return setInputValue("");
  };

  const getIcon = (item: TrealmSuggestion) => {
    if (item.entityID && unTrackList.includes(item.entityID)) return <Add color="primary" />;

    if (addTrackList.some((i) => i.entityId === item.entityID) || isTrackedList.includes(item.entityID)) {
      return <Check color="primary" />;
    }

    return <Add color="primary" />;
  };

  const tippyContentComponent = useMemo(() => {
    if (suggestions.length === 0) return <Typography className={classes.noSuggestion}>无建议</Typography>;

    return (
      <>
        <SimpleBar style={{ maxHeight: 200 }}>
          {suggestions.map((item) => (
            <Button key={item.entityID} className={classes.suggestionButton} onClick={() => suggestionClick(item)}>
              <Typography className={classes.suggestionText}>{item.primaryName}</Typography>
              {getIcon(item)}
            </Button>
          ))}
          {fetching && (
            <div style={{ justifyContent: "center", textAlign: "center", height: 40 }}>
              <CircularProgress size={30} />
            </div>
          )}
        </SimpleBar>
        <Button className={classes.addButton} onClick={apply}>
          <Typography className={classes.addText}>确认</Typography>
        </Button>
      </>
    );
  }, [fetching, suggestions, isTrackedList, addTrackList, unTrackList]);

  return (
    <>
      <Tippy
        visible={open}
        content={<Paper className={classes.paper}>{tippyContentComponent}</Paper>}
        interactive
        offset={[0, 0]}
        duration={0}
        placement="bottom"
        appendTo={document.body}
        popperOptions={{
          strategy: "fixed",
          modifiers: [
            {
              name: "preventOverflow",
              enabled: true,
            },
          ],
        }}
        onClickOutside={() => {
          setInputValue("");
          setAddTrackList([]);
          setUnTrackList([]);
        }}
      >
        <TextField
          className={classes.root}
          value={inputValue}
          onChange={(e) => {
            setInputValue(e.target.value);
          }}
          InputProps={{
            startAdornment: <Magnify style={{ color: "#CCC" }} />,
          }}
          placeholder={"快速添加"}
        />
      </Tippy>
    </>
  );
};

export default SuggestionsSearchInput;
