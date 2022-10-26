import '../../models/jokesmodel.dart';
import 'package:http/http.dart' as http;

class JokesRepository {
  final String _baseUrl = "https://v2.jokeapi.dev/joke/Any";

  Future<JokesModel> getJoke() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      print(response.body.toString());
      return jokesModelFromJson(response.body);
    } else {
      throw Exception("Failed to load joke");
    }
  }
}
