import 'package:flutter/material.dart';

import '../main/signupform.dart';

class DesktopSignUp extends StatelessWidget {
  const DesktopSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000), // Fixed width limit
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 10),
              ],
            ),
            child: Row(
              children: [
                // Left - Form (Scrollable)
                Expanded(
                  flex: 5,
                  child: SingleChildScrollView(  // Makes the form scrollable
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                      

                      child: SignUpForm(showWelcome: false),
                    ),
                  ),
                ),
                // Right - Image (Fixed)
                Expanded(
                  flex: 5,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                      'assets/images/signup_and_signin/wave_bg.png', // Ensure you have this image in your assets
                      fit: BoxFit.cover,
                      height: double.infinity, // Ensures it covers the full height
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}