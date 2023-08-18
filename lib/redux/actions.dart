import 'package:noteapp/models/models.dart';

class AddNoteAction {
  final String title;
  final String body;

  AddNoteAction(this.title, this.body);
}

class GetNotesAction {}

class LoadNotesAction {
  final List<Note> notes;
  LoadNotesAction(this.notes);
}
