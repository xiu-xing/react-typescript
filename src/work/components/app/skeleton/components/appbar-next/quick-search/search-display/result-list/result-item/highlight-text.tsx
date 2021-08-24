import { Theme } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { useEffect, useMemo, useState } from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    highLight: {
      color: theme.palette.primary.main,
    },
  }),
);

interface HighlightTextProps {
  text: string;
  keywords: string[] | undefined | null;
  className?: string;
}

// 根据关键分词，高亮文本中出现的分词字段
const HighlightText: React.FunctionComponent<HighlightTextProps> = (props) => {
  const { text, keywords, className } = props;
  const classes = useStyles();
  const [textResult, setTextResult] = useState<string>("");

  useEffect(() => {
    if (!keywords || keywords.length === 0) {
      setTextResult(text);
      return;
    }

    const regex: string = keywords.join("|");
    const result = text.replace(RegExp("[" + regex + "]", "ig"), (match) => {
      return `<span class=${classes.highLight}>${match}</span>`;
    });
    setTextResult(result);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [keywords]);

  const content = useMemo(() => {
    return <span className={className ?? ""} dangerouslySetInnerHTML={{ __html: textResult }} />;
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [textResult]);

  return content;
};

export default HighlightText;
