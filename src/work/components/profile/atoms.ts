import { atom, useAtom } from "jotai";
import { EntityType, WebProfile } from "../../generated/graphql";

export const profileEntityAtom = atom({
  id: "",
  name: "",
  type: EntityType.Organization,
});

export const tabIndexAtom = atom<string>("");

export const sectionIndexAtom = atom<string>("");

export const profileDataAtom = atom<WebProfile | undefined>(undefined);

export const activatedTabAtom = atom((get) => {
  const tabs = get(profileDataAtom)?.tabs;
  const tabId = get(tabIndexAtom);

  if (!tabs || tabId === "") {
    return null;
  }

  const index = tabs.findIndex((t) => t?.id === tabId);

  return tabs[index];
});

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
export const useProfileEntity = () => useAtom(profileEntityAtom);

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
export const useTabIndex = () => useAtom(tabIndexAtom);

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
export const useSectionIndex = () => useAtom(sectionIndexAtom);

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
export const useProfileData = () => useAtom(profileDataAtom);
