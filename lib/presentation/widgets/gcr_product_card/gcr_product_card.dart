import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../data/models/models.dart';
import '../../../business_logic/blocs/blocs.dart';
import '../../pages/pages.dart';
import '../../../utils/utils.dart';

part 'product_sale_card.dart';
part 'product_feed_card.dart';
part 'product_wishlist_card.dart';
part 'product_viewed_card.dart';

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

    if (type == ProductCardType.wishlist) {
      return _ProductWishlistCard(product: product);
    }

    if (type == ProductCardType.viewed) {
      return _ProductViewedCard(product: product);
    }

    return const SizedBox.shrink();
  }
}
