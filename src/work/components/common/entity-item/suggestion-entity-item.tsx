import { ButtonBase, ButtonBaseClassKey, ButtonBaseProps, StyledComponentProps, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { ReactNode } from "react";
import { Suggestion } from "../../../generated/graphql";
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

type SuggestionEntityItemClassKey =
  | ButtonBaseClassKey
  | "logo"
  | "title"
  | "label"
  | "description"
  | "root"
  | "content";

interface SuggestionEntityItemProps
  extends Omit<ButtonBaseProps, "classes">,
    StyledComponentProps<SuggestionEntityItemClassKey> {
  suggestion: Suggestion;
  disableLogo?: boolean;
  disbaleLabel?: boolean;
  labelKey?: string;
  disableDescription?: boolean;
  descriptionKey?: string;
  actionNode?: ReactNode;
  hoverRipple?: boolean;
}

/**
 * quick search entity item component
 * @param props SuggestionEntityItemProps
 */
const SuggestionEntityItem: React.FunctionComponent<SuggestionEntityItemProps> = (props) => {
  const classes = useStyles();
  const {
    suggestion,
    disableLogo,
    disbaleLabel,
    labelKey,
    disableDescription,
    descriptionKey,
    actionNode,
    hoverRipple,
    className,
    classes: externalClasses,
    ...restProps
  } = props;

  function contentComponent(): ReactNode {
    if (!suggestion) {
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
              <EntityAvatar src={suggestion.logo} className={clsx(classes.logo, externalClasses?.logo)} />
            </div>
          )}
          <div className={classes.textBox}>
            <Typography className={clsx(classes.title, classes.textEllipsis, externalClasses?.title)} color="primary">
              {suggestion.primaryName}
            </Typography>
            {!disbaleLabel && (
              <Typography className={clsx(classes.label, classes.textEllipsis, externalClasses?.label)}>
                {labelKey ? suggestion[labelKey] : suggestion.label}
              </Typography>
            )}
            {!disableDescription && (
              <Typography className={clsx(classes.description, classes.textEllipsis, externalClasses?.description)}>
                {descriptionKey ? suggestion[descriptionKey] : suggestion.shortDescription}
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

export default SuggestionEntityItem;
