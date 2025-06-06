import 'package:hive/hive.dart';

import '../models/note_model.dart';
import 'note_local_datasource.dart';

class NoteLocalDataSourceImpl implements NoteLocalDataSource {
  final Box<NoteModel> noteBox;
NoteLocalDataSourceImpl(this.noteBox);

  @override
  Future<void> addNote(NoteModel note) async {
    await noteBox.put(note.title, note);
  }

  @override
  Future<List<NoteModel>> getNotes() async {
    return noteBox.values.toList();
  }
}
