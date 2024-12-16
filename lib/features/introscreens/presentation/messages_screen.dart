import 'package:flutter/material.dart';
import 'package:rafiq_application/features/introscreens/presentation/chat_screen.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                const SizedBox(height: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(),
                        ));
                  },
                  child: Container(
                    height: 88,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 16, top: 8, bottom: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(64),
                            child: Image.asset('images/courses/aref.png'),
                          ),
                        ),
                        const Expanded(
                          // Ensures the Column takes remaining space
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mohammed Aref',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 1, // Prevent overflow
                                softWrap: false, // Prevent wrapping
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
                                maxLines: 1, // Prevent overflow
                                softWrap: false, // Prevent wrapping
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: const Color(0xff071952)),
                                child: const Center(
                                  child: Text(
                                    '99',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const Text(
                                '4:32 am',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff999999),
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                const Divider(
                  color: Color(0xffeeeeee),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
