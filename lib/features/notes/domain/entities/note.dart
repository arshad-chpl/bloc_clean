import 'package:equatable/equatable.dart';

class Note extends Equatable{
  final String title;
  final String content;

  Note({
    required this.title,
    required this.content,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [title, content];
}