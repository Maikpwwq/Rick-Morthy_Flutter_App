import 'package:flutter/material.dart';

class DetailedCard extends StatefulWidget {
  const DetailedCard({Key? key}) : super(key: key);

  @override
  _DetailedCardState createState() => _DetailedCardState();
}

class _DetailedCardState extends State<DetailedCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('DetailedCard'),
      ),
    );
  }
}
