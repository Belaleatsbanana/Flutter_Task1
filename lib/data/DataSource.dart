import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'ProductDataModel.dart';
import 'package:tasky1/data/GridView.dart';

class DataSource {
  static List<ProductDataModel> listOfProduct = [];

  static Future<void> getProductsFromApi() async {
    try {
      debugPrint('getProductsFromApi loading');

      final response = await http.get(
        Uri.parse('https://dummyjson.com/products'),
      );

      debugPrint(response.body);

      if (response.statusCode == 200) {
        Map<String, dynamic> apiData = jsonDecode(response.body);

        for (Map<String, dynamic> p in apiData['products']) {
          ProductDataModel product = ProductDataModel.fromMap(p);

          listOfProduct.add(product);

        }
      }
    } catch (error) {
      debugPrint('Error: $error');
    }
  }
  static Widget buildProductGridView(BuildContext context) {
    return ProductGridView(products: listOfProduct);
  }
}
