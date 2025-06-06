import 'package:bloc_clean_demo/features/joke/domain/entities/joke.dart';
import 'package:bloc_clean_demo/features/joke/domain/repositories/joke_repository.dart';

class GetRandomJokeUseCase {
  final JokeRepository repository;

  GetRandomJokeUseCase(this.repository);

  Future<Joke> call() {
    return repository.getRandomJoke();
  }
}
