class ProductModel {
 late String productName;
 late int price;
 late String type;
 late bool isAvailable;
 late List<String> materials;

  ProductModel({
   required this.productName,
   required this.price,
   required this.type,
   required this.isAvailable,
   required this.materials,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    price = json['price'];
    type = json['type'];
    isAvailable = json['is_available'];
    materials = json['materials'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['product_name'] = this.productName;
    data['price'] = this.price;
    data['type'] = this.type;
    data['is_available'] = this.isAvailable;
    data['materials'] = this.materials;
    return data;
  }
}
