import 'dart:convert';

import 'package:bloc_ecommerce_project/data/api.dart';
import 'package:bloc_ecommerce_project/features/home/models/home_products_model.dart';
import 'package:http/http.dart' as http;

class ProductsRepo {
  Future<List<ProductsModel>> getProducts() async {
    final url = ApiService.baseUrl;
    final response = await http.get(Uri.parse(url));
    final responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      List<ProductsModel> products = List<ProductsModel>.from(
          responseData.map((e) => ProductsModel.fromJson(e))).toList();
      print(products[0].description);
      return products;
    } else {
      throw Exception('Failed to load data');
    }
  }
}