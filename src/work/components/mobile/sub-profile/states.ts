import { atom, useAtom } from "jotai";
import { EntityInput, EntityType, FilterInputs, SubProfile } from "../../../generated/graphql";

export const subProfileAtom = atom<SubProfile | undefined>(undefined);
export const subProfileEntityAtom = atom<EntityInput>({
  entityId: "",
  entityType: EntityType.Organization,
});
export const subProfileEntityNameAtom = atom<string | undefined>(undefined);

export const subProfileTabActiveIndexAtom = atom<number>(0);
export const filterInputs = atom<FilterInputs>({});
export const useFilterInputs = () => useAtom(filterInputs);

export const countMapAtom = atom<Map<string, number>>(new Map());

export const bottomSheepOpenAtom = atom<boolean>(false);

export const outsideNameFormatterAtom = atom((get) => {
  const filters = get(subProfileAtom)?.filters;

  if (!filters) {
    return null;
  }

  let formatter = "";
  let id = "";
  filters?.map((f) => {
    if (f?.__typename == "SelectorFilter" && f.outsideNameFormatter) {
      formatter = f.outsideNameFormatter;
      id = f?.id ?? "";
    }
  });

  return { "formatter": formatter, "id": id };
});

export const showNumberOfFiltersAtom = atom((get) => {
  const filters = get(subProfileAtom)?.filters;

  if (!filters) {
    return null;
  }

  let showNumberOfFilters = false;
  filters?.map((f) => {
    if (f?.__typename == "SelectorFilter" && f.showNumberOfFilters) {
      showNumberOfFilters = f.showNumberOfFilters;
    }
  });

  return showNumberOfFilters;
});

export const filterInputCountAtom = atom((get) => {
  let count = 0;
  const filterInput = get(filterInputs);

  if (!filterInput) {
    return 0;
  }

  if (filterInput.selectorFilterInputs) {
    count += filterInput.selectorFilterInputs?.length;
  }
  return count;
});
