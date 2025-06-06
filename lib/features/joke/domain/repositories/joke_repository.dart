import 'package:bloc_clean_demo/features/joke/domain/entities/joke.dart';

abstract class JokeRepository {
  Future<Joke> getRandomJoke();
}
