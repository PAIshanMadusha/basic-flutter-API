import 'dart:convert';
import 'package:basic_flutter_api/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  //Get Request//

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
      } else {
        throw Exception("Fail: ${responce.statusCode}");
      }
    } catch (error) {
      throw Exception("Failed to Fetch a Single Product");
    }
  }

  //POST Request//

  //Add a Product to the API
  Future<ProductModel> addProduct(ProductModel product) async {
    const String url = "https://fakestoreapi.com/products";

    try {
      final responce = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: json.encode(product.toJson()),
      );
      if (responce.statusCode == 200 || responce.statusCode == 201) {
        // ignore: avoid_print
        print(
          "Responce: ${responce.body}",
        ); // New Product Print in Debug Console
        ProductModel newProduct = ProductModel.fromJson(
          json.decode(responce.body),
        );
        return newProduct;
      } else {
        throw Exception("Faild");
      }
    } catch (error) {
      throw Exception("Faild to Add Product");
    }
  }

  //PUT Request

  //Update a Product in the API
  Future<ProductModel> updateProduct(int id, ProductModel product) async {
    final String url = "https://fakestoreapi.com/products/$id";

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: json.encode(product.toJson()),
      );
      if (response.statusCode == 200) {
        ProductModel updateProduct = ProductModel.fromJson(
          jsonDecode(response.body),
        );
        // ignore: avoid_print
        print(
          "Response: ${response.body}",
        ); //Updated Product Print in Debug Console
        return updateProduct;
      } else {
        throw Exception("Fail");
      }
    } catch (error) {
      throw Exception("Error: $error");
    }
  }

  //DELETE Request

  //Delete a Product from the API
  Future<void> deleteProduct(int id) async {
    final String url = "https://fakestoreapi.com/products/$id";
    try {
      final response = await http.delete(Uri.parse(url));
      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(
          "Response: ${response.body}",
        ); //Delete Product Print in Debug Console
      } else {
        throw Exception("Fail");
      }
    } catch (error) {
      throw Exception("Error: $error");
    }
  }
}
