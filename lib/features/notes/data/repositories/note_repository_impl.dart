import '../../domain/entities/note.dart';
import '../../domain/repositories/note_repository.dart';
import '../datasources/note_local_datasource.dart';
import '../models/note_model.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteLocalDataSource dataSource;

  NoteRepositoryImpl(this.dataSource);

  @override
  Future<List<Note>> getNotes() => dataSource.getNotes();

  @override
  Future<void> addNote(Note note) async {
    final noteModel = NoteModel(title: note.title, content: note.content);
    return dataSource.addNote(noteModel);
  }
}
