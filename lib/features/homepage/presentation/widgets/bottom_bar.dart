import 'package:capstone_project/core/constants/icons.dart';
import 'package:capstone_project/core/theme/_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: CapstoneColors.blackPrimary,
      unselectedItemColor: CapstoneColors.white,
      selectedItemColor:
          CapstoneColors.purple, // Set the selected item color to purple
      items: [
        BottomNavigationBarItem(
          icon: Icon(CapstoneIcons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(CapstoneIcons.add),
          label: 'Create Post',
        ),
        BottomNavigationBarItem(
          icon: Icon(CapstoneIcons.profile),
          label: 'Profile',
        ),
      ],
    );
  }
}
