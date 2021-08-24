import { Box, Button, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import _ from "lodash";
import { DropzoneArea } from "material-ui-dropzone";
import React, { useState } from "react";
import { useForm } from "react-hook-form";
import * as yup from "yup";
import UserContainer from "../../../../containers/userContainer";
import { useSingleUploadMutation } from "../../../../generated/graphql";
import { REGEX } from "../../../../utils/regex";
import SnackbarContainer from "../../snackbar/snackbarContainer";
import CardPNG from "../assets/card.png";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    notCommitContent: {
      padding: 32,
    },
    title: {
      color: "#333",
      fontSize: 20,
      fontWeight: 500,
      lineHeight: "26px",
    },
    subtitle: {
      fontSize: 18,
      color: "#666",
      marginTop: 8,
    },
    formBox: {
      marginTop: 24,
      display: "grid",
      gridRowGap: 16,
    },
    label: {
      fontSize: 16,
      color: "#A6A6A6",
    },
    buttonBox: {
      width: "100%",
      marginTop: 32,
      textAlign: "right",
    },
    button: {
      fontSize: 14,
    },
    dropzone: {
      marginTop: 12,
      width: 299,
      height: 168,
      minHeight: 168,
      border: "none",
      borderRadius: 0,
      backgroundImage: `url(${CardPNG})`,
      backgroundRepeat: "no-repeat",
      backgroundSize: "cover",
      "&:focus": {
        outline: "none",
      },
      overflow: "hidden",
    },
    dropzoneActive: {
      animation: "none !important",
    },
    dropzoneIcon: {
      display: "none",
    },
    previewContainer: {
      width: "100%",
      height: "100%",
      alignItems: "center",
      margin: "-24px 0 0 0",
    },
    previewItem: {
      maxWidth: "100%",
      height: "100%",
      flexBasis: "auto",
      padding: "0 !important",
      "& img": {
        height: "100%",
      },
      "& button": {
        minHeight: 24,
        height: 24,
        width: 24,
        top: 8,
        right: 8,
      },
    },
    previewImage: {
      borderRadius: 0,
      height: "100%",
    },
    selectRoot: {
      width: "100%",
      height: 36,
      fontSize: 14,
      paddingLeft: 12,
      borderRadius: 4,
      backgroundColor: "rgba(248,248,248,1)",
      "&:before,&:after": {
        display: "none",
      },
    },
    select: {
      "&:focus": {
        backgroundColor: "rgba(248,248,248,1)",
      },
    },
    selectOption: {
      fontSize: 14,
    },
    errorText: {
      marginLeft: 8,
      fontSize: 12,
      color: "#DC004E",
    },
    helpText: {
      fontSize: 12,
      // color: "#999",
      padding: "0 12px",
    },
  }),
);

const InputValidationSchema = yup.object().shape({
  name: yup.string().required("请输入真实姓名"),
  company: yup.string().required("请输入所在公司名称"),
  position: yup.string().required("请输入所在公司任职职位"),
  phone: yup
    .string()
    .trim()
    .required("请输入手机号")
    .test("phone", "请输入正确的手机号", (value) => REGEX.phone.test(value)),
  wechat: yup.string().trim().required("请输入微信号"),
  email: yup.string().trim().required("请输入公司邮箱").email("请输入正确的邮箱"),
  profession: yup.string().required("请选择身份"),
  brief: yup.string().trim().required("请填写个人简介"),
  // card: yup.array().required("请上传名片"),
});

const Professions = [
  {
    name: "创业者",
    value: "创业者",
  },
  {
    name: "投资人",
    value: "投资人",
  },
  {
    name: "FA",
    value: "FA",
  },
  {
    name: "高管",
    value: "高管",
  },
  {
    name: "职员",
    value: "职员",
  },
  {
    name: "媒体从业者",
    value: "媒体从业者",
  },
  {
    name: "专家",
    value: "专家",
  },
  {
    name: "区块链从业者",
    value: "区块链从业者",
  },
  {
    name: "学生",
    value: "学生",
  },
  {
    name: "其他",
    value: "其他",
  },
];

