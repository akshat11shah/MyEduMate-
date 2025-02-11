import 'package:flutter/material.dart';
import 'package:charusat/categories.dart';
import 'package:charusat/login.dart'; // Import your login screen

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyLogin(),
      routes: {
        'categories': (context) => const CategoriesScreen(),
      },
    );
  }
}
