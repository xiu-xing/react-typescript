import { Box, Chip, Typography } from "@material-ui/core";
import { createStyles, darken, makeStyles, Theme } from "@material-ui/core/styles";
import React from "react";
import Space from "../space";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    title: {
      fontSize: 14,
      color: "#666",
      lineHeight: "24px",
    },
    chip: {
      color: "#333",
      fontSize: 14,
      borderRadius: 20,
      lineHeight: "24px",
      padding: "0 12px",
      backgroundColor: "#E9EDF3",
      "& .MuiChip-label": {
        padding: 0,
      },
      "& .MuiChip-deleteIcon": {
        width: 20,
        height: 20,
        marginLeft: 2,
        marginRight: 0,
        color: theme.palette.primary.main,
      },
      "& .MuiChip-deleteIcon:hover": {
        color: darken(theme.palette.primary.main, 0.2),
      },
      "&:focus": {
        backgroundColor: darken("#E9EDF3", 0.2),
      },
    },
  }),
);

export interface Tag {
  id: any;
  name: string;
}

interface TagGroupProps {
  label: string;
  tags: Tag[];
  onDelete?: (tag: string) => void;
}

const TagGroup: React.FunctionComponent<TagGroupProps> = (props) => {
  const classes = useStyles();
  const { label, tags, onDelete } = props;

  return (
    <Box display="grid" alignItems="center" gridTemplateColumns="max-content 1fr" gridColumnGap="16px">
      <Typography noWrap className={classes.title}>
        {label}
      </Typography>
      <Space wrap>
        {tags.map((tag) => (
          <Chip
            key={JSON.stringify(tag.id)}
            label={tag.name}
            className={classes.chip}
            onDelete={onDelete ? () => onDelete(JSON.stringify(tag.id)) : undefined}
          />
        ))}
      </Space>
    </Box>
  );
};

export default TagGroup;
