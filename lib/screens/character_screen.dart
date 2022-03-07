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
            height: 450,
            child: FutureBuilder<CharacterList>(
              future: futureCharacter,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // List<Character> personajes = (snapshot.data! as dynamic).characters.map((e) => e.image.toString());
                  // print('This is snapshot: {$personajes}');
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
                        // Image (
                        //   image: NetworkImage(
                        //       'https://images.unsplash.com/photo-1594075855177-c9ccafed8e54?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
                        //   ),
                        //   fit: BoxFit.cover,
                        // ),
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
