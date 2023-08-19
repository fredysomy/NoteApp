import 'package:flutter/material.dart';
import 'package:noteapp/models/models.dart';
import 'package:noteapp/viewmodels/asd.dart';

class EditScreen extends StatefulWidget {
  EditScreen(
      this.viewmodel, this.id, this.title, this.body, this.date, this.updated);
  final NoteViewModel viewmodel;
  final String id;
  final String title;
  final String body;
  final String date;
  final String updated;
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController titlec = TextEditingController();
  final TextEditingController bodyc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titlec.text = widget.title;
    bodyc.text = widget.body;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Note",
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
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                      icon: Icon(Icons.save),
                      onPressed: () {
                        widget.viewmodel
                            .onUpdateAction(titlec.text, bodyc.text, widget.id);
                        Navigator.pop(context);
                      },
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 68, 67, 67))),
                      label: const Text("Update")),
                  Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0)),
                  ElevatedButton.icon(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        widget.viewmodel.onRemoveAction(
                          widget.id,
                        );
                        Navigator.pop(context);
                      },
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 68, 67, 67))),
                      label: const Text("Delete")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
