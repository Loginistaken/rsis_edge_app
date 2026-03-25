import 'package:flutter/material.dart';
import 'ui/login_screen.dart';

void main() {
  runApp(const RSISApp());
}

class RSISApp extends StatelessWidget {
  const RSISApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RSIS Edge Node App',
      home: LoginScreen(),
    );
  }
}
