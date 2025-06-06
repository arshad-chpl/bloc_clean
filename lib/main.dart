import 'package:bloc_clean_demo/features/home/presentation/home_page.dart';
import 'package:bloc_clean_demo/features/joke/presentation/pages/joke_screen.dart';
import 'package:bloc_clean_demo/features/notes/data/models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'core/di/injection_container.dart' as di;
import 'features/joke/presentation/bloc/joke_bloc.dart';
import 'features/notes/presentation/bloc/note_bloc.dart';
import 'features/notes/presentation/pages/note_page.dart';
import 'features/todo/presentation/bloc/todo_bloc.dart';
import 'features/todo/presentation/pages/todo_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.initHive();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<TodoBloc>()..add(LoadTodos())),
        BlocProvider(create: (_) => di.sl<NoteBloc>()..add(LoadNotes())),
        BlocProvider(create: (_) => di.sl<JokeBloc>()..add(LoadJoke())),
      ],
      child: MaterialApp(
        title: 'Feature App',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (_) => const HomeScreen(),
          '/todos': (_) => TodoListScreen(),
          '/notes': (_) => const NoteListScreen(),
          '/joke': (_) => JokeScreen(),

          
          // '/groceries': (_) => const NoteListScreen(),
        },
      ),
    );
  }
}
