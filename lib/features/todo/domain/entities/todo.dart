import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String id;
  final String title;
  final bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [id, title,isCompleted];
}