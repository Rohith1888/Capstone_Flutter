import 'package:flutter/material.dart';
import '../responsive/responsive_singin_page.dart';

class SignUpForm extends StatefulWidget {
  final bool showWelcome;
  const SignUpForm({super.key, required this.showWelcome});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _monthName(int month) {
    const months = [
      '', 'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month];
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dobController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo and title
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
        const Text(
          'Sign up',
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Sign up to learn like a game',
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey[600],
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 32),

        // Form
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Your Name', style: TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 6),
              TextFormField(
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 18),

              const Text('Date of Birth', style: TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 6),
              TextFormField(
                controller: _dobController,
                readOnly: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please select your date of birth';
                  }
                  return null;
                },
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _dobController.text =
                          "${pickedDate.day} ${_monthName(pickedDate.month)} ${pickedDate.year}";
                    });
                  }
                },
                decoration: const InputDecoration(
                  isDense: true,
                  prefixIcon: Icon(Icons.calendar_today, size: 20),
                  hintText: 'Select your birth date',
                ),
              ),
              const SizedBox(height: 18),

              const Text('Email', style: TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 6),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  isDense: true,
                  hintText: 'jonas_kahnwald@gmail.com',
                ),
              ),
              const SizedBox(height: 18),

              const Text('Password', style: TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 6),
              TextFormField(
                controller: _passwordController,
                obscureText: !_passwordVisible,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () => setState(() => _passwordVisible = !_passwordVisible),
                  ),
                ),
              ),
              const SizedBox(height: 20),

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
                      // Submit logic
                      print("Name: ${_nameController.text}");
                      print("DOB: ${_dobController.text}");
                      print("Email: ${_emailController.text}");
                      print("Password: ${_passwordController.text}");

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Sign up successful!')),
                      );

                      // Clear after success
                      _nameController.clear();
                      _dobController.clear();
                      _emailController.clear();
                      _passwordController.clear();
                    }
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 12),

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

              SizedBox(
                height: 45,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/icons/google_logo.png',
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(width: 10),
                      const Text('Continue with Google'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Already have an account? ',
                style: TextStyle(fontSize: 14)),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResponsiveSignInPage(),
                  ),
                );
              },
              child: const Text(
                'Sign in',
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
