import { Box, Button, CircularProgress, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import _ from "lodash";
import React, { ReactNode, useState } from "react";
import { useForm } from "react-hook-form";
import * as yup from "yup";
import UserContainer from "../../../containers/userContainer";
import {
  // ReviewStatus,
  // ReviewType,
  // useSaveUserAuthenticationMutation,
  // useSearchReviewProgressQuery,
  useSingleUploadMutation,
} from "../../../generated/graphql";
import { REGEX } from "../../../utils/regex";
import SnackbarContainer from "../../common/snackbar/snackbarContainer";
import CardPNG from "./assets/card.png";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      padding: "5px 24px",
    },

    title: {
      color: "#333",
      fontSize: 20,
      fontWeight: 500,
      lineHeight: "26px",
    },

    subtitle: {
      fontSize: 12,
      lineHeight: "16px",
      color: "#999",
      marginTop: 8,
    },

    formBox: {
      display: "grid",
      gridRowGap: 12,
    },

    card: {
      paddingTop: 12,
    },

    cardTitle: {
      fontSize: 16,
      color: "#737373",
    },

    cardSubtitle: {
      fontSize: 14,
      color: "#999999",
    },

    div: {
      marginTop: 12,
      width: 299,
      height: 168,
      minHeight: 168,
      position: "relative",
    },

    img: {
      zIndex: 0,
      maxHeight: "100%",
      maxWidth: "100%",
      align: "center",
      contain: "cover",
    },

    errorText: {
      fontSize: 12,
      color: "#DC004E",
    },

    inputFile: {
      width: "100%",
      height: "100%",
      border: "none",
      outline: "none",
      background: "none",
      opacity: 0,
      zIndex: 1,
      position: "absolute",
      top: 0,
      left: 0,
    },

    buttonBox: {
      width: "100%",
      margin: "15px 0px 15px",
      textAlign: "right",
    },

    button: {
      fontSize: 14,
    },

    selectRoot: {
      height: 60,
      fontSize: 16,
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
      fontSize: 16,
    },
    redoneButton: {
      marginTop: 24,
    },
    alignCenter: {
      textAlign: "center",
    },
    textTip: {
      fontWeight: 400,
      color: "#666",
      marginTop: 16,
    },
    loading: {
      marginTop: "20%",
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
  weixin: yup.string().trim().required("请输入微信号"),
  email: yup.string().trim().required("请输入公司邮箱").email("请输入正确的邮箱"),
  profession: yup.string().required("请选择身份"),
  brief: yup.string().trim().required("请填写个人简介"),
  // card: yup.array().required("请上传名片"),
});

const Professions = [
  {
    name: "创业者",
    value: "entrepreneur",
  },
  {
    name: "投资人",
    value: "investor",
  },
  {
    name: "FA",
    value: "FA",
  },
  {
    name: "高管",
    value: "executive",
  },
  {
    name: "职员",
    value: "official",
  },
  {
    name: "媒体从业者",
    value: "mediaPractitioner",
  },
  {
    name: "专家",
    value: "expert",
  },
  {
    name: "区块链从业者",
    value: "blockchainPractitioner",
  },
  {
    name: "学生",
    value: "student",
  },
  {
    name: "其他",
    value: "others",
  },
];

