import 'package:capstone_project/core/theme/_themes.dart';
import 'package:capstone_project/features/create_post/presentation/pages/create_post_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageHeader extends StatefulWidget {
  const HomePageHeader({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageHeaderState createState() => _HomePageHeaderState();
}

class _HomePageHeaderState extends State<HomePageHeader> {
  String _firstName = ''; // Initialize with empty strings
  String _lastName = ''; // Initialize with empty strings
  String _bio = '';
  String _profileUrl = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final firstName = sharedPreferences.getString('firstName') ?? '';
    final lastName = sharedPreferences.getString('lastName') ?? '';
    final bio = sharedPreferences.getString('bio') ?? '';
    final profileUrl = sharedPreferences.getString('profileUrl') ?? '';

    setState(() {
      _firstName = firstName;
      _lastName = lastName;
      _bio = bio;
      _profileUrl = profileUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundColor: CapstoneColors.purple,
          backgroundImage: _profileUrl == '' ? null : NetworkImage(_profileUrl),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$_firstName $_lastName", // Display both first name and last name
              style: CapstoneFontTheme.white,
            ),
            Text(
              _bio,
              style: CapstoneFontTheme.greySecondary,
            )
          ],
        ),
        IconButton(
            onPressed: () {
              nav.push(const CreatePostPage());
            },
            icon: const Icon(
              Icons.add_rounded,
              color: CapstoneColors.purple,
            ))
      ],
    );
  }
}
