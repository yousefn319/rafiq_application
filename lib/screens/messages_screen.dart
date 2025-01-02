import 'package:flutter/material.dart';
import 'package:rafiq/screens/chat_screen.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  int selectedButton = 1; // Moved outside the build method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 12),
              SearchAnchor(
                builder: (BuildContext context, SearchController controller) {
                  return SearchBar(
                    hintText: 'Search any chats',
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(color: Colors.grey),
                      ),
                    ),
                    controller: controller,
                    padding: const WidgetStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    // Remove shadow by ensuring elevation is 0
                    elevation: const WidgetStatePropertyAll(0),
                    onTap: () {
                      controller.openView();
                    },
                    onChanged: (_) {
                      controller.openView();
                    },
                    leading: const Icon(Icons.search),
                  );
                },
                suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
                  return List<ListTile>.generate(5, (int index) {
                    final String item = 'item $index';
                    return ListTile(
                      title: Text(item),
                      onTap: () {
                        setState(() {
                          controller.closeView(item);
                        });
                      },
                    );
                  });
                },
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: selectedButton == 1
                            ? Colors.white
                            : const Color(0xff088395),
                        backgroundColor: selectedButton == 1
                            ? const Color(0xff088395)
                            : Colors.white,
                        minimumSize: const Size(0, 44),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: Color(0xff088395)),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedButton = 1;
                        });
                      },
                      child: const Text(
                        'Messages',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: selectedButton == 2
                            ? Colors.white
                            : const Color(0xff088395),
                        backgroundColor: selectedButton == 2
                            ? const Color(0xff088395)
                            : Colors.white,
                        minimumSize: const Size(0, 44),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: Color(0xff088395)),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedButton = 2;
                        });
                      },
                      child: const Text(
                        'Groups',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (selectedButton == 1)
                SizedBox(
                  height: MediaQuery.sizeOf(context).height -
                      162, // Adjust as needed
                  child: ListView.builder(
                    itemCount: 10,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const SizedBox(height: 4),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ChatScreen(),
                                ),
                              );
                            },
                            child: SizedBox(
                              height: 88,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 16, top: 8, bottom: 8),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(64),
                                      child: Image.asset(
                                        'images/courses/aref.png',
                                        height: 64,
                                        width: 64,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Mohammed Aref',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          maxLines: 1,
                                          softWrap: false,
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'you must watch the second lecture, apply it, and study it well',
                                          style: TextStyle(
                                            color: Color(0xff999999),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          maxLines: 1,
                                          softWrap: false,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: const Color(0xff071952),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              '99',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          '4:32 am',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff999999),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Divider(color: Color(0xffeeeeee)),
                        ],
                      );
                    },
                  ),
                ),
              if (selectedButton == 2)
                SizedBox(
                  height: MediaQuery.sizeOf(context).height -
                      162, // Adjust as needed
                  child: ListView.builder(
                    itemCount: 10,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const SizedBox(height: 4),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ChatScreen(),
                                ),
                              );
                            },
                            child: SizedBox(
                              height: 88,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 16),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(64),
                                        child: const Icon(
                                          Icons.group_outlined,
                                          size: 34,
                                          color: Color(0xff071952),
                                        )),
                                  ),
                                  const Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Course Group',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          maxLines: 1,
                                          softWrap: false,
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'you must watch the second lecture, apply it, and study it well',
                                          style: TextStyle(
                                            color: Color(0xff999999),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          maxLines: 1,
                                          softWrap: false,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: const Color(0xff071952),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              '99',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          '4:32 am',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff999999),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Divider(color: Color(0xffeeeeee)),
                        ],
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
