import 'dart:convert';

import 'package:hasura_connect/hasura_connect.dart' hide Response, Request;
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

Future<Response> getAllProductCategories(
  Injector injector,
) {
  final hasuraConnect = injector.get<HasuraConnect>();
  return hasuraConnect.query(
    r'''
        query getAllProductCategories {
          productCategories(order_by: {name: asc}) {
            productCategoryID
            name
            description
            imageURL
          }
        }
    ''',
  ).then(
    (value) {
      return Response.ok(
        jsonEncode(value['data']['productCategories']),
      );
    },
  );
}
