class ProductModel {
  String? productName;
  int? price;
  String? imgUrl;
  bool? isAvailable;
  List<String>? materials;

  ProductModel({
    this.productName,
    this.price,
    this.imgUrl,
    this.isAvailable,
    this.materials,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    price = json['price'];
    imgUrl = json['image_url'];
    isAvailable = json['is_available'];
    materials = json['materials'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_name'] = productName;
    data['price'] = price;
    data['image_url'] = imgUrl;
    data['is_available'] = isAvailable;
    data['materials'] = materials;
    return data;
  }
}
