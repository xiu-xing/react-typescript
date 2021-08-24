import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import React from "react";
import AppContainer from "../../../../containers/appContainer";
import Bill from "../../../../icons/Bill";
import Bud from "../../../../icons/Bud";
import Building from "../../../../icons/Building";
import Enterprise from "../../../../icons/Enterprise";
import Flag from "../../../../icons/Flag";
import GiveMoney from "../../../../icons/GiveMoney";
import LightningShield from "../../../../icons/LightningShield";
import NewsPaper from "../../../../icons/NewsPaper";
import Person from "../../../../icons/Person";
import PersonGroup from "../../../../icons/PersonGroup";
import Rects from "../../../../icons/Rects";
import Report from "../../../../icons/Report";
import ThreeDiode from "../../../../icons/ThreeDiode";
import Track from "../../../../icons/Track";
import Trealm from "../../../../icons/Trealm";
import TrealmTrack from "../../../../icons/TrealmTrack";
import User from "../../../../icons/User";
import WinSights from "../../../../icons/WinSights";
import { Drawer } from "../../../common/drawer/drawer";
import { DrawerDividerProps } from "../../../common/drawer/drawer-divider";
import { DrawerGroupProps } from "../../../common/drawer/drawer-group";
import DrawerContainer from "../../../common/drawer/drawerContainer";

interface StyleProps {
  top: number;
}

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      position: "fixed",
      top: (props: StyleProps): number => props.top,
      zIndex: 1299,
      paddingTop: 10,
      height: "calc(100% - 48px)",
    },
    rootOpen: {
      transition: "width 200ms ease-out",
    },
  }),
);

export type DrawerElement = DrawerGroupProps | DrawerDividerProps;

const AppDrawer: React.FunctionComponent = () => {
  const { fixedTopHeight } = AppContainer.useContainer();
  const drawerContainer = DrawerContainer.useContainer();
  const classes = useStyles({ top: fixedTopHeight });

  const drawerElement: Array<DrawerElement> = [
    {
      type: "drawerGroup",
      title: "看板",
      href: "/dashboard",
      icon: Rects,
    },
    {
      type: "divider",
    },
    {
      type: "drawerGroup",
      title: "专家咨询",
      href: "/winsights",
      icon: WinSights,
    },
    {
      type: "drawerGroup",
      title: "项目企业",
      href: "/realm/pevc.enterprise",
      icon: Enterprise,
    },
    {
      type: "drawerGroup",
      title: "二级市场",
      href: "/realm/secondary_market.a_share_company_realm",
      // eslint-disable-next-line @typescript-eslint/ban-ts-ignore
      // @ts-ignore
      icon: ThreeDiode,
      items: [
        {
          title: "A 股企业",
          href: "/realm/secondary_market.a_share_company_realm",
        },
        {
          title: "A 股发行预告",
          href: "/realm/secondary_market.a_share_issuance_realm",
        },
        {
          title: "主板审核",
          href: "/realm/secondary_market.main_board_under_review_realm",
        },
        {
          title: "创业板审核",
          href: "/realm/secondary_market.growth_enterprise_board_under_review_realm",
        },
        {
          title: "科创板审核",
          href: "/realm/secondary_market.star_market_under_review_realm",
        },
      ],
    },
    {
      type: "drawerGroup",
      title: "投融事件",
      href: "/realm/pevc.event",
      icon: Bill,
    },
    {
      type: "drawerGroup",
      title: "投资机构",
      href: "/realm/pevc.institution",
      icon: Building,
    },
    {
      type: "drawerGroup",
      title: "LP",
      href: "/realm/pevc.lp",
      icon: GiveMoney,
    },
    {
      type: "drawerGroup",
      title: "基金",
      href: "/realm/pevc.fund",
      icon: Bud,
    },
    {
      type: "drawerGroup",
      title: "人物",
      href: "/realm/pevc.entrepreneur",
      icon: Person,
      items: [
        {
          title: "企业家",
          href: "/realm/pevc.entrepreneur",
        },
        {
          title: "投资人",
          href: "/realm/pevc.professional_investor",
        },
      ],
    },
    {
      type: "drawerGroup",
      title: "行业赛道",
      href: "/vertical/all",
      icon: Flag,
      items: [
        {
          title: "赛道体系",
          href: "/vertical/all",
        },
        {
          title: "自定义赛道",
          href: "/realm/pevc.vertical_builder",
        },
        {
          title: "风口赛道",
          href: "/vertical/detection",
        },
        {
          title: "硬科技",
          href: "/vertical/hard-tech",
        },
      ],
    },
    {
      type: "drawerGroup",
      title: "研报",
      href: "/article/research.research_report",
      icon: Report,
      items: [
        {
          title: "报告",
          href: "/article/research.research_report",
        },
        {
          title: "图表",
          href: "/article/research.research_diagram",
        },
      ],
    },
    {
      type: "divider",
    },
    {
      type: "drawerGroup",
      title: "我的追踪",
      icon: Track,
      items: [
        {
          title: "项目追踪",
          href: "/track/enterprise",
        },
        {
          title: "机构追踪",
          href: "/track/institution",
        },
        {
          title: "行业追踪",
          href: "/track/vertical",
        },
      ],
    },
    {
      type: "drawerGroup",
      title: "新闻",
      href: "/news/all",
      icon: NewsPaper,
    },
    {
      type: "drawerGroup",
      title: "风控",
      href: "/risk-management/companies",
      icon: LightningShield,
    },
    {
      type: "divider",
    },
    {
      type: "drawerGroup",
      title: "机构全貌",
      href: "/institution",
      icon: Trealm,
    },
    {
      type: "drawerGroup",
      title: "投后追踪",
      href: "/institution-tracking",
      icon: TrealmTrack,
    },
    {
      type: "drawerGroup",
      title: "成员管理",
      href: "/team-members",
      icon: PersonGroup,
    },
    {
      type: "divider",
    },
    {
      type: "drawerGroup",
      title: "我的",
      href: "/templates",
      icon: User,
      items: [
        {
          title: "搜索模板",
          href: "/templates",
        },
        {
          title: "导出记录",
          href: "/export",
        },
      ],
    },
  ];

  return (
    <Drawer
      className={clsx(classes.root, drawerContainer.drawerOpen && classes.rootOpen)}
      drawerElement={drawerElement}
    />
  );
};

export default AppDrawer;
