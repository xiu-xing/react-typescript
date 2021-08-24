import { ButtonBase, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import { Lock } from "mdi-material-ui";
import React, { useMemo } from "react";
import { Section } from "../../../../../../../generated/graphql";
import { getLockLimit } from "../../../../../../../utils/permission";
import { New } from "../../../../tabs/tab/assets";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    pseudo: {
      width: 2,
      height: 14,
      backgroundColor: theme.palette.primary.main,
      position: "absolute",
      marginTop: 1,
    },
    root: {
      width: "100%",
      minHeight: 36,
      padding: "0px 20px",
      paddingRight: 0,
      justifyContent: "left",
    },
    navigationMenuText: {
      fontSize: 14,
      color: "#999999",
      marginLeft: "10px",
      lineHeight: 1.72,
      fontWeight: theme.typography.fontWeightMedium,
    },
    navigationMenuTextActive: {
      color: theme.palette.primary.main,
    },
    suffix: {
      marginLeft: 6,
      background: theme.palette.primary.main,
      width: 6,
      height: 6,
      zIndex: 1,
      borderRadius: "50%",
    },
    lock: {
      fontSize: 14,
      marginLeft: 6,
      zIndex: 1,
      color: "#CCCCCC",
    },
    new: {
      zIndex: 1,
      width: 22,
      height: 22,
      marginLeft: 6,
    },
  }),
);

interface MenuItemProps {
  section: Section;
  active?: boolean;
  onClick?: VoidFunction;
}

const MenuItem: React.FunctionComponent<MenuItemProps> = (props) => {
  const classes = useStyles();
  const { section, active = false, onClick } = props;

  const suffixIcon = useMemo(() => {
    const locked = getLockLimit(section.permissions);
    if (locked) return <Lock className={classes.lock} />;

    if (!locked && section.modifier?.isNew) return <New className={classes.new} />;

    if (!locked && !!section.modifier?.isNew && section.modifier.hasUpdatedContent)
      return <span className={classes.suffix} />;

    return null;
  }, [section]);

  return (
    <ButtonBase className={classes.root} onClick={onClick}>
      {active ? <div className={classes.pseudo} /> : null}
      <Typography
        className={clsx(classes.navigationMenuText, {
          [classes.navigationMenuTextActive]: active,
        })}
      >
        {section["abbreviation"] ?? section.name}
      </Typography>
      {suffixIcon}
    </ButtonBase>
  );
};

export default MenuItem;
