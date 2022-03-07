import 'package:flutter/material.dart';
import 'package:rick_morthy_flutter_app/widgets/detailed_card.dart';

import '../models/character.dart';

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

  @override
  void initState() {
    super.initState();
    loadInfo();
  }

  void loadInfo() async {
    try {
      // Character snap = Character.fromJson(widget.snap);
      print(widget.snap.name);
    } catch (e) {
      print(e.toString());
    }
  }

  openDetail(int characterId) async {
    final CharacterId = characterId;
    print(CharacterId);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const DetailedCard(snap: 'hello detail'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            height: 110,
            padding: const EdgeInsets.symmetric(
              vertical: 1,
              horizontal: 10,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.snap.name, // 'Personaje'
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
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
                                height: MediaQuery.of(context).size.height * 0.30,
                                // width: double.infinity,
                                child: Image.network(
                                  widget.snap.image, // 'https://images.'
                                  fit: BoxFit.fitHeight,
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
        ],
      ),
    );
  }
}
