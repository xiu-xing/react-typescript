import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { uniq } from "lodash";
import { CheckboxBlankOutline, CheckboxMarked, MinusBox, MinusBoxOutline, PlusBoxOutline } from "mdi-material-ui";
import React, { useMemo, useState } from "react";
import CheckboxTree, { Node } from "react-checkbox-tree";
import "react-checkbox-tree/lib/react-checkbox-tree.css";
import { SearchConditionInputCommonProps } from ".";
import { NextOperator, SearchConditionOptionInput } from "../../../../generated/graphql";
import { first } from "../../../../utils/tools";
import { NestedOption } from "../types";

type FlatNode = NestedOption & {
  isLeaf: boolean;
  parent?: NestedOption;
};

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      "& .react-checkbox-tree": {
        fontSize: 14,
        lineHeight: "24px",
        fontWeight: theme.typography.fontWeightMedium,
        marginBottom: -8,
      },
      "& .react-checkbox-tree label:hover": {
        background: "transparent",
      },
      "& .react-checkbox-tree button , .react-checkbox-tree label, .rct-checkbox": {
        display: "inline-flex",
        alignItems: "center",
      },
      "& .rct-collapse, .rct-node-icon, .rct-title": {
        padding: 0,
      },
      "& .rct-checkbox": {
        padding: "0 8px",
      },
      "& .rct-text": {
        marginBottom: 8,
      },
      "& .react-checkbox-tree ol": {
        paddingLeft: 28,
      },
      "& .react-checkbox-tree>ol": {
        paddingLeft: 0,
      },
      "& .rct-node-leaf .rct-collapse": {
        width: 20,
        height: 20,
        display: "inline-flex",
        alignItems: "center",
        justifyContent: "center",
      },
      "& .rct-node-leaf .rct-collapse .rct-icon": {
        width: 6,
        height: 6,
        borderRadius: "50%",
        background: "#8C8C8C",
      },
    },
  }),
);

function convertOptions(nestedOptions?: NestedOption[]): Node[] | undefined {
  if (!Array.isArray(nestedOptions) || nestedOptions.length === 0) return;

  return nestedOptions.map<Node>((n) => ({
    value: n.value,
    label: n.name,
    children: convertOptions(n.children),
  }));
}

function getAllValues(options: Array<NestedOption | Node>): string[] {
  const res: string[] = [];

  options.forEach((o) => {
    res.push(o.value);

    if (Array.isArray(o.children)) {
      res.push(...getAllValues(o.children));
    }
  });

  return uniq(res);
}

function flattenNestedOptions(
  nodes: NestedOption[],
  parent?: NestedOption,
): Array<NestedOption & { parent?: NestedOption }> {
  const res: Array<NestedOption & { parent?: NestedOption }> = [];

  if (!Array.isArray(nodes) || nodes.length === 0) {
    return res;
  }

  nodes.forEach((node) => {
    if (Array.isArray(node.children)) {
      res.push({ ...node, parent }, ...flattenNestedOptions(node.children, node));
    } else {
      res.push({ ...node, parent });
    }
  });

  return res;
}

// eslint-disable-next-line @typescript-eslint/no-empty-interface
interface NestedCheckboxProps extends SearchConditionInputCommonProps {}

const NestedCheckbox: React.FC<NestedCheckboxProps> = (props) => {
  const classes = useStyles();
  const { variant = "input", config, value, onChange } = props;
  const operators = useMemo(() => config.input.operators, [config]);
  const defaultOperator = useMemo(() => first(operators.filter((o) => !o.is_locked)), [operators]);
  const [expanded, setExpanded] = useState<string[]>([]);
  const nestedOptions = useMemo(() => config.input.input_type_config.nested_options, [config]);
  const nodes = useMemo(() => convertOptions(nestedOptions), [nestedOptions]);
  const flattenOptions = useMemo(() => flattenNestedOptions(nestedOptions), [nestedOptions]);

  const selectedKeys = useMemo(() => {
    const ids = (value?.options ?? []).map((o) => o?.id ?? "") ?? [];

    return getAllValues(flattenOptions.filter((f) => ids.includes(f.value)));
  }, [value, flattenOptions]);

  const content = () => {
    switch (variant) {
      case "preset_input": {
        return (
          <Typography color="error" style={{ fontSize: 12 }}>
            此 SearchConditionInput 暂不支持 Preset
          </Typography>
        );
      }
      case "input": {
        return (
          <Box className={classes.root}>
            <CheckboxTree
              checkModel="all"
              showNodeIcon={false}
              nodes={nodes ?? []}
              checked={selectedKeys}
              expanded={expanded}
              onCheck={(values) => {
                let allOptions = values.map((v) => flattenOptions[flattenOptions.findIndex((f) => f.value === v)]);

                values.forEach((v) => {
                  const node = flattenOptions[flattenOptions.findIndex((f) => f.value === v)];

                  if (node.parent && getAllValues([node.parent]).every((v) => values.includes(v))) {
                    allOptions = allOptions.filter((a) => a.value !== v);
                  }
                });

                return onChange({
                  id: config.id,
                  type: config.input.input_type,
                  name: config.name,
                  operator: {
                    name: defaultOperator.name,
                    operator: defaultOperator.operator,
                  },
                  options: allOptions.map<SearchConditionOptionInput>((o) => ({
                    id: o.value,
                    name: o.display ?? o.name,
                    values: [o.value],
                    operator: NextOperator.IncludesAny,
                  })),
                });
              }}
              onExpand={(value) => setExpanded(value)}
              icons={{
                expandClose: <PlusBoxOutline fontSize="small" style={{ color: "#666" }} />,
                expandOpen: <MinusBoxOutline fontSize="small" style={{ color: "#666" }} />,
                check: <CheckboxMarked fontSize="small" color="primary" />,
                uncheck: <CheckboxBlankOutline fontSize="small" style={{ color: "#666" }} />,
                halfCheck: <MinusBox fontSize="small" color="primary" />,
              }}
            />
          </Box>
        );
      }
      default:
        return null;
    }
  };

  return content();
};

export default NestedCheckbox;
