import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq_application/features/introscreens/presentation/get_started.dart';
import 'package:rafiq_application/features/localization/app_localizations.dart';
import 'package:rafiq_application/features/localization/cubit/locale_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xffd0d0d0))),
                  height: 88,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(64),
                              child: Image.asset(
                                  'images/courses/profile_picture.jpg'),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: screenWidth * 0.4,
                                child: const Text(
                                  'ahmed elsayed hamoda',
                                  style: TextStyle(
                                      color: Color(0xff071952),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      overflow: TextOverflow.visible),
                                  maxLines: 1, // Prevent overflow
                                  // softWrap: false,
                                ),
                              ),
                              SizedBox(
                                width: screenWidth * 0.4,
                                child: const Text(
                                  'ahmdhamoda11@gmail.com',
                                  style: TextStyle(
                                      color: Color(0xff999999),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Color(0xff088395),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ListTile(
                onTap: () {},
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                leading: const Icon(
                  Icons.notifications_none_outlined,
                  color: Color(0xff088395),
                  size: 32,
                ),
                title: const Text(
                  'Notifications',
                  style: TextStyle(
                    color: Color(0xff088395),
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Color(0xff088395),
                ),
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Color(0xffd0d0d0)),
                ),
              ),
              const SizedBox(height: 12),
              ListTile(
                onTap: () {},
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                leading: const Icon(
                  Icons.wallet_outlined,
                  color: Color(0xff088395),
                  size: 32,
                ),
                title: const Text(
                  'Payment Option',
                  style: TextStyle(
                    color: Color(0xff088395),
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Color(0xff088395),
                ),
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Color(0xffd0d0d0)),
                ),
              ),
              const SizedBox(height: 12),
              ListTile(
                onTap: () {},
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                leading: const Icon(
                  Icons.security_outlined,
                  color: Color(0xff088395),
                  size: 32,
                ),
                title: const Text(
                  'Security',
                  style: TextStyle(
                    color: Color(0xff088395),
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Color(0xff088395),
                ),
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Color(0xffd0d0d0)),
                ),
              ),
              const SizedBox(height: 12),
              ListTile(
                onTap: () => _showLanguagePicker(context),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                leading: const Icon(
                  Icons.language_outlined,
                  color: Color(0xff088395),
                  size: 32,
                ),
                title: const Text(
                  'Language',
                  style: TextStyle(
                    color: Color(0xff088395),
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Color(0xff088395),
                ),
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Color(0xffd0d0d0)),
                ),
              ),
              const SizedBox(height: 12),
              ListTile(
                onTap: () {},
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                leading: const Icon(
                  Icons.dark_mode_outlined,
                  color: Color(0xff088395),
                  size: 32,
                ),
                title: const Text(
                  'Dark Mode',
                  style: TextStyle(
                    color: Color(0xff088395),
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Color(0xff088395),
                ),
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Color(0xffd0d0d0)),
                ),
              ),
              const SizedBox(height: 12),
              ListTile(
                onTap: () {},
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                leading: const Icon(
                  Icons.text_snippet_outlined,
                  color: Color(0xff088395),
                  size: 32,
                ),
                title: const Text(
                  'Terms & Conditions',
                  style: TextStyle(
                    color: Color(0xff088395),
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Color(0xff088395),
                ),
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Color(0xffd0d0d0)),
                ),
              ),
              const SizedBox(height: 12),
              ListTile(
                onTap: () {},
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                leading: const Icon(
                  Icons.help_center_outlined,
                  color: Color(0xff088395),
                  size: 32,
                ),
                title: const Text(
                  'Help center',
                  style: TextStyle(
                    color: Color(0xff088395),
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Color(0xff088395),
                ),
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Color(0xffd0d0d0)),
                ),
              ),
              const SizedBox(height: 12),
              ListTile(
                onTap: () {},
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                leading: const Icon(
                  Icons.local_post_office_outlined,
                  color: Color(0xff088395),
                  size: 32,
                ),
                title: const Text(
                  'Intive Friends',
                  style: TextStyle(
                    color: Color(0xff088395),
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Color(0xff088395),
                ),
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Color(0xffd0d0d0)),
                ),
              ),
              const SizedBox(height: 12),
              ListTile(
                contentPadding: EdgeInsets.zero,
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => GetStarted()),
                    (route) => false, // Remove all routes
                  );
                },
                leading: const Icon(
                  Icons.logout_outlined,
                  size: 32,
                  color: Color(0xffBD0F0F),
                ),
                title: const Text(
                  'Log out',
                  style: TextStyle(
                    color: Color(0xffBD0F0F),
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void _showLanguagePicker(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "ChooseLanguage".tr(context),
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.language, color: Colors.black),
              title:
                  const Text('English', style: TextStyle(color: Colors.black)),
              onTap: () {
                context.read<LocaleCubit>().changeLanguage('en');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.language, color: Colors.black),
              title:
                  const Text('العربية', style: TextStyle(color: Colors.black)),
              onTap: () {
                context.read<LocaleCubit>().changeLanguage('ar');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
