import 'dart:async';

import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

import 'end_points.dart/product_categories.dart';

class ProductResource extends Resource {
  @override
  List<Route> get routes => [
        Route.get('/product_categories', getAllProductCategories),
        Route.post('/product_categories', postProductCategory),
      ];
}
