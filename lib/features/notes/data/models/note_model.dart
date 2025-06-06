import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entities/note.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends Note with HiveObjectMixin {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String content;

  NoteModel({required this.title, required this.content})
      : super(title: title, content: content);

  factory NoteModel.fromNote(Note note) {
    return NoteModel(title: note.title, content: note.content);
  }

  Note toNote() => Note(title: title, content: content);
}