import 'package:bloc_clean_demo/features/joke/data/datasources/joke_remote_data_source.dart';

import '../../domain/entities/joke.dart';
import '../../domain/repositories/joke_repository.dart';

class JokeRepositoryImpl implements JokeRepository {
  final JokeRemoteDataSource remoteDataSource;

  JokeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Joke> getRandomJoke() async {
    return await remoteDataSource.fetchRandomJoke();
  }
}