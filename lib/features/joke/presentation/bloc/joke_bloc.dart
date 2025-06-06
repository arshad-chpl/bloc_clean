import 'package:bloc/bloc.dart';
import 'package:bloc_clean_demo/features/joke/domain/entities/joke.dart';
import 'package:bloc_clean_demo/features/joke/domain/usecases/get_random_joke_usecase.dart';
import 'package:equatable/equatable.dart';

part 'joke_event.dart';
part 'joke_state.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  final GetRandomJokeUseCase getRandomJokeUseCase;

  JokeBloc(this.getRandomJokeUseCase) : super(JokeInitial()) {
    on<JokeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LoadJoke>((event, emit) async {
      emit(JokeLoading());
      try {
        final joke = await getRandomJokeUseCase();
        emit(JokeLoaded(joke));
      } catch (_) {
        emit(JokeError('Failed to fetch joke'));
      }
    });

  }
}
