import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../data/models/models.dart';
import './widgets.dart';
import '../pages/pages.dart';
import '../utils/utils.dart';

part './gcr_product_cards.dart';

class GCRProductCard extends StatelessWidget {
  const GCRProductCard.sale({
    super.key,
    required this.product,
    this.type = ProductCardType.sale,
  });

  const GCRProductCard.feed({
    super.key,
    required this.product,
    this.type = ProductCardType.feed,
  });

  const GCRProductCard.cart({
    super.key,
    required this.product,
    this.type = ProductCardType.cart,
  });

  const GCRProductCard.wishlist({
    super.key,
    required this.product,
    this.type = ProductCardType.wishlist,
  });

  const GCRProductCard.viewed({
    super.key,
    required this.product,
    this.type = ProductCardType.viewed,
  });

  final Product product;
  final ProductCardType type;

  @override
  Widget build(BuildContext context) {
    if (type == ProductCardType.sale) {
      return _ProductSaleCard(product: product);
    }

    if (type == ProductCardType.feed) {
      return _ProductFeedCard(product: product);
    }

    if (type == ProductCardType.cart) {
      return _ProductCartCard(product: product);
    }

    if (type == ProductCardType.wishlist) {
      return _ProductWishlistCard(product: product);
    }

    if (type == ProductCardType.viewed) {
      return _ProductViewedCard(product: product);
    }

    return const SizedBox.shrink();
  }
}
