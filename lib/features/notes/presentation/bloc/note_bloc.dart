import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/note.dart';
import '../../domain/usecases/add_notes.dart';
import '../../domain/usecases/get_notes.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final GetNotesUseCase getNotes;
  final AddNoteUseCase addNote;
  NoteBloc(this.getNotes, this.addNote) : super(NoteInitial()) {
on<LoadNotes>(_onLoadNotes);
    on<AddNote>(_onAddNote);
  }
    void _onLoadNotes(LoadNotes event, Emitter<NoteState> emit) async {
    emit(NoteLoading());
    try {
      final notes = await getNotes();
      emit(NoteLoaded(notes));
    } catch (_) {
      emit(NoteError('Failed to load notes'));
    }
  }

  void _onAddNote(AddNote event, Emitter<NoteState> emit) async {
    if (state is NoteLoaded) {
      await addNote(event.note);
      final updated = await getNotes();
      emit(NoteLoaded(updated));
    }
  }
}
