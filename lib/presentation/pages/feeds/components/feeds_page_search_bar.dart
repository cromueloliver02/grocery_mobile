import 'package:flutter/material.dart';

import '../../../../business_logic/cubits/cubits.dart';

class FeedsPageSearchBar extends StatefulWidget {
  const FeedsPageSearchBar({super.key});

  @override
  State<FeedsPageSearchBar> createState() => _FeedsPageSearchBarState();
}

class _FeedsPageSearchBarState extends State<FeedsPageSearchBar> {
  late final TextEditingController _searchController;

  void _clearText(BuildContext ctx) {
    final SearchProductCubit searchProdCubit = ctx.read<SearchProductCubit>();
    searchProdCubit.clearSearchResults();
    searchProdCubit.clearKeywords();
    _searchController.clear();
    FocusScope.of(context).unfocus();
    setState(() {});
  }

  void _onFocusChange(bool value) {
    if (!value && _searchController.text.isEmpty) {
      context.read<SearchProductCubit>().clearSearchResults();
    }
  }

  void _onChanged(BuildContext ctx, {required String value}) {
    final SearchProductCubit searchProdCubit = ctx.read<SearchProductCubit>();

    if (value.isNotEmpty) {
      searchProdCubit.setKeywords(value);
    } else {
      searchProdCubit.resetSearchResults();
    }

    setState(() {});
  }

  void _onEditingComplete(BuildContext ctx) {
    context.read<SearchProductCubit>().searchProducts(_searchController.text);
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: _onFocusChange,
      child: TextField(
        controller: _searchController,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: 'Search products',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _searchController.text.isEmpty
              ? null
              : IconButton(
                  onPressed: () => _clearText(context),
                  color: Colors.red,
                  icon: const Icon(Icons.close),
                ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.greenAccent,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.greenAccent,
              width: 1,
            ),
          ),
        ),
        onChanged: (value) => _onChanged(context, value: value),
        onEditingComplete: () => _onEditingComplete(context),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
