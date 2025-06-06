import '../models/note_model.dart';
import 'note_local_datasource.dart';

class NoteLocalDataSourceImpl implements NoteLocalDataSource {
  final List<NoteModel> _notes = [];

  @override
  Future<List<NoteModel>> getNotes() async => _notes;

  @override
  Future<void> addNote(NoteModel note) async {
    _notes.add(note);
  }
}
