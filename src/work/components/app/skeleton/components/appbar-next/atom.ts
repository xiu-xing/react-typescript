import { atom, useAtom } from "jotai";

export const keywordAtom = atom<string>("");
export const focusedAtom = atom<boolean>(false);
export const currentTabIdAtom = atom<string>("0");
export const animationEndAtom = atom<boolean>(false);

export const useKeyword = () => useAtom(keywordAtom);
export const useFocused = () => useAtom(focusedAtom);
export const useCurrentTabId = () => useAtom(currentTabIdAtom);
export const useAnimationEnd = () => useAtom(animationEndAtom);
