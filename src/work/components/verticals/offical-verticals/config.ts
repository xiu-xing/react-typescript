export const config = {
  defaultColumns: [
    "primary_name",
    "number_of_companies",
    "number_of_deals_ltm",
    "number_of_ipos_ltm",
    "number_of_acquisitions_ltm",
  ],
  editableColumns: [
    "primary_name",
    "number_of_companies",
    "number_of_institutional_investors",
    "number_of_acquirers",
    "number_of_deals",
    "number_of_ipos",
    "number_of_acquisitions",
    "number_of_deals_ltm",
    "number_of_ipos_ltm",
    "number_of_acquisitions_ltm",
  ],
  columns: {
    primary_name: {
      name: "行业赛道",
      align: "left",
      isLocked: true,
      flexGrow: 2,
    },
    number_of_companies: {
      name: "企业数量",
      align: "right",
      sortable: true,
    },
    number_of_institutional_investors: {
      name: "投资机构数量",
      align: "right",
      sortable: true,
    },
    number_of_acquirers: {
      name: "收购方数量",
      align: "right",
      sortable: true,
    },
    number_of_deals: {
      name: "交易事件数量",
      align: "right",
      sortable: true,
    },
    number_of_ipos: {
      name: "IPO 事件数量",
      align: "right",
      sortable: true,
    },
    number_of_acquisitions: {
      name: "M&A 事件数量",
      align: "right",
      sortable: true,
    },
    number_of_deals_ltm: {
      name: "近一年交易数量",
      align: "right",
      sortable: true,
    },
    number_of_ipos_ltm: {
      name: "近一年 IPO 事件数量",
      align: "right",
      sortable: true,
    },
    number_of_acquisitions_ltm: {
      name: "近一年 M&A 事件数量",
      align: "right",
      sortable: true,
    },
  },
};
