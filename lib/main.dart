import 'package:flutter/material.dart';
import 'pages/login_page.dart'; // Correct import for the login page
import 'package:intl/date_symbol_data_local.dart';

void main() {
  // Initialize the date formatting before running the app
  initializeDateFormatting().then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Holistic Lifestyle Coach',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const LoginPage(), // Set the initial page as LoginPage
    );
  }
}
