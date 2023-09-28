import 'dart:convert';
import 'package:common/features/products/data/category.dart';
import 'package:http/http.dart' as http;

class ProductCategoryDataSource {
  Future<List<ProductCategoryModel>> fetchProductCategories() async {
    final response =
        await http.get(Uri.parse('http://10.55.0.4:3000/product_categories'));

    if (response.statusCode == 200) {
      return _mapResponseToModel(response);
    } else {
      throw Exception('Failed to load product types');
    }
  }

  List<ProductCategoryModel> _mapResponseToModel(http.Response response) {
    final List<ProductCategoryModel> productCategories = [];
    for (var productCategory in json.decode(response.body)) {
      productCategories.add(ProductCategoryModel.fromJson(productCategory));
    }
    return productCategories;
  }
}
