import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:rick_morthy_flutter_app/models/character.dart';

class HttpMethods {
  final String url = 'https://rickandmortyapi.com/';

  Future<Character> consultCharacter(String characterId) async {
    final response = await http.get(Uri.parse(url+'api/character/'+ characterId ));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      // print('consultCharacter:');
      // print(jsonResponse);
      Character currentCharacter = Character.fromJson(jsonResponse);
      return currentCharacter;
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  }

  //Future
  Future<CharacterList> consultCharacters() async {
    final response = await http.get(Uri.parse(url+'api/character/'+'?page=2'));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body)['results'];
      // print('consultCharacters:');
      // print(jsonResponse);
      CharacterList characterList = CharacterList.fromJson(jsonResponse);
      return characterList;
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<CharacterList> filterCharactersByName(String characterSearch) async {
    final response = await http.get(Uri.parse(url+'api/character/?name'+ characterSearch));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body)['results'];
      // print('consultCharactersByName:');
      // print(jsonResponse);
      CharacterList characterList = CharacterList.fromJson(jsonResponse);
      return characterList;
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  }
}