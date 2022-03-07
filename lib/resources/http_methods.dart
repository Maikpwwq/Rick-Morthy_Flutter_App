import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:rick_morthy_flutter_app/models/character.dart';

class HttpMethods {
  final String url = 'https://rickandmortyapi.com/';

  // Future<Character> consultApi() async {
  //   final response = await http.get(Uri.parse(url+'api/character/'+'?page=2'));
  //   if (response.statusCode == 200) {
  //     final jsonResponse = jsonDecode(response.body)['results'];
  //     print(jsonDecode(response.body)['results']);
  //     return Character.fromJson(jsonResponse);
  //   } else {
  //     throw Exception('Request failed with status: ${response.statusCode}.');
  //   }
  // }

  //Future
  Future<CharacterList> consultCharacters() async {
    final response = await http.get(Uri.parse(url+'api/character/'+'?page=2'));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body)['results'];
      print(jsonResponse);
      CharacterList characterList = CharacterList.fromJson(jsonResponse);
      return characterList;
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  }
}