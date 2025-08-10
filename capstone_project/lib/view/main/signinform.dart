import 'package:flutter/material.dart';

import '../responsive/responsive_signup_page.dart';

class SignInForm extends StatefulWidget {
  final bool showSubtitle; // Show subtitle on mobile
  const SignInForm({super.key, required this.showSubtitle});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _keepLoggedIn = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo + App name
        Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: const Color(0xFF312ECB),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.school, color: Colors.white),
            ),
            const SizedBox(width: 10),
            const Text(
              'LearnHub',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 28),

        // Title & Subtitle
        const Text(
          'Sign in',
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          widget.showSubtitle
              ? 'Sign up to learn like a game'
              : 'Please login to continue to your account.',
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 32),

        // Form
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Email', style: TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 6),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'jonas_kahnwald@gmail.com',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Enter your email';
                  return null;
                },
              ),
              const SizedBox(height: 18),

              const Text('Password', style: TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 6),
              TextFormField(
                controller: _passwordController,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () =>
                        setState(() => _passwordVisible = !_passwordVisible),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Enter your password';
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Keep me logged in
              Row(
                children: [
                  Checkbox(
                    value: _keepLoggedIn,
                    onChanged: (value) {
                      setState(() => _keepLoggedIn = value ?? false);
                    },
                  ),
                  const Text('Keep me logged in'),
                ],
              ),
              const SizedBox(height: 12),

              // Sign in button
              SizedBox(
                height: 46,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF316CFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Signing in...')),
                      );
                    }
                  },
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Divider
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey[300])),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('or', style: TextStyle(color: Colors.grey)),
                  ),
                  Expanded(child: Divider(color: Colors.grey[300])),
                ],
              ),
              const SizedBox(height: 12),

              // Google sign-in
              SizedBox(
                height: 45,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/icons/google_logo.png',
                    height: 20,
                  ),
                  label: const Text('Sign in with Google'),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),

        // Footer
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Need an account? ', style: TextStyle(fontSize: 14)),
            GestureDetector(
              onTap: () {
                Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ResponsiveSignUpPage(),
          ),
        );
              },
              child: const Text(
                'Create one',
                style: TextStyle(
                  color: Color(0xFF316CFF),
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
