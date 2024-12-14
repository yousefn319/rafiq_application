import 'package:flutter/material.dart';

class SearchBarA extends StatefulWidget {
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            controller: _searchController,
            cursorColor: const Color(0xff088395),
            onSubmitted: (value) {
              _onSearch(value.trim());
            },
            decoration: InputDecoration(
              labelText: 'Search courses',
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                  color: Color(0xff071952),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                gapPadding: BorderSide.strokeAlignCenter,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                  color: Color(0xff088395),
                ),
              ),
              suffixIcon: const Icon(Icons.mic_none),
              prefixIcon: const Icon(Icons.search),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 56, // Set height for square
          width: 56, // Set width equal to height for square
          decoration: BoxDecoration(
            color: const Color(0xff071952), // Background color
            borderRadius: BorderRadius.circular(8), // Rounded corners
          ),
          child: IconButton(
            onPressed: () {
              // Optional: Perform the search when the filter icon is pressed
              _onSearch(_searchController.text.trim());
            },
            icon: const Icon(
              Icons.filter_alt_outlined,
              color: Colors.white, // Icon color
            ),
          ),
        )
      ],
    );
  }
}
