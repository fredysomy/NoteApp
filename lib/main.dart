import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:noteapp/models/models.dart';
import 'package:noteapp/redux/actions.dart';
import 'package:noteapp/redux/reducer.dart';
import 'package:noteapp/middlewere/middlewere.dart';
import 'package:noteapp/screens/add.dart';

import 'package:noteapp/viewmodels/asd.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Store<AppState> store = Store<AppState>(appStatereducer,
        initialState: AppState.initialState(),
        middleware: [noteStateMiddleWere]);
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: "NoteApp",
        theme: ThemeData.dark(),
        home: StoreBuilder(
            onInit: (store) {
              store.dispatch(GetNotesAction());
            },
            builder: (BuildContext context, Store<AppState> store) =>
                HomePage(store)),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final Store<AppState> store;
  HomePage(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NoteViewModel>(
        converter: (Store<AppState> store) => NoteViewModel.create(store),
        builder: (BuildContext context, NoteViewModel viewModel) => Scaffold(
              appBar: AppBar(
                  title: const Text(
                "Note App",
                style: TextStyle(fontSize: 25),
              )),
              floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddScreen(viewModel)))
                },
              ),
              body: Container(
                  child: ListView(
                children: viewModel.notes
                    .map((Note item) => ListTile(
                          title: Text(item.title),
                          leading: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => print("dsd"),
                          ),
                        ))
                    .toList(),
              )),
            ));
  }
}
