import 'dart:io';
import 'package:capstone_project/core/bases/widgets/atoms/button.dart';
import 'package:capstone_project/core/bases/widgets/atoms/text_field.dart';
import 'package:capstone_project/core/bases/widgets/molecules/capstone_textfield.dart';
import 'package:capstone_project/core/constants/assets.dart';
import 'package:capstone_project/core/environments/endpoints.dart';
import 'package:capstone_project/core/extensions/text_style_extensions.dart';
import 'package:capstone_project/core/theme/_themes.dart';
import 'package:capstone_project/features/main/profile/data/model/profile_model.dart';
import 'package:capstone_project/features/main/profile/data/repository/profile_repository.dart';
import 'package:capstone_project/features/main/profile/presentation/bloc/profile_bloc.dart';
import 'package:capstone_project/features/main/profile/presentation/bloc/profile_event.dart';
import 'package:capstone_project/features/main/profile/presentation/bloc/profile_state.dart';
import 'package:capstone_project/services/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unicons/unicons.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _bioController;
  String? selectedImagePath;
  late String firstName = '';
  late String lastName = '';
  late String bio = '';
  late String profileImageUrl = '';
  late ProfileBloc _profileBloc;

  @override
  void initState() {
    super.initState();
    _loadUserData();

    // Initialize the text controllers
    _nameController = TextEditingController();

    _bioController = TextEditingController();
    _profileBloc = ProfileBloc();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    _profileBloc.close();
    super.dispose();
  }

  Future<void> _loadUserData() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      firstName = sharedPreferences.getString('firstName') ?? '';
      lastName = sharedPreferences.getString('lastName') ?? '';
      bio = sharedPreferences.getString('bio') ?? '';
      profileImageUrl = sharedPreferences.getString('profileImageUrl') ?? '';
    });
    _nameController.text = '$firstName $lastName';
    _bioController.text = bio;
    selectedImagePath = profileImageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _profileBloc,
        child: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is EditProfileSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );

              Navigator.pop(context);
            } else if (state is ProfileError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
          },
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                'Edit Profile',
                style: CapstoneFontTheme.white.mainHeader,
              ),
              const SizedBox(
                height: 29,
              ),
              Center(
                child: GestureDetector(
                  onTap: _selectImageFromGallery,
                  child: Stack(
                    children: [
                      _buildProfileImage(),
                      const Positioned(
                        bottom: 0,
                        right: 5,
                        child: Icon(UniconsLine.pen),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Name text field here
              CapstoneTextField(
                controller: _nameController,
                labelText: 'Name',
                hintText: '$firstName $lastName',
              ),
              const SizedBox(height: 15),
              CapstoneTextField(
                controller: _bioController,
                labelText: 'Bio',
                hintText: bio,
              ),
              Spacer(),
              SizedBox(
                width: 326,
                child: CapstonPurpleButtonPrimary(
                  onTap: _editProfile,
                  text: 'Edit Profile',
                ),
              ),
              SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    if (selectedImagePath != null && selectedImagePath!.isNotEmpty) {
      if (selectedImagePath!.startsWith('http://') ||
          selectedImagePath!.startsWith('https://')) {
        final encodedImagePath = Uri.encodeFull(selectedImagePath!);
        return ClipOval(
          child: SizedBox(
            height: 100,
            width: 100,
            child: Image.network(
              encodedImagePath, // Use the encoded URL
              fit: BoxFit.cover,
            ),
          ),
        );
      } else {
        // Check if selectedImagePath is not null and it's a local file
        return ClipOval(
          child: SizedBox(
            height: 100,
            width: 100,
            child: Image.file(
              File(selectedImagePath!),
              fit: BoxFit.cover,
            ),
          ),
        );
      }
    } else {
      // Show a default profile image if selectedImagePath is null or empty
      return ClipOval(
        child: SizedBox(
          height: 100,
          width: 100,
          child: Image.network(
            Endpoints.defaultProfile, // URL of the network image
            fit: BoxFit.cover, // You can adjust the fit as needed
          ),
        ),
      );
    }
  }

  Future<void> _selectImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        selectedImagePath = pickedImage.path;
      });
    }
  }

  void _editProfile() {
    final fullName = _nameController.text;
    final nameParts = fullName.split(' ');
    String firstName = '';
    String lastName = '';

    if (nameParts.isNotEmpty) {
      firstName = nameParts[0];
    }
    if (nameParts.length > 1) {
      lastName = nameParts.sublist(1).join(' ');
    }
    final updatedProfile = ProfileModel(
      firstName: firstName,
      lastName: lastName,
      bio: _bioController.text,
      picture: profileImageUrl
    );
    _profileBloc.add(UpdateProfileEvent(updatedProfile)); // Use _profileBloc
    SharedPreferencesUtil.updateUserPreferences(
      firstName: firstName,
      lastName: lastName,
      bio: _bioController.text,
      profileImageUrl: selectedImagePath,
    );
  }
}
