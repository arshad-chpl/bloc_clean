// core/injection/injector.dart
import 'package:bloc_clean_demo/features/joke/data/datasources/joke_remote_data_source_impl.dart';
import 'package:bloc_clean_demo/features/joke/domain/repositories/joke_repository.dart';
import 'package:bloc_clean_demo/features/joke/presentation/bloc/joke_bloc.dart';
import 'package:bloc_clean_demo/features/notes/data/models/note_model.dart';
import 'package:bloc_clean_demo/features/todo/data/datasources/todo_local_datasource.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/joke/data/datasources/joke_remote_data_source.dart';
import '../../features/joke/data/repositories/joke_repository_impl.dart';
import '../../features/joke/domain/usecases/get_random_joke_usecase.dart';
import '../../features/notes/data/datasources/note_local_datasource.dart';
import '../../features/notes/data/datasources/note_local_datasource_impl.dart';
import '../../features/notes/data/repositories/note_repository_impl.dart';
import '../../features/notes/domain/repositories/note_repository.dart';
import '../../features/notes/domain/usecases/add_notes.dart';
import '../../features/notes/domain/usecases/get_notes.dart';
import '../../features/notes/presentation/bloc/note_bloc.dart';
import '../../features/todo/data/datasources/todo_local_datasource_impl.dart';
import '../../features/todo/data/repositories/todo_repository_impl.dart';
import '../../features/todo/domain/repositories/todo_repository.dart';
import '../../features/todo/domain/usecases/add_todo.dart';
import '../../features/todo/domain/usecases/get_todos.dart';
import '../../features/todo/presentation/bloc/todo_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => TodoBloc(sl(), sl()));

  // Use cases
  sl.registerLazySingleton(() => GetTodosUseCase(sl()));
  sl.registerLazySingleton(() => AddTodoUseCase(sl()));
  sl.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl(sl()));
  sl.registerLazySingleton<TodoLocalDataSource>(
    () => TodoLocalDataSourceImpl(),
  );

  // Note Feature
  sl.registerFactory(() => NoteBloc(sl(), sl()));
  sl.registerLazySingleton(() => GetNotesUseCase(sl()));
  sl.registerLazySingleton(() => AddNoteUseCase(sl()));
  sl.registerLazySingleton<NoteRepository>(() => NoteRepositoryImpl(sl()));
  sl.registerLazySingleton<NoteLocalDataSource>(
    () => NoteLocalDataSourceImpl(sl<Box<NoteModel>>()),
  );

  // Joke Feature
  sl.registerLazySingleton<JokeRemoteDataSource>(
    () => JokeRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<JokeRepository>(() => JokeRepositoryImpl(sl()));
  sl.registerLazySingleton(() => GetRandomJokeUseCase(sl()));
  sl.registerFactory(() => JokeBloc(sl()));
}

Future<void> initHive() async {
  final appDir = await getApplicationDocumentsDirectory();
  Hive.init(appDir.path);

  Hive.registerAdapter(NoteModelAdapter());
  final noteBox = await Hive.openBox<NoteModel>('notes');

  sl.registerSingleton<Box<NoteModel>>(noteBox);

  // Register other Hive boxes if needed
}
