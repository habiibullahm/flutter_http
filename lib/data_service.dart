import 'package:http/http.dart' as http;

class DataService {
  Future<String> makeRequestTOApi() async {
    // https://pokeapi.co/api/v2/pokemon/1
    final uri = Uri.https('pokeapi.co/api/v2', '/pokemon/1');
    final response = await http.get(uri);
    return response.body;
  }
}
