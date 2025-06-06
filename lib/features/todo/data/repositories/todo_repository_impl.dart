import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/todo_local_datasource.dart';
import '../models/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource localDataSource;

  TodoRepositoryImpl(this.localDataSource);

  @override
  Future<List<Todo>> getTodos() {
    return localDataSource.getTodos();
  }

  @override
  Future<void> addTodo(Todo todo) {
    final todoModel = TodoModel(
      id: todo.id,
      title: todo.title,
      isCompleted: todo.isCompleted,
    );
    return localDataSource.addTodo(todoModel);
  }
}
