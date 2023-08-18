import 'package:flutter/material.dart';
import 'package:noteapp/viewmodels/asd.dart';

class AddScreen extends StatefulWidget {
  AddScreen(this.viewmodel);
  final NoteViewModel viewmodel;
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController titlec = TextEditingController();
  final TextEditingController bodyc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Notes",
          style: TextStyle(fontSize: 23),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
              width: double.infinity,
              child: const Text(
                "Title",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 20, 20, 10),
              child: TextFormField(
                  controller: titlec,
                  decoration: const InputDecoration(label: Text("Title"))),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
              width: double.infinity,
              child: const Text(
                "Body",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 20, 20, 10),
                child: TextFormField(
                  controller: bodyc,
                  decoration: InputDecoration(label: Text("Body")),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: ElevatedButton(
                  onPressed: () => {
                        widget.viewmodel
                            .onAddNoteAction(titlec.text, bodyc.text)
                      },
                  child: const Text("Submit")),
            )
          ],
        ),
      ),
    );
  }
}
