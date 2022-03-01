import 'package:flutter/material.dart';
import 'package:rick_morthy_flutter_app/screens/access_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personajes Rick&Morthy',
      theme: ThemeData.light(),
      home: Scaffold(
          body: AccessScreen(),
      ),
    );
  }
}
