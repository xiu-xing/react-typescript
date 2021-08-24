import { TableSelection as DxTableSelection } from "@devexpress/dx-react-grid-material-ui";
import React from "react";

type GridSelectionRowProps = DxTableSelection.RowProps;

const GridSelectionRow: React.FunctionComponent<GridSelectionRowProps> = (props) => {
  return <tr {...props} />;
};

export default GridSelectionRow;
