import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';
import './viewed_recently_page_app_bar.dart';

class ViewedRecentlyView extends StatelessWidget {
  const ViewedRecentlyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const ViewedRecentlyPageAppBar(),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  itemCount: 19,
                  separatorBuilder: (ctx, idx) => const SizedBox(height: 5),
                  itemBuilder: (ctx, idx) => const GCRProductCard.viewed(
                    price: 5.93,
                    salePrice: 4.85,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
