import { Box, Button, ButtonBase, CircularProgress, darken, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import { CheckCircle } from "mdi-material-ui";
import React, { useEffect, useState } from "react";
import CopyToClipboard from "react-copy-to-clipboard";
import AppContainer from "../../../containers/appContainer";
import { useInvitationDetailQuery } from "../../../generated/graphql";
import { baseUrl } from "../../../utils/url";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    fontSize14: {
      fontSize: 14,
      lineHeight: "24px",
    },
    fontSize16: {
      fontSize: 16,
      lineHeight: "24px",
    },
    fontSize18: {
      fontSize: 18,
      lineHeight: "26px",
    },
    color333: {
      color: "#333",
    },
    color666: {
      color: "#666",
    },
    color999: {
      color: "#999",
    },
    fontWeightMedium: {
      fontWeight: theme.typography.fontWeightMedium,
    },
    color73: {
      color: "#737373",
    },
    button: {
      transition: "background-color .5s",
      padding: "8px 36px",
      borderRadius: "4px",
      color: "#fff",
      backgroundColor: theme.palette.primary.main,
      "&:hover": {
        backgroundColor: darken(theme.palette.primary.main, 0.2),
      },
    },
    successButton: {
      backgroundColor: "#51B85F",
      "&:hover": {
        backgroundColor: darken("#51B85F", 0.2),
      },
    },
    failureButton: {
      backgroundColor: "#e00000",
      "&:hover": {
        backgroundColor: darken("#e00000", 0.2),
      },
    },
  }),
);

interface InvitationProps {
  code: string;
}

const Invitation: React.FC<InvitationProps> = (props) => {
  const classes = useStyles();
  const { code } = props;
  const { closeDialog } = AppContainer.useContainer();
  const [copyRes, setCopyRes] = useState<boolean>();
  const [fetching, setFetching] = useState(false);
  const [error, setError] = useState(false);

  const [detail] = useInvitationDetailQuery({
    variables: {
      invitationCode: code,
    },
  });

  useEffect(() => {
    setFetching(detail.fetching);
    if (detail.error) {
      setError(true);
    } else {
      setError(false);
    }
  }, [detail]);

  const onCopy = (_: string, result: boolean) => {
    setCopyRes(result);
  };

  return (
    <Box padding="32px 24px" className={classes.root}>
      <Typography noWrap className={clsx(classes.fontSize18, classes.color333)}>
        邀请成员
      </Typography>
      <Box height={20} />
      <Box display="grid" gridTemplateColumns="max-content 1fr" gridColumnGap="4px" alignItems="center">
        <CheckCircle color="primary" fontSize="small" />
        <Typography className={clsx(classes.fontSize16, classes.color73)}>成功创建邀请</Typography>
      </Box>
      <Box height={16} />
      <Box
        display="grid"
        gridTemplateColumns="max-content 1fr"
        gridColumnGap="30px"
        alignItems="center"
        border="1px solid #eee"
        padding="9px 20px"
      >
        <Typography noWrap className={clsx(classes.fontSize14, classes.color999)}>
          邀请码
        </Typography>
        <Typography noWrap className={clsx(classes.fontSize14, classes.color666)}>
          {code}
        </Typography>
      </Box>
      <Box height={8} />
      <Typography noWrap className={clsx(classes.fontSize14, classes.color999)}>
        邀请链接有效期为 14 天，可重复使用，过期后链接作废
      </Typography>
      <Box display="flex" justifyContent="flex-end">
        <Button variant="text" onClick={closeDialog}>
          <Typography noWrap className={clsx(classes.fontSize14, classes.color999)}>
            取消
          </Typography>
        </Button>
        <Box width={14} />
        <CopyToClipboard
          text={`
【RimeData 来觅数据】${detail.data?.invitationDetail.teamName}邀请您加入机构，使用来觅数据。
操作提示：打开下方链接，微信扫码登录，输入邀请码即可加入。
链接：${baseUrl()}
邀请码：${code}（14天内有效，可重复使用，过期作废）
为最佳体验，请不要使用 IE 浏览器，推荐使用 Chrome、Edge、火狐、QQ、360浏览器。
`}
          onCopy={onCopy}
        >
          <ButtonBase
            disabled={error}
            className={clsx(classes.button, {
              [classes.successButton]: copyRes === true,
              [classes.failureButton]: copyRes === false,
            })}
          >
            {fetching ? (
              <CircularProgress size={18} style={{ color: "white" }} />
            ) : (
              <Typography noWrap className={clsx(classes.fontSize14)}>
                {typeof copyRes === "undefined" ? "复制邀请" : copyRes ? "复制成功" : "复制失败"}
              </Typography>
            )}
          </ButtonBase>
        </CopyToClipboard>
      </Box>
    </Box>
  );
};

export default Invitation;
