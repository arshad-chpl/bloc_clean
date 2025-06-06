import '../../domain/entities/joke.dart';

class JokeModel extends Joke {
  JokeModel({required int id, required String setup, required String punchline})
    : super(id: id, setup: setup, punchline: punchline);

  factory JokeModel.fromJson(Map<String, dynamic> json) {
    return JokeModel(
      id: json['id'],
      setup: json['setup'],
      punchline: json['punchline'],
    );
  }
}
