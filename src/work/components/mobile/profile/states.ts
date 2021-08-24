import { atom, useAtom } from "jotai";
import { AppProfile, EntityInput, Permission } from "../../../generated/graphql";
import { getFrequencyLimit, getLockLimit, getPaginationLimit } from "../../../utils/permission";

export const profileAtom = atom<AppProfile | undefined>(undefined);
export const profileEntityAtom = atom<EntityInput | undefined>(undefined);
export const profilePermissions = atom<Permission[] | undefined>(undefined);

const lock = atom((get) => {
  const permissions = get(profilePermissions);

  if (!permissions || permissions.length <= 0) return false;

  if (getFrequencyLimit(permissions) || getPaginationLimit(permissions)) return true;

  if (getLockLimit(permissions)) return true;

  return false;
});

export const useProfileLock = () => useAtom(lock);
