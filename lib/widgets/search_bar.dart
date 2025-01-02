import 'package:flutter/material.dart';

class SearchBarA extends StatefulWidget {
  const SearchBarA({super.key});

  @override
  _SearchBarAState createState() => _SearchBarAState();
}

class _SearchBarAState extends State<SearchBarA> {
  final TextEditingController _searchController = TextEditingController();

  void _onSearch(String query) {
    // Perform your search logic here
    print("Searching for: $query");
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
          child: TextField(
              controller: _searchController,
              onSubmitted: (value) => _onSearch(value.trim()),
              decoration: const InputDecoration(
                  labelText: 'Search courses',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  suffixIcon: Icon(Icons.mic_none),
                  prefixIcon: Icon(Icons.search)))),
      const SizedBox(width: 10),
      IconButton(
        onPressed: () {},
        style: IconButton.styleFrom(
            minimumSize: const Size(56, 56),
            foregroundColor: theme.colorScheme.onPrimary,
            backgroundColor: theme.colorScheme.primary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        icon: const Icon(Icons.filter_alt_outlined),
      )
    ]);
  }
}
