import 'package:flutter/material.dart';
import 'package:rafiq_application/features/introscreens/presentation/chat_screen.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
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
                          // Ensures the text can take remaining space
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Notification label',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 1, // Prevents overflow
                                softWrap: false, // Prevents wrapping
                              ),
                              SizedBox(height: 4),
                              Text(
                                'you must watch the second lecture, apply it, and study it well',
                                style: TextStyle(
                                  color: Color(0xff999999),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 1, // Prevents overflow
                                softWrap: false, // Prevents wrapping
                              ),
                              Text(
                                'Jun 23,2020',
                                style: TextStyle(
                                  color: Color(0xff999999),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
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
                const Divider(
                  color: Color(0xffeeeeee),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
