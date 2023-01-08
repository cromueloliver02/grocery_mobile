import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import '../../utils/utils.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final Color color;

  const Category({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.color,
  });

  @override
  List<Object> get props => [id, name, imageUrl, color];

  @override
  String toString() {
    return 'Category(id: $id, name: $name, imageUrl: $imageUrl, color: $color)';
  }

  Category copyWith({
    String? id,
    String? name,
    String? imageUrl,
    Color? color,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      color: color ?? this.color,
    );
  }

  static final List<Category> categories = [
    Category(
      id: uuid.v4(),
      name: 'Fruits',
      imageUrl: 'assets/images/category/fruits.png',
      color: const Color(0xff53B175),
    ),
    Category(
      id: uuid.v4(),
      name: 'Vegetables',
      imageUrl: 'assets/images/category/veg.png',
      color: const Color(0xffF8A44C),
    ),
    Category(
      id: uuid.v4(),
      name: 'Herbs',
      imageUrl: 'assets/images/category/spinach.png',
      color: const Color(0xffF7A593),
    ),
    Category(
      id: uuid.v4(),
      name: 'Nuts',
      imageUrl: 'assets/images/category/nuts.png',
      color: const Color(0xffD3B0E0),
    ),
    Category(
      id: uuid.v4(),
      name: 'Spices',
      imageUrl: 'assets/images/category/spices.png',
      color: const Color(0xffFDE598),
    ),
    Category(
      id: uuid.v4(),
      name: 'Grains',
      imageUrl: 'assets/images/category/grains.png',
      color: const Color(0xffB7DFF5),
    ),
  ];
}
