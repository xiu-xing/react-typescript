import { ButtonBase, ButtonBaseClassKey, ButtonBaseProps, Typography } from "@material-ui/core";
import { createStyles, makeStyles, StyledComponentProps } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { ReactNode } from "react";
import { BasicEntityModel } from "../../../models/entity/interfaces";
import EntityAvatar from "../entity-avatar-next/entity-avatar";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      width: "100%",
      alignItems: "center",
      justifyContent: "left",
      padding: "8px 16px",
    },
    hoverRipple: {
      "&:hover": {
        background: "rgba(0, 0, 0, 0.04)",
      },
    },
    logoBox: {
      margin: "6px 0",
    },
    logo: {
      marginRight: 16,
      width: 32,
      height: 32,
    },
    contentBox: {
      display: "flex",
      flex: 1,
      overflow: "hidden",
    },
    textBox: {
      overflow: "hidden",
      textAlign: "left",
    },
    title: {
      fontSize: 16,
      fontWeight: 500,
    },
    label: {
      fontSize: 14,
      fontWeight: 500,
      color: "rgba(0, 0, 0, 0.54)",
    },
    description: {
      fontSize: 14,
      color: "#999",
    },
    textEllipsis: {
      maxWidth: "100%",
      overflow: "hidden",
      wordBreak: "break-all",
      whiteSpace: "nowrap",
      textOverflow: "ellipsis",
    },
    buttonBox: {
      marginLeft: 12,
    },
  }),
);

type BasicEntityItemPropsClassKey =
  | ButtonBaseClassKey
  | "logo"
  | "title"
  | "label"
  | "description"
  | "root"
  | "content";

interface BasicEntityItemProps
  extends Omit<ButtonBaseProps, "classes">,
    StyledComponentProps<BasicEntityItemPropsClassKey> {
  entity?: BasicEntityModel;
  disableLogo?: boolean;
  disbaleLabel?: boolean;
  disableDescription?: boolean;
  actionNode?: ReactNode;
  hoverRipple?: boolean;
}

/**
 * mapData 对应的实体项
 * @param props
 */
const BasicEntityItem: React.FunctionComponent<BasicEntityItemProps> = (props) => {
  const classes = useStyles();
  const {
    entity,
    disableLogo,
    disbaleLabel,
    disableDescription,
    actionNode,
    hoverRipple,
    className,
    classes: externalClasses,
    ...restProps
  } = props;

  function contentComponent(): ReactNode {
    if (!entity) {
      return null;
    }
    return (
      <ButtonBase
        className={clsx(classes.root, className, hoverRipple ? classes.hoverRipple : undefined, externalClasses?.root)}
        {...restProps}
      >
        <div className={clsx(classes.contentBox, externalClasses?.content)}>
          {!disableLogo && (
            <div className={classes.logoBox}>
              <EntityAvatar src={entity.logo} className={clsx(classes.logo, externalClasses?.logo)} />
            </div>
          )}
          <div className={classes.textBox}>
            <Typography className={clsx(classes.title, classes.textEllipsis, externalClasses?.title)} color="primary">
              {entity.entityName}
            </Typography>
            {!disbaleLabel && (
              <Typography className={clsx(classes.label, classes.textEllipsis, externalClasses?.label)}>
                {entity.label}
              </Typography>
            )}
            {!disableDescription && (
              <Typography className={clsx(classes.description, classes.textEllipsis, externalClasses?.description)}>
                {entity.description}
              </Typography>
            )}
          </div>
        </div>
        {actionNode ? <div className={classes.buttonBox}>{actionNode}</div> : null}
      </ButtonBase>
    );
  }

  return <>{contentComponent()}</>;
};

export default BasicEntityItem;
