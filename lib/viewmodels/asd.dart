import 'package:noteapp/models/models.dart';
import 'package:noteapp/redux/actions.dart';
import 'package:redux/redux.dart';

class NoteViewModel {
  final List<Note> notes;
  final Function(String, String) onAddNoteAction;
  final Function(String, String, String) onUpdateAction;
  final Function(String) onRemoveAction;

  NoteViewModel(
      {required this.notes,
      required this.onAddNoteAction,
      required this.onUpdateAction,
      required this.onRemoveAction});

  factory NoteViewModel.create(Store<AppState> store) {
    _onAddNoteAction(String title, String body) {
      print("HIi");
      store.dispatch(AddNoteAction(title, body));
    }

    _onUpdateAction(String title, String body, String id) {
      store.dispatch(UpdateNotesAction(title, body, id));
    }

    _onRemoveAction(String id) {
      store.dispatch(RemoveNoteAction(id));
    }

    return NoteViewModel(
        notes: store.state.notes,
        onAddNoteAction: _onAddNoteAction,
        onUpdateAction: _onUpdateAction,
        onRemoveAction: _onRemoveAction);
  }
}
