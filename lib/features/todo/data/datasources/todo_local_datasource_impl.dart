import 'todo_local_datasource.dart';
import '../models/todo_model.dart';

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final List<TodoModel> _todoList = [];

  @override
  Future<List<TodoModel>> getTodos() async {
    return _todoList;
  }

  @override
  Future<void> addTodo(TodoModel todo) async {
    _todoList.add(todo);
  }
}
