import '../../domain/entities/todo.dart';

class TodoModel extends Todo {
  TodoModel({
    required String id,
    required String title,
    bool isCompleted = false,
  }) : super(id: id, title: title, isCompleted: isCompleted);
}
