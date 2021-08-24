export type Realm =
  | "pevc.event"
  | "pevc.vertical_builder"
  | "pevc.enterprise"
  | "pevc.fund"
  | "pevc.institution"
  | "pevc.lp"
  | "pevc.professional_investor"
  | "pevc.entrepreneur"
  | "secondary_market.a_share_company_realm"
  | "secondary_market.a_share_issuance_realm"
  | "secondary_market.main_board_under_review_realm"
  | "secondary_market.growth_enterprise_board_under_review_realm"
  | "secondary_market.star_market_under_review_realm";

export const REALMTITLE: Record<Realm, string> = {
  "pevc.enterprise": "项目企业",
  "pevc.event": "投融事件",
  "pevc.institution": "投资机构",
  "pevc.lp": "LP",
  "pevc.fund": "基金",
  "pevc.entrepreneur": "企业家",
  "pevc.professional_investor": "投资人",
  "pevc.vertical_builder": "自定义赛道",
  "secondary_market.a_share_company_realm": "A 股企业",
  "secondary_market.a_share_issuance_realm": "A 股发行预告",
  "secondary_market.main_board_under_review_realm": "主板审核",
  "secondary_market.growth_enterprise_board_under_review_realm": "创业板审核",
  "secondary_market.star_market_under_review_realm": "科创板审核",
};
