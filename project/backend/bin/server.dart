import 'dart:convert';
import 'dart:io';

import 'package:common/features/products/data/category.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..get('/echo/<message>', _echoHandler)
  ..post('/product_categories', _productCategories);

Response _rootHandler(Request req) {
  return Response.ok('Hello, World!\n');
}

Response _echoHandler(Request request) {
  final message = request.params['message'];
  return Response.ok('$message\n');
}

Future<Response> _productCategories(Request request) async {
  var body = await request.readAsString();
  var json = jsonDecode(body);
  ProductCategoryModel category = ProductCategoryModel.fromJson(json);
  return Response.ok('OK');
}

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '4001');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}