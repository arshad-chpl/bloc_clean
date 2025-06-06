part of 'joke_bloc.dart';

sealed class JokeState extends Equatable {
  const JokeState();
  
  @override
  List<Object> get props => [];
}

final class JokeInitial extends JokeState {}
class JokeLoading extends JokeState {}

class JokeLoaded extends JokeState {
  final Joke joke;
  JokeLoaded(this.joke);

  @override
  List<Object> get props => [joke];
}

class JokeError extends JokeState {
  final String message;
  JokeError(this.message);

  @override
  List<Object> get props => [message];
}
