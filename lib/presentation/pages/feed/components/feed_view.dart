import 'package:flutter/material.dart';

import './feed_page_search_bar.dart';
import './feed_list.dart';

class FeedView extends StatelessWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'All Products',
          style: textTheme.headline3,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: const [
            FeedPageSearchBar(),
            Expanded(child: FeedList()),
          ],
        ),
      ),
    );
  }
}
