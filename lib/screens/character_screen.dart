import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rick_morthy_flutter_app/models/character.dart';
import 'package:rick_morthy_flutter_app/resources/http_methods.dart';
import 'package:rick_morthy_flutter_app/widgets/character_card.dart';

class CharacterScreen extends StatefulWidget {
  //final snap;
  const CharacterScreen({
    Key? key,
    //required this.snap,
  }) : super(key: key);

  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late Future<CharacterList> futureCharacter;

  @override
  void initState() {
    super.initState();
    // loadCharacters();
    futureCharacter = HttpMethods().consultCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personajes Rick & Morthy'),
      ),
      body: ListView(
        // shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('CharacterScreen'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 480,
            child: FutureBuilder<CharacterList>(
              future: futureCharacter,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 1,
                    ),
                    shrinkWrap: true,
                    itemCount: (snapshot.data! as dynamic).characters.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child:
                        CharacterCard(
                          snap: (snapshot.data! as dynamic).characters[index],
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                // By default, show a loading spinner.
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
