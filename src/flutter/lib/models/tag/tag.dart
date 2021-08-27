class TagModel {
  late String tagID;
  late String tagName;

  TagModel(String tagID, String tagName) {
    this.tagID = tagID;
    this.tagName = tagName;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tagId'] = this.tagID;
    data['tagName'] = this.tagName;
    return data;
  }
}
