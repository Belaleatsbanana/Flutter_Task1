class ProductDataModel {
  String productName;
  int productPrice;
  String productImage;
  num productRating;
  int productStock;
  String productDesc;

  ProductDataModel({
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.productRating,
    required this.productStock,
    required this.productDesc,
  });

  factory ProductDataModel.fromMap(Map<String, dynamic> json) {
    return ProductDataModel(
      productName: json['title'],
      productPrice: json['price'],
      productImage: json['thumbnail'],
      productRating: json['rating'],
      productStock: json['stock'],
      productDesc: json['description'],
    );
  }
}