import 'package:flutter/material.dart';

import '../../../../business_logic/blocs/blocs.dart';
import '../../../../business_logic/cubits/cubits.dart';
import '../../../widgets/widgets.dart';
import 'viewed_recently_page_app_bar.dart';

class ViewedRecentlyView extends StatelessWidget {
  const ViewedRecentlyView({super.key});

  void _goToHomePage(BuildContext ctx) {
    Navigator.pop(ctx);
    ctx.read<NavigationCubit>().setCurrentIndex(0);
  }

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
                child: BlocBuilder<ViewedRecentlyBloc, ViewedRecentlyState>(
                  builder: (ctx, state) {
                    if (state.viewedItems.isEmpty) {
                      return GCREmptyMessageCard(
                        image: 'assets/images/history.png',
                        message: 'You haven\'t viewed any products yet.',
                        buttonText: 'Browse Now',
                        onRedirect: () => _goToHomePage(context),
                      );
                    }

                    return ListView.separated(
                      itemCount: state.viewedItems.length,
                      separatorBuilder: (ctx, idx) => const SizedBox(height: 5),
                      itemBuilder: (ctx, idx) => GCRProductCard.viewed(
                        product: state.viewedItems.values.toList()[idx],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
