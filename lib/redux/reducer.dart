import 'package:noteapp/models/models.dart';
import 'package:noteapp/redux/actions.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();
AppState appStatereducer(AppState state, action) {
  return AppState(notes: noteReducer(state.notes, action));
}

List<Note> noteReducer(List<Note> state, action) {
  if (action is AddNoteAction) {
    final now = DateTime.now();
    String uuidd = uuid.v4();
    String formatter = DateFormat('yMd').format(now);
    return []
      ..addAll(state)
      ..add(Note(
          id: uuidd,
          title: action.title,
          body: action.body,
          date: formatter,
          updated: formatter));
  }
  if (action is LoadNotesAction) {
    return action.notes;
  }
  return state;
}
