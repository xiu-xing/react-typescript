export const columnConfig = {
  member: {
    name: "成员",
    flex: 4,
  },
  time: {
    name: "加入时间",
    flex: 2,
  },
  inviter: {
    name: "邀请人",
    flex: 2,
  },
  operate: {
    name: "操作",
  },
};

export interface ColumnConfig {
  name: string;
  flex?: number;
}

export const columns = ["member", "time", "inviter", "operate"];
