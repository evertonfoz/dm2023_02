// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCategoryModel _$ProductCategoryModelFromJson(
        Map<String, dynamic> json) =>
    ProductCategoryModel(
      productCategoryID: json['productCategoryID'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageURL: json['imageURL'] as String,
    );

Map<String, dynamic> _$ProductCategoryModelToJson(
        ProductCategoryModel instance) =>
    <String, dynamic>{
      'productCategoryID': instance.productCategoryID,
      'name': instance.name,
      'description': instance.description,
      'imageURL': instance.imageURL,
    };
