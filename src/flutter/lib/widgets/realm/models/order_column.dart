/// 排序item model
class OrderColumnModel {
  static final String defaultOrder = "默认排序";

  String id = "";
  String name = "";
  bool select = false;

  bool isLocalDefaultOrder() => name == defaultOrder;

  OrderColumnModel(this.id, this.name, this.select);

  factory OrderColumnModel.buildDefault() =>
      OrderColumnModel("", defaultOrder, true);
}
