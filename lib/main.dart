import 'package:responsi_123200024/view/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valorant API',
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
