import 'package:common/features/products/domain/category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class ProductCategoryModel extends ProductCategoryEntity {
  ProductCategoryModel({
    required super.productCategoryID,
    required super.name,
    required super.description,
    required super.imageURL,
  });

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoryModelToJson(this);
}
