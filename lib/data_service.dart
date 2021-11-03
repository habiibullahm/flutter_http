import 'package:http/http.dart' as http;

// https://jsonplaceholder.typicode.com/users/1
class DataService {
  Future<String> makeRequestToApi() async {
    final uri = Uri.https('jsonplaceholder.typicode.com', '/users/1');
    final response = await http.get(uri);
    return response.body;
  }
}