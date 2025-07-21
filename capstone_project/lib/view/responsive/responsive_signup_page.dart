import 'package:capstone_project/view/signup_screens/desktop_signup.dart';
import 'package:capstone_project/view/signup_screens/mobile_signup.dart';
import 'package:flutter/material.dart';



class ResponsiveSignUpPage extends StatelessWidget {
  const ResponsiveSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 700) {
        return const DesktopSignUp();
      } else {
        return const MobileSignUp();
      }
    });
  }
}
