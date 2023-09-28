import 'package:flutter/material.dart';

import '../../../../core/theme/_themes.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: CapstoneColors.blackPrimary,
        body: Column(
          children: [
            const Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(top: 40.0, left: 50, right: 50),
                child: (Text('onboarding'))
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: CapstoneColors.white,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 24,
                ),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
