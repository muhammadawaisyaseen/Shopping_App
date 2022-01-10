import 'package:flutter/material.dart';
class Product {
  final String id;
  final String title;
  final String description;
  final String price;
  final String imageUrl;
  final String productCategoryName;
  final String brand;
  final String quantity;
  final bool isfavourite;
  final bool isPopular;
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.productCategoryName,
    required this.brand,
    required this.quantity,
    required this.isfavourite,
    required this.isPopular,
  });
}
