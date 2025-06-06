import 'package:bloc_clean_demo/features/joke/data/models/joke_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class JokeRemoteDataSource {
  Future<JokeModel> fetchRandomJoke();
}
