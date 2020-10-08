import 'dart:async';
import 'package:http/http.dart' as http;

class CharacterApi {
  static Future getCharacters() {
    return http.get("https://breakingbadapi.com/api/characters");
  }
}
