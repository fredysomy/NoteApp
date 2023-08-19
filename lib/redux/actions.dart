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

class UpdateNotesAction {
  final String title;
  final String body;
  final String id;
  UpdateNotesAction(this.title, this.body, this.id);
}

class RemoveNoteAction {
  final String id;
  RemoveNoteAction(this.id);
}
