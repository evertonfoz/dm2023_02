import 'package:equatable/equatable.dart';

class ProductCategoryEntity extends Equatable {
  final String productCategoryID;
  final String name;
  final String description;
  final String imageURL;

  ProductCategoryEntity({
    required this.productCategoryID,
    required this.name,
    required this.description,
    required this.imageURL,
  });

  @override
  String toString() {
    return 'CategoryEntity{id: $productCategoryID, '
        'name: $name, '
        'description: $description, '
        'image: $imageURL}';
  }

  @override
  List<Object?> get props => [productCategoryID];
}
