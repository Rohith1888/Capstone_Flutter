import 'package:flutter/material.dart';
import 'package:capstone_project/view/signin_screens/desktop_signin.dart';
import 'package:capstone_project/view/signin_screens/mobile_signin.dart';

class ResponsiveSignInPage extends StatelessWidget {
  const ResponsiveSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 700) {
          return const DesktopSignIn();
        } else {
          return const MobileSignIn();
        }
      },
    );
  }
}
