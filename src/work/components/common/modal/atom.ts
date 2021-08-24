import { atom, useAtom } from "jotai";

export const modalOpenAtom = atom(false);
export const modalDataAtom = atom<Map<string, unknown> | null>(null);
export const fetchingAtom = atom(false);

export const useModalOpen = () => useAtom(modalOpenAtom);

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
export const useModalData = () => useAtom(modalDataAtom);

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
export const useFetching = () => useAtom(fetchingAtom);
