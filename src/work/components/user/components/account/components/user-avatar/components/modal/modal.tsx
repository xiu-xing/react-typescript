import { FormControl, FormLabel, TextField } from "@material-ui/core";
import { makeStyles } from "@material-ui/core/styles";
import React from "react";
import { useForm } from "react-hook-form";
import { useSingleUploadMutation } from "../../../../../../../../generated/graphql";
import SnackbarContainer from "../../../../../../../common/snackbar/snackbarContainer";
import UserContainer from "../../../../../../userContainer";
import Dialog from "../../../../../dialog";
import UserAvatarContainer from "../../user-avatar-container";
import Avatar from "./components/avatar/avatar";

const useStyles = makeStyles({
  dialogBox: {
    display: "grid",
    gridAutoFlow: "row",
    gridRowGap: 20,
    padding: "16px 24px 20px",
  },
  formControl: {
    display: "grid",
    gridAutoFlow: "row",
    padding: "10px 0px 0px 0px",
  },
  inputTitle: {
    fontSize: "14px",
    fontWeight: 400,
    color: "rgba(102, 102, 102, 1)",
  },
});

const Modal: React.FunctionComponent = () => {
  const classes = useStyles();
  const {
    dialogType: dialogIndex,
    setDialogType: setDialogIndex,
    executeUserQuery,
    user,
  } = UserContainer.useContainer();
  const { register, errors, handleSubmit } = useForm({
    reValidateMode: "onBlur",
    mode: "onBlur",
  });
  // const [updateUserInfomationMutationResult, executeUpdateUserInfomationMutation] = useUpdateUserInfomationMutation();
  const { openSnackbar } = SnackbarContainer.useContainer();
  const {
    company,
    radioValue,
    file,
    setFile,
    setFileErrorStatus,
    setCompany,
    setRadioValue,
  } = UserAvatarContainer.useContainer();
  const [, executeSingleUploadMutation] = useSingleUploadMutation();

  async function onSubmit(data: Record<string, string>): Promise<void> {
    // var fileURL = null;
    if (file) {
      // fileURL = await executeSingleUploadMutation({
      //   file: file,
      //   fileType: FileType.Avatar,
      // }).then((result) => {
      //   return _.get(result, "data.singleUpload");
      // });
      // if (!fileURL) {
      //   openSnackbar("头像上传失败，请重新上传！", "error");
      //   return;
      // }
    } else {
      setFileErrorStatus(true);
    }
    if (company === "") {
      return;
    }
    // executeUpdateUserInfomationMutation({
    //   input: {
    //     userName: data.name,
    //     company: company || "",
    //     position: data.position,
    //     identity: radioValue || "",
    //     avatar: fileURL,
    //   },
    // }).then(() => {
    //   // handleCloseDialog();
    //   executeUserQuery();
    // });
  }

  // useEffect(() => {
  //   if (updateUserInfomationMutationResult.data) {
  //     const result = _.get(updateUserInfomationMutationResult, "data.saveUserAuthentication");
  //     if (result) {
  //       openSnackbar("提交成功", "success");
  //       return;
  //     }
  //   }
  //   if (updateUserInfomationMutationResult.error) {
  //     openSnackbar("提交失败，请重新提交！", "error");
  //     return;
  //   }
  //   // eslint-disable-next-line react-hooks/exhaustive-deps
  // }, [updateUserInfomationMutationResult]);

  function handleCloseDialog() {
    setDialogIndex("none");
    setFile(null);
    setCompany("");
    setRadioValue("");
  }

  return (
    <Dialog
      open={dialogIndex === "avatar"}
      onClose={(): void => {
        handleCloseDialog();
      }}
      onConfirm={(): void => {
        handleSubmit(onSubmit)();
      }}
      title="编辑个人信息"
      confirm
      width="sm"
    >
      <form className={classes.dialogBox}>
        <Avatar />
        <FormControl className={classes.formControl} component="fieldset">
          <FormLabel className={classes.inputTitle} focused={false} component="legend">
            姓名
          </FormLabel>
          <TextField
            defaultValue={user?.userName}
            name="name"
            inputRef={register({
              required: { value: true, message: "请输入姓名" },
            })}
            size="medium"
            color="primary"
            placeholder="姓名"
            error={Boolean(errors.name)}
            helperText={errors.name ? errors.name["message"] : ""}
          />
        </FormControl>
        {/* <Company company={user?.userName} /> */}
        <FormControl className={classes.formControl} component="fieldset">
          <FormLabel className={classes.inputTitle} focused={false} component="legend">
            职位
          </FormLabel>
          {/* <TextField
            defaultValue={user?.position}
            name="position"
            inputRef={register({
              required: { value: true, message: "请输入职位" },
            })}
            size="medium"
            color="primary"
            placeholder="职位"
            error={Boolean(errors.position)}
            helperText={errors.position ? errors.position["message"] : ""}
          /> */}
        </FormControl>
        {/* <Profession identity={user?.identity} /> */}
      </form>
    </Dialog>
  );
};

export default Modal;
