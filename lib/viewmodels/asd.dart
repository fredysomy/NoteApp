import 'package:noteapp/models/models.dart';
import 'package:noteapp/redux/actions.dart';
import 'package:redux/redux.dart';

class NoteViewModel {
  final List<Note> notes;
  final Function(String, String) onAddNoteAction;

  NoteViewModel({required this.notes, required this.onAddNoteAction});

  factory NoteViewModel.create(Store<AppState> store) {
    _onAddNoteAction(String title, String body) {
      print("HIi");
      store.dispatch(AddNoteAction(title, body));
    }

    return NoteViewModel(
        notes: store.state.notes, onAddNoteAction: _onAddNoteAction);
  }
}
