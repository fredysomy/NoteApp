import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:noteapp/screens/add.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NoteApp",
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Note App",
        style: TextStyle(fontSize: 25),
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddScreen()))
        },
      ),
    );
  }
}
