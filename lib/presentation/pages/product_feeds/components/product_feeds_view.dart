import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../utils/utils.dart';
import 'product_feeds_page_search_bar.dart';
import 'product_feeds_list.dart';

class FeedsView extends StatelessWidget {
  const FeedsView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return KeyboardDismisser(
      gestures: kDismissKeyboardGestures,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'All Products',
            style: textTheme.displaySmall,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: const [
              FeedsPageSearchBar(),
              Expanded(child: FeedsGrid()),
            ],
          ),
        ),
      ),
    );
  }
}
