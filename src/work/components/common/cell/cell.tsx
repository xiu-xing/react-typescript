import { ButtonBase, ButtonBaseClassKey, ButtonBaseProps, StyledComponentProps, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { ReactNode } from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "flex",
      width: "100%",
      padding: "12px 16px",
      flexDirection: "row",
      alignItems: "stretch",
      transition: "background-color 150ms cubic-bezier(0.4, 0, 0.2, 1) 0ms",
      "&:hover": {
        backgroundColor: "rgba(0, 0, 0, 0.04)",
      },
    },
    imageArea: {
      display: "flex",
      flexDirection: "column",
      justifyContent: "flex-start",
    },
    centerArea: {
      flex: 1,
      display: "grid",
      gridRowGap: 8,
      justifyItems: "flex-start",
    },
    actionsArea: {
      display: "flex",
      flexDirection: "column",
      justifyContent: "center",
    },
    image: {
      width: 48,
      height: 48,
      minWidth: 48,
      minHeight: 48,
      overflow: "hidden",
      borderRadius: 6,
      marginRight: 16,
      display: "flex",
      flexDirection: "row",
      alignItems: "center",
      justifyContent: "center",
      borderColor: "#eee",
      borderWidth: 0.5,
      borderStyle: "solid",
    },
    heading: {
      display: "-webkit-box",
      WebkitBoxOrient: "vertical",
      overflow: "hidden",
      fontSize: 16,
      textAlign: "left",
      color: "#333",
    },
    subheading: {
      color: "#666",
      fontSize: 14,
      textAlign: "left",
    },
    tags: {
      display: "flex",
      flexWrap: "wrap",
    },
  }),
);

interface CommonCellProps
  extends Omit<ButtonBaseProps, "classes">,
    StyledComponentProps<ButtonBaseClassKey | "subheading"> {
  image?: ReactNode;
  heading?: string;
  headingLineLimit?: number;
  subheading?: string;
  tags?: ReactNode[];
  actions?: ReactNode;
}

/**
 * CommonCell usage:
 * @example
 * <CommonCell
      image={
        <img
          style={{ width: "100%", height: "100%", objectFit: "cover" }}
          src={"xxx"}
        />
      }
      heading="标题"
      subheading="副标题"
      tags={[<CommonCellTag key="1">标签</CommonCellTag>]}
      actions={<Button>按钮</Button>}
    />
 *
 * @param props Props for the cell
 */
const CommonCell: React.FunctionComponent<CommonCellProps> = (props) => {
  const classes = useStyles();
  const { image, heading, subheading, headingLineLimit, tags, actions, classes: restClasses, ...leftProps } = props;

  return (
    <ButtonBase
      {...leftProps}
      classes={{ root: restClasses?.root, disabled: restClasses?.disabled, focusVisible: restClasses?.focusVisible }}
      className={classes.root}
    >
      {image && (
        <div className={classes.imageArea}>
          <div className={classes.image}>{image}</div>
        </div>
      )}
      <div className={classes.centerArea}>
        {heading && (
          <Typography className={classes.heading} style={{ WebkitLineClamp: headingLineLimit ? headingLineLimit : 1 }}>
            {heading}
          </Typography>
        )}
        {subheading && (
          <Typography className={clsx(classes.subheading, restClasses?.subheading)}>{subheading}</Typography>
        )}
        {tags && <div className={classes.tags}>{tags}</div>}
      </div>
      <div className={classes.actionsArea}>{actions}</div>
    </ButtonBase>
  );
};

export default CommonCell;
