import React, { FunctionComponent, useEffect } from "react";
import UserContainer from "../../../../../../../containers/userContainer";
import { useUpdateUserInfoMutation } from "../../../../../../../generated/graphql";
import { parseError } from "../../../../../../../utils/error";
import CommonInputDialog from "../../../../../../common/dialog/common-input-dialog";
import SnackbarContainer from "../../../../../../common/snackbar/snackbarContainer";

interface ChangeNicknameDialogProps {
  open: boolean;
  setOpen: (open: boolean) => void;
}

const ChangeNicknameDialog: FunctionComponent<ChangeNicknameDialogProps> = ({ open, setOpen }) => {
  const { openSnackbar } = SnackbarContainer.useContainer();
  const [updateUserNameMutationResult, executeUpdateUserNameMutation] = useUpdateUserInfoMutation();
  const { user, setUser } = UserContainer.useContainer();

  useEffect(() => {
    if (updateUserNameMutationResult.error) {
      const { message } = parseError(updateUserNameMutationResult.error, { message: "修改失败" });
      openSnackbar(message, "error");
      return;
    }
    if (updateUserNameMutationResult.data?.updateUserInfo && !updateUserNameMutationResult.fetching) {
      setUser(updateUserNameMutationResult.data?.updateUserInfo);
      openSnackbar("修改成功", "default");
      setOpen(false);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [updateUserNameMutationResult]);

  // eslint-disable-next-line @typescript-eslint/explicit-function-return-type
  function checkNickname(name: string): boolean {
    if (name === "") {
      openSnackbar("昵称不能为空", "warning");
      return false;
    }
    if (name.trim() == user?.userName) {
      openSnackbar("输入不能与原来相同", "warning");
      return false;
    }

    return true;
  }

  return (
    <CommonInputDialog
      open={open}
      autoFocus
      dialogTitle={"修改昵称"}
      textFieldTitle="昵称"
      defaultName={user?.userName ?? ""}
      handleClose={(): void => setOpen(false)}
      handleConfirm={(newName): void => {
        if (checkNickname(newName)) {
          executeUpdateUserNameMutation({
            input: {
              userName: newName.trim(),
            },
          });
        }
      }}
    />
  );
};

export default ChangeNicknameDialog;
