import { makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { useState } from "react";
import { RichTextModel } from "../../../../models/richText/index";
import { TableColumnModel } from "../../../../models/table/tableColumn";
import EllipsisText from "../../ellipsis-text/ellipsis-text";
import RichText from "../../rich-text/rich-text";

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
  columnModel?: TableColumnModel;
  rowExtraData?: unknown[];
}

/**
 * CommonTableCell TableCell 一个 cell 支持多种不同类型的 element
 * @param props
 */
const CommonTableCell: React.FunctionComponent<CommonTableCellProps> = (props) => {
  const classes = useStyles({ lineClamp: props.lineClamp || 1 });

  const { cellWrap, lineClamp, blur, cellValues } = props;

  const [isTruncated, setisTruncated] = useState(true);

  // if (props.lineClamp) {
  //   return (
  //     <div
  //       className={clsx(classes.root, lineClamp ? classes.textClamp : null, blur ? classes.textClamp : null)}
  //       style={{ whiteSpace: "nowrap" }}
  //     >
  //       {isTruncated ? (
  //         <EllipsisText
  //           lines={lineClamp || 1}
  //           hover
  //           hoverComponent={<RichText showModal={false} values={cellValues} />}
  //           onTruncate={(isTruncated): void => {
  //             setisTruncated(isTruncated);
  //           }}
  //         >
  //           <RichText values={cellValues} />
  //         </EllipsisText>
  //       ) : (
  //           <RichText values={cellValues} />
  //         )}
  //     </div>
  // }

  return (
    <div className={clsx(classes.root, blur ? classes.cellBlur : null)}>
      {lineClamp ? (
        <EllipsisText lineClamp={lineClamp}>
          <RichText classes={{ text: cellWrap ? classes.cellOverflow : "" }} values={cellValues} />
        </EllipsisText>
      ) : (
        <RichText classes={{ text: cellWrap ? classes.cellOverflow : "" }} values={cellValues} />
      )}
    </div>
  );
};

export default CommonTableCell;
