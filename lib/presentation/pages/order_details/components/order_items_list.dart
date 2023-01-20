import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';

class OrderedItemsList extends StatelessWidget {
  const OrderedItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (ctx, idx) => const Divider(thickness: 1),
      itemBuilder: (ctx, idx) => const GCROrderDetailsCard(),
    );
  }
}
