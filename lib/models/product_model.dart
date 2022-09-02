class ProductModel {
 late String productName;
 late int price;
 late bool isAvailable;
 late String image;
 late List<String> materials;

  ProductModel({
   required this.productName,
   required this.price,
   required this.isAvailable,
   required this.image,
   required this.materials,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    price = json['price'];
    isAvailable = json['is_available'];
    image = json['image'];
    materials = json['materials'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['product_name'] = this.productName;
    data['price'] = this.price;
    data['is_available'] = this.isAvailable;
    data['image'] = this.image;
    data['materials'] = this.materials;
    return data;
  }
}
