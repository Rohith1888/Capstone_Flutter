
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../responsive//responsive_singin_page.dart';

class LearnHubApp extends StatelessWidget {
  const LearnHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LearnHub',
      debugShowCheckedModeBanner: false,
     theme: ThemeData(
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: const Color(0xFFF8F8FF),
  inputDecorationTheme: InputDecorationTheme(
    border: const OutlineInputBorder(),
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    hintStyle: TextStyle(fontSize: 14, color: Colors.grey[400]), // Light hint text
  ),
),

      home: const ResponsiveSignInPage(),
    );
  }
}