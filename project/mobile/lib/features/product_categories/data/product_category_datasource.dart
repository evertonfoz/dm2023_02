import 'dart:convert';
import 'package:common/features/products/data/category.dart';
import 'package:http/http.dart' as http;

class ProductCategoryDataSource {
  Future<List<ProductCategoryModel>> getAllProductCategories() async {
    final response =
        await http.get(Uri.parse('http://10.55.0.4:3000/product_categories'));

    if (response.statusCode == 200) {
      return _mapResponseToModelList(response);
    } else {
      throw Exception('Failed to load product types');
    }
  }

  Future<ProductCategoryModel?> postProductCategory({
    required String name,
  }) async {
    final response = await http.post(
      Uri.parse('http://10.55.0.4:3000/product_categories'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<dynamic, dynamic>{
        'name': name,
      }),
    );

    if (response.statusCode == 200) {
      return ProductCategoryModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load product types');
    }
  }

  List<ProductCategoryModel> _mapResponseToModelList(http.Response response) {
    final List<ProductCategoryModel> productCategories = [];
    for (var productCategory in json.decode(response.body)) {
      productCategories.add(ProductCategoryModel.fromJson(productCategory));
    }
    return productCategories;
  }
}
