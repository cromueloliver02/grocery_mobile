import 'package:flutter/material.dart';

import '../../../business_logic/blocs/blocs.dart';
import '../../../utils/utils.dart';
import './components/viewed_recently_view.dart';

class ViewedRecentlyPage extends StatelessWidget {
  const ViewedRecentlyPage({super.key});

  void _viewedRecentlyListener(BuildContext ctx, ViewedRecentlyState state) {
    if (state.status == ViewedRecentlyStatus.failure) {
      FunctionHandler.showErrorDialog(ctx, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ViewedRecentlyBloc, ViewedRecentlyState>(
      listener: _viewedRecentlyListener,
      child: const ViewedRecentlyView(),
    );
  }
}
