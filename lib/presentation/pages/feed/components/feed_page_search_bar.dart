import 'package:flutter/material.dart';

class FeedPageSearchBar extends StatefulWidget {
  const FeedPageSearchBar({super.key});

  @override
  State<FeedPageSearchBar> createState() => _FeedPageSearchBarState();
}

class _FeedPageSearchBarState extends State<FeedPageSearchBar> {
  late final TextEditingController _searchController;

  void _clearText() {
    _searchController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Search products',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: _searchController.text.isEmpty
            ? null
            : IconButton(
                onPressed: _clearText,
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
      onChanged: (value) => setState(() {}),
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
