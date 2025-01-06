import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Center(
              child: CircleAvatar(
                backgroundImage:
                    AssetImage('images/courses/profile_picture.jpg'),
                radius: 64,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Ahmed Elsayed',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Student',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 14,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'images/social_media/linkedin_blk.png',
                    height: 40,
                    width: 40,
                  ),
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    side: const WidgetStatePropertyAll(
                      BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'images/social_media/facebook_blk.png',
                    height: 40,
                    width: 40,
                  ),
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    side: const WidgetStatePropertyAll(
                      BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'images/social_media/behance_blk.png',
                    height: 40,
                    width: 40,
                  ),
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    side: const WidgetStatePropertyAll(
                      BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'images/social_media/instagram_black.png',
                    height: 40,
                    width: 40,
                  ),
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    side: const WidgetStatePropertyAll(
                      BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Row(
              children: [
                Text(
                  'About me',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff071952)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const IntrinsicHeight(
              child: Text(
                """Hello! My name is Ahmed Hamoda, and I am a passionate engineering student in my final year, with a strong focus on software development. I enjoy building mobile applications using Flutter and Dart, and I'm currently working on an educational app to enhance learning experiences.""",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  height: 1.2,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18),
        child: SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: () {},
            child: const Text('Message me'),
          ),
        ),
      ),
    );
  }
}
