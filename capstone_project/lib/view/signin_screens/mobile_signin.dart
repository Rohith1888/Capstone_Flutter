import 'package:flutter/material.dart';
import '../main/signinform.dart';

class MobileSignIn extends StatelessWidget {
  const MobileSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: SignInForm(showSubtitle: true),
            ),
          ),
        ),
      ),
    );
  }
}
