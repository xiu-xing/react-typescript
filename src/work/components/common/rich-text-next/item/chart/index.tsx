import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import * as echarts from "echarts";
import ReactEChartsCore from "echarts-for-react/lib/core";
import { Provider } from "jotai";
import nanoid from "nanoid";
import React from "react";
import { RichTextModel } from "../../../../../models/richText/index-next";
import Modal from "../../../modal";
import { option } from "./option-transcoding";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      height: "35px !important",
      width: 110,
      verticalAlign: "middle",
    },
    tippy: {
      pointerEvents: "none",
      "&:focus": {
        outline: 0,
      },
    },
  }),
);

interface ChartProps {
  model: RichTextModel;
}

const Chart: React.FunctionComponent<ChartProps> = ({ model }) => {
  const classes = useStyles();

  return (
    <>
      <Provider key={nanoid(8)}>
        <Modal key={model.modal.args.toString()} modal={model.modal}>
          <ReactEChartsCore className={classes.root} echarts={echarts} option={option(model.payload)} />
        </Modal>
      </Provider>
    </>
  );
};

export default Chart;
