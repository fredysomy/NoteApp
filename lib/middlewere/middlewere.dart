import 'dart:async';
import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:noteapp/models/models.dart';
import 'package:noteapp/redux/actions.dart';
import 'package:noteapp/redux/reducer.dart';

void Save(AppState state) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var string = json.encode(state.toJson());
  await prefs.setString("notes", string);
}

Future<AppState> GetPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var string = prefs.getString("notes");
  if (string != null) {
    Map map = json.decode(string);
    return AppState.fromJson(map);
  }
  return AppState.initialState();
}

void noteStateMiddleWere(
    Store<AppState> store, action, NextDispatcher next) async {
  next(action);
  if (action is AddNoteAction) {
    Save(store.state);
  }
  if (action is GetNotesAction) {
    await GetPrefs()
        .then((state) => {store.dispatch(LoadNotesAction(state.notes))});
  }
}
