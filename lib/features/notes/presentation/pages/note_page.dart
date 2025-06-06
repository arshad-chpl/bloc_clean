import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/note.dart';
import '../bloc/note_bloc.dart';

class NoteListScreen extends StatelessWidget {
  const NoteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes')),
      body: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          if (state is NoteLoading)
            return Center(child: CircularProgressIndicator());
          if (state is NoteLoaded) {
            return ListView.builder(
              itemCount: state.notes.length,
              itemBuilder: (_, index) {
                return ListTile(title: Text(state.notes[index].content));
              },
            );
          }
          return Center(child: Text('No Notes'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final newNote = Note(title: Uuid().v4(), content: "New Note");
          context.read<NoteBloc>().add(AddNote(newNote));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
