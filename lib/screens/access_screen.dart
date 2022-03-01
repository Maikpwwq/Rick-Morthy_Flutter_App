import 'package:flutter/material.dart';

class AccessScreen extends StatefulWidget {
  const AccessScreen({Key? key}) : super(key: key);

  @override
  _AccessScreenState createState() => _AccessScreenState();
}

class _AccessScreenState extends State<AccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('AccessScreen'),
      ),
    );
  }
}
