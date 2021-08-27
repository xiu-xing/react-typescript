class MuseTagModel {
  String? id;
  String? name;

  MuseTagModel();
  
  MuseTagModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class MuseRangeModel {
  String? startValue;
  String? endValue;

  MuseRangeModel();
  
  MuseRangeModel.fromJson(Map<String, dynamic> json) {
    startValue = json['start_value'];
    endValue = json['end_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_value'] = this.startValue;
    data['end_value'] = this.endValue;
    return data;
  }
}