part of 'joke_bloc.dart';

sealed class JokeEvent extends Equatable {
  const JokeEvent();

  @override
  List<Object> get props => [];
}
class LoadJoke extends JokeEvent {}