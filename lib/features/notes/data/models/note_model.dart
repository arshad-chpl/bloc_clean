import '../../domain/entities/note.dart';

class NoteModel extends Note {
  NoteModel({required String title, required String content})
    : super(
        content: content,
        title:title,
      );
}
