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

Future<Response> postProductCategory(
  Injector injector,
  ModularArguments args,
) {
  final hasuraConnect = injector.get<HasuraConnect>();
  return hasuraConnect.mutation(
    r'''
        mutation InsertProductCategory(
            $name: String!, $description: String!, $imageURL: String!) {
          insert_productCategories_one(object: {
              name: $name, imageURL: $imageURL, description: $description}) {
            productCategoryID
            name
            description
            imageURL
          }
        }
    ''',
    variables: {
      'name': args.data['name'],
      'description': args.data['description'] ?? '',
      'imageURL': args.data['imageURL'] ?? '',
    },
  ).then(
    (value) {
      return Response.ok(
        jsonEncode(value['data']['insert_productCategories_one']),
      );
    },
  );
}
