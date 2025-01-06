import 'package:flutter/material.dart';

class ReadMoreDescription extends StatefulWidget {
  final String description;
  final int trimLength; // Number of characters to show before "Read More"

  const ReadMoreDescription({
    super.key,
    required this.description,
    this.trimLength = 100,
  });

  @override
  State<ReadMoreDescription> createState() => _ReadMoreDescriptionState();
}

class _ReadMoreDescriptionState extends State<ReadMoreDescription> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final text = widget.description;

    // Determine the text to display based on whether it's expanded or not
    final displayText = isExpanded || text.length <= widget.trimLength
        ? text
        : '${text.substring(0, widget.trimLength)}...';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          displayText,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        if (text.length > widget.trimLength)
          TextButton(
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded; // Toggle the expanded state
              });
            },
            child: Text(
              isExpanded ? 'Read Less' : 'Read More',
              style: const TextStyle(color: Colors.blue),
            ),
          ),
      ],
    );
  }
}
