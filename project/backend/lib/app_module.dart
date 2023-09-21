import 'package:hasura_connect/hasura_connect.dart';
import 'package:shelf_modular/shelf_modular.dart';

import 'features/products/product_resources.dart';

class AppModule extends Module {
  final String hasuraServerURL;

  AppModule({
    required this.hasuraServerURL,
  });

  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => HasuraConnect(hasuraServerURL)),
      ];

  @override
  List<ModularRoute> get routes => [
        Route.resource(ProductResource()),
      ];
}
