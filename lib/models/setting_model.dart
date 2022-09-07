class SettingModel {
  int? id;
  // ignore: non_constant_identifier_names
  String? setting_name;
  // ignore: non_constant_identifier_names
  bool? setting_value;
 

  SettingModel({
    this.id,
    // ignore: non_constant_identifier_names
    this.setting_name,
    // ignore: non_constant_identifier_names
    this.setting_value,
   
  });

  SettingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    setting_name = json['setting_name'];
    setting_value = json['setting_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['setting_name'] = setting_name;
    data['setting_value'] = setting_value;
    return data;
  }
}
