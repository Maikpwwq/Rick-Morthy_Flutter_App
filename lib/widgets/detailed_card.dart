import 'package:flutter/material.dart';

class DetailedCard extends StatefulWidget {
  final snap;

  const DetailedCard({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  _DetailedCardState createState() => _DetailedCardState();
}

class _DetailedCardState extends State<DetailedCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: ,
        title: Text(
          widget.snap.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blueAccent,
              backgroundImage: NetworkImage(widget.snap.image,),
              radius: 40,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 15),
              child: Text('Personaje: ${widget.snap.id}. ${widget.snap.name}'),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 15),
              child: Text('Estado: ${widget.snap.status}'),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 15),
              child: Text('Especie: ${widget.snap.species}'),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 15),
              child: Text('Genero: ${widget.snap.gender}'),
            ),
          ],
        ),
      ),
    );
  }
}
