part of 'note_bloc.dart';

sealed class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}
class LoadNotes extends NoteEvent {}

class AddNote extends NoteEvent {
  final Note note;
  AddNote(this.note);
}
