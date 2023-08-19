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
  if (action is UpdateNotesAction) {
    final now = DateTime.now();
    String formatter = DateFormat('yMd').format(now);
    return state
        .map((item) => item.id == action.id
            ? item.copyWith(
                title: action.title, body: action.body, updated: formatter)
            : item)
        .toList();
  }
  if (action is LoadNotesAction) {
    return action.notes;
  }
  if (action is RemoveNoteAction) {
    return state.where((element) => element.id != action.id).toList();
  }
  return state;
}
