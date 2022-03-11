import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rick_morthy_flutter_app/widgets/detailed_card.dart';

import '../models/character.dart';
import '../resources/http_methods.dart';

class CharacterCard extends StatefulWidget {
  final snap;

  const CharacterCard({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  _CharacterCardState createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  late Future<Character> characterInfo;

  @override
  void initState() {
    super.initState();
    loadInfo();
  }

  void loadInfo() async {
    try {
      // print('here character names consulted:');
      // print(widget.snap.name);
    } catch (e) {
      print(e.toString());
    }
  }

  openDetail(CharacterId) async {
    final characterId = CharacterId.toString();
    print('here character id consulted:' + characterId);
    characterInfo = HttpMethods().consultCharacter(characterId);
    // print(characterInfo);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return FutureBuilder<Character>(
              future: characterInfo,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    child: DetailedCard(
                      snap: (snapshot.data! as dynamic),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                // By default, show a loading spinner.
                return const Center(
                  child: CircularProgressIndicator(),
                );
              });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Container(
        decoration: BoxDecoration(border: Border.all()),
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                      ),
                      child: Text(
                        widget.snap.name, // 'Personaje'
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await openDetail(widget.snap.id);
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.13,
                            // width: double.infinity,
                            child: Image.network(
                              widget.snap.image, // 'https://images.'
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
