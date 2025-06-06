// core/injection/injector.dart
import 'package:bloc_clean_demo/features/todo/data/datasources/todo_local_datasource.dart';
import 'package:get_it/get_it.dart';

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
    () => NoteLocalDataSourceImpl(),
  );
}
