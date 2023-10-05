// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:common/features/products/data/category.dart';
import 'package:flutter/material.dart';
import 'package:mobile/features/product_categories/data/product_category_datasource.dart';

class ProductCategoryCRUD extends StatefulWidget {
  const ProductCategoryCRUD({super.key});

  @override
  _ProductCategoryCRUDState createState() => _ProductCategoryCRUDState();
}

class _ProductCategoryCRUDState extends State<ProductCategoryCRUD> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nova categoria de produto')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um nome';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    ProductCategoryModel? productCategoryModel =
                        await ProductCategoryDataSource().postProductCategory(
                      name: _nameController.text,
                    );
                    if (productCategoryModel != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Inclusão realizada com sucesso!')),
                      );
                      // Aguarde um pouco para que o usuário possa ver a mensagem e, em seguida, execute o pop()
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.of(context).pop();
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Erro ao incluir!')),
                      );
                    }
                  }
                },
                child: const Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
