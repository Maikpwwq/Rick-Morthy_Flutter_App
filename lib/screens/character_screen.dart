import 'package:flutter/material.dart';
import 'package:rick_morthy_flutter_app/widgets/character_card.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class CharacterScreen extends StatefulWidget {

  const CharacterScreen({
    Key? key,
  }) : super(key: key);

  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  final String url = 'https://rickandmortyapi.com/';

  Future<http.Response> consultApi() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;
      print('Number of books about http: $jsonResponse.');
      return response;
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personajes Rick & Morthy'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('CharacterScreen'),
                // CharacterCard(snap: )
                // GridView
              ],
            ),
          ),
        ],
      ),
    );
  }
}
