import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController dobController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController aboutMeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Change Avatar
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 64,
                    // backgroundColor: Color(0xff37B7C3),
                    child: CircleAvatar(
                      // backgroundColor: Color(0xff37B7C3),
                      radius: 60,
                      backgroundImage: AssetImage(
                          'images/courses/profile_picture.jpg'), // Placeholder image
                    ),
                  ),
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xff071952),
                            strokeAlign: BorderSide.strokeAlignCenter,
                            width: 3),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: IconButton(
                      onPressed: () {
                        // Implement functionality to change avatar
                      },
                      icon: const Icon(Icons.camera_alt, color: Color(0xff071952)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Change Name
            const Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                // border: OutlineInputBorder(),
                hintText: 'Enter your name',
              ),
            ),
            const SizedBox(height: 16),

            // Change Date of Birth
            const Text('Date of Birth',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: dobController,
              readOnly: true,
              decoration: const InputDecoration(
                // border: OutlineInputBorder(),
                hintText: 'Select your date of birth',
                suffixIcon: Icon(Icons.calendar_today),
              ),
              onTap: () {
                // Open date picker
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                ).then((selectedDate) {
                  if (selectedDate != null) {
                    dobController.text =
                        '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
                  }
                });
              },
            ),
            const SizedBox(height: 16),

            // Change Email
            const Text('Email', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                // border: OutlineInputBorder(),
                hintText: 'Enter your email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),

            // Change Phone Number
            const Text('Phone Number',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                // border: OutlineInputBorder(),
                hintText: 'Enter your phone number',
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),

            // Add About Me
            const Text('About Me',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: aboutMeController,
              maxLines: 4,
              decoration: const InputDecoration(
                // border: OutlineInputBorder(),
                hintText: 'Write something about yourself',
              ),
            ),
            const SizedBox(height: 20),

            // Update Button
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  // Handle update logic
                },
                child: const Text('Update Profile'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
