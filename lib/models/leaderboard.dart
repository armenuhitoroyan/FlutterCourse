class LeaderbordModel {
  String? id;
  String? userImageUrl;
  String? firstName;
  String? lastName;
  double? score;

  LeaderbordModel(
      {this.id, this.userImageUrl, this.firstName, this.lastName, this.score});

  LeaderbordModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userImageUrl = json['user_image_url'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_image_url'] = this.userImageUrl;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['score'] = this.score;
    return data;
  }
}