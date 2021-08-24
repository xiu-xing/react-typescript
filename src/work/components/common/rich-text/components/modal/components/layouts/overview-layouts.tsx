import { createStyles, makeStyles } from "@material-ui/core/styles";
import _ from "lodash";
import React, { ReactNode, useLayoutEffect } from "react";
import ConfigContainer from "../../../../../../../containers/configContainer";
import { BlockField } from "../../../../../../../models/profile/overviewConfig";
import ModalContainer from "../../modalContainer";
import Field from "../field";
import Text from "../text";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      padding: "24px 24px 20px 24px",
    },
    contentBox: {
      display: "flex",
      flexDirection: "column",
      height: "min-content",
    },
    title: {
      display: "inline-block",
      fontSize: "20px !important",
      fontWeight: 500,
      color: "#333",
      marginBottom: 8,
    },
    description: {
      display: "inline-block",
      fontSize: 14,
      lineHeight: "24px",
      textAlign: "justify",
      marginBottom: 8,
      fontFamily: "Noto Sans SC Regular",
    },
  }),
);

const OverviewLayouts: React.FunctionComponent = () => {
  const classes = useStyles();
  const modalContainer = ModalContainer.useContainer();
  const { overviewConfigs: config } = ConfigContainer.useContainer();

  useLayoutEffect(() => {
    if (modalContainer.popoverAnchorRef.current) {
      modalContainer.popoverAnchorRef.current.updatePosition();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  function getFieldsFromOverviewConfigs(): Array<BlockField> {
    const blocks = config?.blocks;
    const layouts = config?.blockLayouts;

    if (blocks && layouts) {
      const blockIds: Array<string> = _.flattenDeep(layouts[modalContainer.dataId || ""] || []);

      if (blockIds && blockIds.length) {
        const fields: Array<BlockField> = [];
        blockIds.forEach((blockId: string) => {
          const blockFields = blocks[blockId]?.fields || [];
          fields.push(...blockFields);
        });
        return fields;
      }
    }

    return [];
  }

  function layout(): ReactNode {
    const fields = getFieldsFromOverviewConfigs();
    return (
      <div className={classes.contentBox}>
        <Text className={classes.title} fieldId={"overview.full_name"} />
        <Text className={classes.description} fieldId="overview.description" />
        {fields.map((blockField, index) => {
          return <Field key={index} fieldId={blockField.key} name={blockField.name} />;
        })}
      </div>
    );
  }

  return <div className={classes.root}>{layout()}</div>;
};

export default OverviewLayouts;
