import 'package:capstone_project/app.dart';
import 'package:capstone_project/core/bases/widgets/atoms/button.dart';
import 'package:capstone_project/core/constants/preferences_keys.dart';
import 'package:capstone_project/core/environments/endpoints.dart';
import 'package:capstone_project/core/extensions/text_style_extensions.dart';
import 'package:capstone_project/core/theme/_themes.dart';
import 'package:capstone_project/features/authentication/signin/presentation/pages/sign_in_page.dart';
import 'package:capstone_project/features/create_post/presentation/pages/create_post_page.dart';
import 'package:capstone_project/features/homepage/presentation/pages/home_page.dart';
import 'package:capstone_project/features/homepage/presentation/widgets/bottom_bar.dart';
import 'package:capstone_project/features/main/profile/presentation/pages/edit_profile_page.dart';
import 'package:capstone_project/services/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String firstName = '';
  late String lastName = '';
  late String bio = '';
  late String profileImageUrl = '';
  int _currentIndex = 2;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      firstName = sharedPreferences.getString('firstName') ?? '';
      lastName = sharedPreferences.getString('lastName') ?? '';
      bio = sharedPreferences.getString('bio') ?? '';
      profileImageUrl = sharedPreferences.getString('profileImageUrl') ?? '';
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Handle navigation based on the selected tab index
    if (index == 0) {
      // Navigate to Home Page
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else if (index == 1) {
      // Navigate to Create Post Page
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const CreatePostPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CapstoneColors.blackPrimary,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Text(
                'Profile',
                style: CapstoneFontTheme.white.mainHeader,
              ),
              const SizedBox(
                height: 25,
              ),
              CircleAvatar(
                  radius: 60.0,
                  backgroundImage: profileImageUrl == ''
                      ? const NetworkImage(Endpoints.defaultProfile)
                      : const NetworkImage(Endpoints.defaultProfile)),
              const SizedBox(height: 25.0),
              Text('$firstName $lastName',
                  style: CapstoneFontTheme.white.title),
              const SizedBox(height: 8.0),
              Text(
                bio,
                style: CapstoneFontTheme.white.captionBold,
              ),
              const Spacer(),
              SizedBox(
                  width: 326,
                  child: CapstonPurpleButtonPrimary(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const EditProfilePage(), // Replace with your EditProfilePage
                          ),
                        );
                      },
                      text: 'Edit Profile')),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                  width: 326,
                  child: CapstoneRedButtonPrimary(
                    onTap: () async {
                      await SharedPreferencesService.removeToken();
                      await SharedPreferencesService.removeKey(
                          PreferencesKeys.fcm);
                      nav.pushReplacement(const SignInPage());
                    },
                    text: 'Logout',
                  )),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
