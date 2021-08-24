import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { HTMLAttributes } from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "flex",
      color: "#666",
      marginTop: "24px",
    },
    checkbox: {
      padding: 6,
      marginTop: 4,
    },
    label: {
      fontSize: 14,
      userSelect: "none",
    },
    link: {
      textDecoration: "none",
      color: "#666",
    },
    protocolName: {
      color: theme.palette.primary.main,
      cursor: "pointer",
    },
  }),
);

interface ProtocolModel {
  name: string;
  link?: string;
}

type ProtocolsProps = HTMLAttributes<HTMLDivElement>;

const Protocols: React.FunctionComponent<ProtocolsProps> = (props) => {
  const classes = useStyles();

  const { className, ...restProps } = props;

  const protocals: ProtocolModel[] = [
    {
      name: "隐私政策",
      link: "/privacy",
    },
    {
      name: "服务协议",
      link: "/service-agreement",
    },
  ];

  return (
    <div className={clsx(classes.root, className)} {...restProps}>
      <span className={classes.label}>
        登录即同意
        {protocals.map((protocal, index) => {
          return (
            <a key={index} href={protocal.link} target="_blank" rel="noreferrer" className={classes.link}>
              {index != 0 ? "及" : null}《<span className={classes.protocolName}>{protocal.name}</span>》
            </a>
          );
        })}
      </span>
    </div>
  );
};

export default Protocols;
