import 'package:flutter/material.dart';
import 'package:mobile/features/product_categories/presentation/crud.dart';

import '../product_categories/presentation/list.dart';

class MobileApp extends StatelessWidget {
  const MobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange.shade900),
        useMaterial3: true,
      ),
      initialRoute: '/', // Define a página inicial
      routes: {
        '/': (context) => const HomePage(
              title: 'DADM',
            ), // Sua página inicial
        '/productCategoryCRUD': (context) =>
            const ProductCategoryCRUD(), // A página que você deseja navegar
      },
      // home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
