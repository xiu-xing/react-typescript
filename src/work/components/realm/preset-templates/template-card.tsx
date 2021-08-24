import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { union } from "lodash";
import React, { useMemo } from "react";
import { PresetTemplate } from "../../../generated/graphql";
import { RichTextModel } from "../../../models/richText/index-next";
import RichTextNext from "../../common/rich-text-next";
import Space from "../../common/space";
import Tag from "../../common/tag";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      cursor: "pointer",
    },
    title: {
      fontSize: 14,
      color: "#333",
      lineHeight: "24px",
      fontWeight: theme.typography.fontWeightMedium,
    },
  }),
);

interface TemplateCardProps {
  template: PresetTemplate;
  onClick?: VoidFunction;
}

const TemplateCard: React.FC<TemplateCardProps> = (props) => {
  const classes = useStyles();
  const {
    template: { title, conditions = [], icons = [], statistics },
    onClick,
  } = props;

  const tags: string[] = useMemo(() => {
    return conditions?.reduce<string[]>((a, c) => union(a, c?.options.map((o) => o?.name as string) ?? []), []) ?? [];
  }, [conditions]);

  return (
    <Box className={classes.root} border="1px solid #EEE" borderRadius="4px" onClick={onClick}>
      <Box
        display="flex"
        alignItems="center"
        justifyContent="space-between"
        padding="11px 13px 9px 16px"
        borderBottom="1px solid #EEE"
      >
        <Typography className={classes.title}>{title}</Typography>
      </Box>
      <Box padding="16px">
        <Space wrap size="small">
          {tags.map((t, i) => (
            <Tag key={i} label={t} />
          ))}
        </Space>
        <Box height={12} />
        <Box display="flex" alignItems="center">
          <Space wrap size={5}>
            {icons?.map((ic, i) => (
              <img key={i} width="22px" height="22px" src={ic as string} style={{ objectFit: "contain" }} />
            ))}
          </Space>
          <Box width="8px" />
          <RichTextNext models={[...JSON.parse(statistics)].map((t) => RichTextModel.fromJSON(t))} />
        </Box>
      </Box>
    </Box>
  );
};

export default TemplateCard;
