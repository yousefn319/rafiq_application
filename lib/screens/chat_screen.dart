import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> _messages =
      []; // List to store messages with timestamps
  final TextEditingController _controller =
      TextEditingController(); // Controller for text input

  void _sendMessage() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        _messages.add({
          'message': _controller.text.trim(),
          'time': DateFormat('hh:mm a').format(DateTime.now()), // Add timestamp
        });
      });
      _controller.clear(); // Clear the input field
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(48),
              child: Image.asset(
                'images/courses/aref.png',
                height: 54,
                width: 54,
              ),
            ),
            const SizedBox(width: 16),
            const Text(
              'Mohammed Aref',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              reverse: true, // Show the latest message at the bottom
              itemBuilder: (context, index) {
                final message = _messages[_messages.length - 1 - index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Align(
                    alignment:
                        AlignmentDirectional.centerEnd, // Align message to the right
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xff088395),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            message['message'] ?? '',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          message['time'] ?? '',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Color(0xffd0d0d0), // Border color
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Color(
                              0xffd0d0d0), // Border color when the field is enabled
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Color(
                              0xff088395), // Border color when the field is focused
                          width: 2.0, // Optional: Change the width for focus
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: Color(0xff088395),
                  ),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
