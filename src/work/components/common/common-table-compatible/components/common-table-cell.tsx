import { makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import React from "react";
import { RichTextModel } from "../../../../models/richText/index-next";
import { TableColumnCompatibleModel } from "../../../../models/table/tableColumnCompatible";
import EllipsisText from "../../ellipsis-text/ellipsis-text";
import RichTextNext from "../../rich-text-next";

const useStyles = makeStyles({
  root: {
    padding: "0px 16px",
    whiteSpace: "normal",
    position: "relative",
  },
  cellOverflow: {
    whiteSpace: "normal",
    wordBreak: "break-all",
    textOverflow: "ellipsis",
    overflow: "hidden",
  },
  textClamp: (props) => ({
    display: "-webkit-box",
    overflow: "hidden",
    textOverflow: "ellipsis",
    WebkitLineClamp: props["lineClamp"],
    WebkitBoxOrient: "vertical",
  }),
  cellBlur: {
    filter: "blur(4px)",
    pointerEvents: "none",
    userSelect: "none",
  },
});

interface CommonTableCellProps {
  cellValues: RichTextModel[];
  cellWrap?: boolean;
  blur?: boolean;
  lineClamp?: number;
  columnModel?: TableColumnCompatibleModel;
  rowExtraData?: unknown[];
}

/**
 * CommonTableCell TableCell 一个 cell 支持多种不同类型的 element
 * @param props
 */
const CommonTableCell: React.FunctionComponent<CommonTableCellProps> = (props) => {
  const classes = useStyles({ lineClamp: props.lineClamp || 1 });

  const { lineClamp, blur, cellValues } = props;

  return (
    <div className={clsx(classes.root, blur ? classes.cellBlur : null)}>
      {lineClamp ? (
        <EllipsisText lineClamp={lineClamp}>
          <RichTextNext models={cellValues} />
        </EllipsisText>
      ) : (
        <RichTextNext models={cellValues} />
      )}
    </div>
  );
};

export default CommonTableCell;