const FormContent: React.FunctionComponent<{}> = () => {
  const classes = useStyles();

  const userContainer = UserContainer.useContainer();
  const { openSnackbar } = SnackbarContainer.useContainer();
  // const { executeSearchReviewProgressQuery } = UserProfileContainer.useContainer();
  const user = userContainer.user;

  // const [name] = useState(user?.userName);
  // const [company] = useState(user?.company);
  // const [position] = useState(user?.position);
  // const [phone] = useState(user?.phone);
  const [wechat] = useState("");
  // const [email] = useState(user?.email);
  const [profession] = useState("");
  const [brief] = useState("");
  const [files, setFiles] = useState<Array<File>>([]);

  const [fileErrorStatus, setFileErrorStatus] = useState(false);

  // const [
  //   saveUserAuthenticationMutationResult,
  //   executeSaveUserAuthenticationMutation,
  // ] = useSaveUserAuthenticationMutation();
  const [, executeSingleUploadMutation] = useSingleUploadMutation();

  const { register, errors, handleSubmit, control } = useForm({
    validationSchema: InputValidationSchema,
  });

  // const fields = [
  //   {
  //     id: "name",
  //     name: "真实姓名",
  //     value: name,
  //   },
  //   {
  //     id: "company",
  //     name: "所在公司",
  //     value: company,
  //   },
  //   {
  //     id: "position",
  //     name: "公司职位",
  //     value: position,
  //   },
  //   {
  //     id: "phone",
  //     name: "手机号码",
  //     value: phone,
  //   },
  //   {
  //     id: "wechat",
  //     name: "微信号码",
  //     value: wechat,
  //   },
  //   {
  //     id: "email",
  //     name: "公司邮箱",
  //     value: email,
  //   },
  //   {
  //     type: "selector",
  //     id: "profession",
  //     name: "身份",
  //     value: profession,
  //     defaultValue: "创业者",
  //   },
  //   {
  //     id: "brief",
  //     name: "个人简介",
  //     value: brief,
  //     props: {
  //       multiline: true,
  //       rows: 2,
  //     },
  //   },
  // ];

  async function onSubmit(data: Record<string, string>): Promise<void> {
    if (files && files.length) {
      const fileURL = await executeSingleUploadMutation({
        file: files[0],
        // fileType: FileType.BusinessCard,
      }).then((result) => {
        return _.get(result, "data.singleUpload");
      });

      if (!fileURL) {
        openSnackbar("名片上传失败，请重新上传！", "error");
        return;
      }

      // executeSaveUserAuthenticationMutation({
      //   input: {
      //     userName: data.name as string,
      //     company: data.company as string,
      //     position: data.position as string,
      //     phone: data.phone as string,
      //     weChat: data.wechat as string,
      //     companyEmail: data.email as string,
      //     identity: data.profession as string,
      //     personalProfile: data.brief as string,
      //     fileURI: fileURL,
      //   },
      // });
    } else {
      setFileErrorStatus(true);
    }
  }

  function onFileChange(files: File[]): void {
    setFileErrorStatus(false);
    setFiles(files);
  }

  // useEffect(() => {
  //   if (saveUserAuthenticationMutationResult.data) {
  //     const result = _.get(saveUserAuthenticationMutationResult, "data.saveUserAuthentication");
  //     if (result) {
  //       userContainer.setUserProfileDialogOpen(false);
  //       openSnackbar("提交成功，请等待审核！", "success");
  //       executeSearchReviewProgressQuery();
  //       return;
  //     }
  //     openSnackbar("提交失败，请重新提交！", "error");
  //     return;
  //   }
  //   if (saveUserAuthenticationMutationResult.error) {
  //     openSnackbar("提交失败，请重新提交！", "error");
  //     return;
  //   }
  //   // eslint-disable-next-line react-hooks/exhaustive-deps
  // }, [saveUserAuthenticationMutationResult]);

  return (
    <Box className={classes.notCommitContent}>
      <Box>
        <Typography className={classes.title}>身份认证</Typography>
        <Typography className={classes.subtitle}>认证成功可获取更多功能权限</Typography>
      </Box>
      <Box>
        <form className={classes.formBox}>
          {/* {fields.map((field) => {
            if (field.type === "selector") {
              return (
                <Box key={field.id}>
                  <Controller
                    name={field.id}
                    control={control}
                    defaultValue={field.defaultValue}
                    as={
                      <Select
                        label={field.name}
                        key={field.id}
                        inputRef={register}
                        placeholder="身份"
                        inputProps={{
                          placeholder: field.name,
                          name: field.id,
                        }}
                        className={classes.selectRoot}
                        classes={{
                          select: classes.select,
                        }}
                      >
                        {Professions.map((option, index) => {
                          return (
                            <MenuItem key={index} value={option.value} className={classes.selectOption}>
                              {option.name}
                            </MenuItem>
                          );
                        })}
                      </Select>
                    }
                  />
                  <Typography color="error" className={classes.helpText}>
                    {errors.profession?.["message"]}
                  </Typography>
                </Box>
              );
            }
            return (
              <TextField
                key={field.id}
                defaultValue={field.value}
                name={field.id}
                inputRef={register}
                placeholder={field.name}
                error={Boolean(errors[field.id])}
                helperText={errors[field.id]?.["message"]}
                {...field.props}
              />
            );
          })} */}
          <Box>
            <Typography className={classes.label}>
              名片上传{fileErrorStatus ? <span className={classes.errorText}>{"请上传名片"}</span> : null}
            </Typography>
            <DropzoneArea
              classes={{ root: classes.dropzone, icon: classes.dropzoneIcon, active: classes.dropzoneActive }}
              previewGridClasses={{
                container: classes.previewContainer,
                item: classes.previewItem,
                image: classes.previewImage,
              }}
              showPreviews={false}
              showAlerts={false}
              filesLimit={1}
              dropzoneText=""
              onChange={onFileChange}
              inputProps={{
                ref: register,
                name: "card",
              }}
            />
          </Box>
          <Box className={classes.buttonBox}>
            <Button
              className={classes.button}
              variant="contained"
              color="primary"
              size="small"
              onClick={handleSubmit(onSubmit)}
            >
              提交
            </Button>
          </Box>
        </form>
      </Box>
    </Box>
  );
};

export default FormContent;
