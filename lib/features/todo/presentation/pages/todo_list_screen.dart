import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/todo.dart';
import '../bloc/todo_bloc.dart';
import 'package:uuid/uuid.dart';

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todos')),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is TodoLoaded) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (_, index) {
                final todo = state.todos[index];
                return ListTile(title: Text(todo.title));
              },
            );
          }
          return Center(child: Text('No Todos'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final newTodo = Todo(
            id: Uuid().v4(),
            title: "New Todo",
          );
          context.read<TodoBloc>().add(AddTodo(newTodo));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
