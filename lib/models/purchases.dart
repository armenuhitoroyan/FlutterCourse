class PurchasesModel {
  String? title;
  String? subTitle;
  double? price;
  int? playsCount;
  bool? showBadge;

  PurchasesModel(
      {this.title, this.subTitle, this.price, this.playsCount, this.showBadge});

  PurchasesModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subTitle = json['sub_title'];
    price = json['price'];
    playsCount = json['plays_count'];
    showBadge = json['show_badge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['sub_title'] = this.subTitle;
    data['price'] = this.price;
    data['plays_count'] = this.playsCount;
    data['show_badge'] = this.showBadge;
    return data;
  }
}