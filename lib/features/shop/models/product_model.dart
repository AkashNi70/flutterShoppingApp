import 'package:shop/features/shop/models/brand_model.dart';
import 'package:shop/features/shop/models/product_attribute_model.dart';
import 'package:shop/features/shop/models/product_variation_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  boot? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? inages;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;


}
