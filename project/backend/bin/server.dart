import 'package:backend/app_module.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_modular/shelf_modular.dart';

void main(List<String> arguments) async {
  final modularHandler = Modular(
    module: AppModule(
      hasuraServerURL: 'http://localhost:8080/v1/graphql',
    ), // Initial Module
    middlewares: [
      logRequests(), // Middleware Pipeline
    ],
  );

  final server = await io.serve(modularHandler, '0.0.0.0', 3000);
  print('Server started: ${server.address.address}:${server.port}');
}
