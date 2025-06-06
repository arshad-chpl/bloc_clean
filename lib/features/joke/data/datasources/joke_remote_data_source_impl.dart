import 'package:bloc_clean_demo/features/joke/data/datasources/joke_remote_data_source.dart';
import 'package:bloc_clean_demo/features/joke/data/models/joke_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class JokeRemoteDataSourceImpl extends JokeRemoteDataSource {
  @override
  Future<JokeModel> fetchRandomJoke() async {
    final response = await http.get(
      Uri.parse('https://official-joke-api.appspot.com/random_joke'),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return JokeModel.fromJson(json);
    } else {
      throw Exception('Failed to load joke');
    }
  }
}
