import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../pages/pages.dart';
import '../utils/utils.dart';
import './widgets.dart';

part './gcr_product_cards.dart';

class GCRProductCard extends StatelessWidget {
  const GCRProductCard.sale({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.salePrice,
    this.quantity = 0,
    this.date,
    required this.measureUnit,
    this.type = ProductCardType.sale,
  });

  const GCRProductCard.feed({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.salePrice,
    this.quantity = 0,
    this.date,
    required this.measureUnit,
    this.type = ProductCardType.feed,
  });

  const GCRProductCard.cart({
    super.key,
    this.name = 'Product Name', // TODO: temp
    this.imageUrl = 'https://i.ibb.co/F0s3FHQ/Apricots.png', // TODO: temp
    required this.price,
    this.salePrice,
    this.quantity = 0,
    this.date,
    this.measureUnit = MeasureUnit.kg, // TODO: temp
    this.type = ProductCardType.cart,
  });

  const GCRProductCard.wishlist({
    super.key,
    this.name = 'Product Name', // TODO: temp
    this.imageUrl = 'https://i.ibb.co/F0s3FHQ/Apricots.png', // TODO: temp
    required this.price,
    this.salePrice,
    this.quantity = 0,
    this.date,
    this.measureUnit = MeasureUnit.kg, // TODO: temp
    this.type = ProductCardType.wishlist,
  });

  const GCRProductCard.order({
    super.key,
    this.name = 'Product Name', // TODO: temp
    this.imageUrl = 'https://i.ibb.co/F0s3FHQ/Apricots.png', // TODO: temp
    required this.price,
    required this.quantity,
    required this.date,
    this.salePrice,
    this.measureUnit = MeasureUnit.kg, // TODO: temp
    this.type = ProductCardType.order,
  });

  const GCRProductCard.viewed({
    super.key,
    this.name = 'Product Name', // TODO: temp
    this.imageUrl = 'https://i.ibb.co/F0s3FHQ/Apricots.png', // TODO: temp
    required this.price,
    this.salePrice,
    this.quantity = 0,
    this.date,
    this.measureUnit = MeasureUnit.kg, // TODO: temp
    this.type = ProductCardType.viewed,
  });

  final String name;
  final String imageUrl;
  final double price;
  final double? salePrice;
  final int quantity;
  final DateTime? date;
  final MeasureUnit measureUnit;
  final ProductCardType type;

  @override
  Widget build(BuildContext context) {
    if (type == ProductCardType.sale) {
      return _ProductSaleCard(
        name: name,
        imageUrl: imageUrl,
        price: price,
        salePrice: salePrice,
        measureUnit: measureUnit,
      );
    }

    if (type == ProductCardType.feed) {
      return _ProductFeedCard(
        name: name,
        imageUrl: imageUrl,
        price: price,
        salePrice: salePrice,
        measureUnit: measureUnit,
      );
    }

    if (type == ProductCardType.cart) {
      return _ProductCartCard(
        price: price,
        salePrice: salePrice,
      );
    }

    if (type == ProductCardType.wishlist) {
      return _ProductWishlistCard(
        price: price,
        salePrice: salePrice,
      );
    }

    if (type == ProductCardType.order) {
      return _ProductOrderCard(
        price: price,
        quantity: quantity,
        date: date!,
      );
    }

    if (type == ProductCardType.viewed) {
      return _ProductViewedCard(
        price: price,
        salePrice: salePrice,
      );
    }

    return const SizedBox.shrink();
  }
}