const UserProfileDisplay: React.FunctionComponent<{}> = () => {
  const classes = useStyles();

  const userContainer = UserContainer.useContainer();
  const { openSnackbar } = SnackbarContainer.useContainer();
  const user = userContainer.user;

  const [name] = useState(user?.userName);
  // const [company] = useState(user?.company);
  // const [position] = useState(user?.position);
  // const [phone] = useState(user?.phone);
  const [weixin] = useState("");
  // const [email] = useState(user?.email);
  const [profession] = useState("");
  const [brief] = useState("");
  const [file, setFile] = useState<File>();
  const [imgSrc, setImgSrc] = useState<string | ArrayBuffer | null>(CardPNG);
  const { register, errors, handleSubmit, control } = useForm({
    validationSchema: InputValidationSchema,
    reValidateMode: "onBlur",
    mode: "onBlur",
  });

  const [fileErrorStatus, setFileErrorStatus] = useState(false);
  const [processStatus, setProcessStatus] = useState("loading");

  // const [searchReviewProgressQueryResult, executeSearchReviewProgressQuery] = useSearchReviewProgressQuery({
  //   variables: {
  //     reviewType: ReviewType.UserInfoCollection,
  //   },
  //   requestPolicy: "network-only",
  //   pause: true,
  // });
  // const [
  //   saveUserAuthenticationMutationResult,
  //   executeSaveUserAuthenticationMutation,
  // ] = useSaveUserAuthenticationMutation();
  const [, executeSingleUploadMutation] = useSingleUploadMutation();

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
  //     id: "weixin",
  //     name: "微信号码",
  //     value: weixin,
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
    if (file) {
      const fileURI = await executeSingleUploadMutation({
        file: file,
      }).then((result) => {
        return _.get(result, "data.singleUpload");
      });

      if (!fileURI) {
        openSnackbar("名片上传失败，请重新上传！", "error");
        return;
      }

      // executeSaveUserAuthenticationMutation({
      //   input: {
      //     userName: data["name"],
      //     company: data["company"],
      //     position: data["position"],
      //     phone: data["phone"],
      //     weChat: data["weixin"],
      //     companyEmail: data["email"],
      //     identity: data["profession"],
      //     personalProfile: data["brief"],
      //     fileURI: fileURI, // 上传的图片.
      //   },
      // });
    } else {
      setFileErrorStatus(true);
    }
  }

  function onFileChange(event: React.ChangeEvent<HTMLInputElement>): void {
    setFileErrorStatus(false);
    const files = event.target.files;
    if (files) {
      const file = files[files.length - 1];
      setFile(file);
      const fr = new FileReader();
      fr.onload = (): void => {
        setImgSrc(fr.result);
      };
      fr.readAsDataURL(file);
    }
  }

  function formContent(): ReactNode {
    return (
      <>
        <Box>
          <Typography className={classes.title}>身份认证</Typography>
          <Typography className={classes.subtitle}>认证成功可获取更多功能权限</Typography>
        </Box>
        <Box>
          <form className={classes.formBox}>
            {/* {fields.map((field) => {
              if (field.type === "selector") {
                return (
                  <Controller
                    key={field.id}
                    name={field.id}
                    control={control}
                    defaultValue={field.value}
                    as={
                      <InternalTextField
                        key={field.id}
                        label={field.name}
                        select
                        inputRef={register}
                        placeholder={field.name}
                        error={Boolean(errors[field.id])}
                        helperText={errors[field.id]?.["message"]}
                        value={profession}
                        inputProps={{
                          name: "profession",
                          id: "professions",
                        }}
                        {...field.props}
                      >
                        {Professions.map((option, index) => {
                          return (
                            <MenuItem key={index} value={option.value} className={classes.selectOption}>
                              {option.name}
                            </MenuItem>
                          );
                        })}
                      </InternalTextField>
                    }
                  />
                );
              }

              return (
                <Controller
                  key={field.id}
                  name={field.id}
                  control={control}
                  defaultValue={field.value}
                  as={
                    <InternalTextField
                      label={field.name}
                      inputRef={register}
                      placeholder={field.name}
                      error={Boolean(errors[field.id])}
                      helperText={errors[field.id]?.["message"]}
                      {...field.props}
                    />
                  }
                />
              );
            })} */}
            <Box className={classes.card}>
              <Typography className={classes.cardTitle}>名片上传</Typography>
              <Typography className={classes.cardSubtitle}>支持扩展名：png 、 jpeg 、jpg ...</Typography>
              <div className={classes.div}>
                <img src={imgSrc as string} alt="" className={classes.img} />
                <input id="file" type="file" accept="image/*" onChange={onFileChange} className={classes.inputFile} />
                <Typography className={classes.errorText}>{fileErrorStatus ? "请上传名片" : ""}</Typography>
              </div>
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
      </>
    );
  }

  function contentComponent(): ReactNode {
    switch (processStatus) {
      case "loading":
        return (
          <>
            <Typography className={classes.title}>身份认证</Typography>
            <Box className={classes.alignCenter}>
              <CircularProgress className={classes.loading} color="primary" size={30} />
            </Box>
          </>
        );
      // case ReviewStatus.NotCommit:
      //   return formContent();
      // case ReviewStatus.NotReviewed:
      //   return (
      //     <>
      //       <Box>
      //         <Typography className={classes.title}>身份认证</Typography>
      //         <Typography className={classes.textTip}>您的材料正在审核中...</Typography>
      //       </Box>
      //     </>
      //   );
      // case ReviewStatus.ReviewFailed:
      //   return (
      //     <>
      //       <Box>
      //         <Typography className={classes.title}>身份认证</Typography>
      //         <Typography className={classes.textTip}>您的身份认证申请未通过，具体原因请联系官方客服。</Typography>
      //         <Box className={classes.alignCenter}>
      //           <Button
      //             className={classes.redoneButton}
      //             color="primary"
      //             variant="contained"
      //             size="small"
      //             onClick={(): void => {
      //               setProcessStatus(ReviewStatus.NotCommit);
      //             }}
      //           >
      //             重新申请
      //           </Button>
      //         </Box>
      //       </Box>
      //     </>
      //   );
      // case ReviewStatus.ReviewPassed:
      //   return (
      //     <>
      //       <Box>
      //         <Typography className={classes.title}>身份认证</Typography>
      //         <Typography className={classes.textTip}>您的审核已经通过。</Typography>
      //       </Box>
      //     </>
      //   );
      default:
        return (
          <>
            <Box>
              <Typography className={classes.title}>身份认证</Typography>
              <Typography className={classes.textTip}>未知错误，请联系官方客服。</Typography>
            </Box>
          </>
        );
    }
  }

  // useEffect(() => {
  //   executeSearchReviewProgressQuery();
  //   // eslint-disable-next-line react-hooks/exhaustive-deps
  // }, []);

  // useEffect(() => {
  //   if (searchReviewProgressQueryResult.data) {
  //     const status = searchReviewProgressQueryResult.data.searchReviewProgress;

  //     if (status) {
  //       setProcessStatus(status);
  //       return;
  //     }
  //   }
  //   // eslint-disable-next-line react-hooks/exhaustive-deps
  // }, [searchReviewProgressQueryResult]);

  // useEffect(() => {
  //   if (saveUserAuthenticationMutationResult.data) {
  //     const result = _.get(saveUserAuthenticationMutationResult, "data.saveUserAuthentication");
  //     if (result) {
  //       openSnackbar("提交成功", "success");
  //       // 把状态改为 审核中
  //       // setProcessStatus(ReviewStatus.NotReviewed);
  //       return;
  //     }
  //   }
  //   if (saveUserAuthenticationMutationResult.error) {
  //     openSnackbar("提交失败，请重新提交！", "error");
  //     return;
  //   }
  //   // eslint-disable-next-line react-hooks/exhaustive-deps
  // }, [saveUserAuthenticationMutationResult]);

  return <Box className={classes.root}>{contentComponent()}</Box>;
};

export default UserProfileDisplay;
