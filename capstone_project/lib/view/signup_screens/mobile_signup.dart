import 'package:flutter/material.dart';

import '../main/signupform.dart';

class MobileSignUp extends StatelessWidget {
  const MobileSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: SignUpForm(showWelcome: true),
            ),
          ),
        ),
      ),
    );
  }
}