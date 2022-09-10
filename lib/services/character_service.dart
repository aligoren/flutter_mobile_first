import 'package:http/http.dart' as http;

import '../models/characters.dart';

class HarryPotterService {
  Future<List<HarryPotterCharacters>> FetchCharacters() async {
    final response =
        await http.get(Uri.parse('http://hp-api.herokuapp.com/api/characters'));

    if (response.statusCode == 200) {
      var result = charactersFromJson(response.body);

      return result;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
