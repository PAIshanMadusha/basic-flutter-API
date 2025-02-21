import 'dart:convert';

import 'package:basic_flutter_api/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  //Fetch All Products From the API
  Future<List<ProductModel>> fetchAllProducts() async {
    const String url = "https://fakestoreapi.com/products";

    try {
      final responce = await http.get(Uri.parse(url));

      if (responce.statusCode == 200) {
        List<dynamic> responceData = jsonDecode(responce.body);
        List<ProductModel> products =
            responceData.map((json) {
              return ProductModel.fromJson(json);
            }).toList();

        return products;
      } else {
        throw Exception("Fail");
      }
    } catch (error) {
      error.toString();
      throw Exception("Faild to Fetch Products");
    }
  }

  //Fetch a Single Product Form the API
  Future<ProductModel> fetchASingleProduct(int id) async {
    final String url = "https://fakestoreapi.com/products/$id";

    try {
      final responce = await http.get(Uri.parse(url));
      if (responce.statusCode == 200) {
        ProductModel product = ProductModel.fromJson(jsonDecode(responce.body));
        return product;
      }else{
        throw Exception("Fail: ${responce.statusCode}");
      }
    } catch (error) {
      throw Exception("Failed to Fetch a Single Product");
    }
  }
}
