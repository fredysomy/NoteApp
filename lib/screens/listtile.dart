import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:noteapp/screens/editscreen.dart';
import 'package:noteapp/viewmodels/asd.dart';

class ListWidget extends StatelessWidget {
  final NoteViewModel viewModel;
  final String id;
  final String title;
  final String date;
  final String updated;
  final String body;
  ListWidget(
      this.viewModel, this.id, this.title, this.date, this.updated, this.body);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 59, 59, 57)),
        height: 100,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 15, 0, 15),
              child: Text(
                this.title,
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(fontSize: 22)),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.create_rounded,
                        size: 16,
                      ),
                      const Padding(padding: EdgeInsets.fromLTRB(0, 0, 3, 0)),
                      Text(
                        ' On  ${this.date}',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(fontSize: 15)),
                      )
                    ],
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(13, 0, 13, 0)),
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.update,
                        size: 16,
                      ),
                      const Padding(padding: EdgeInsets.fromLTRB(0, 0, 3, 0)),
                      Text(
                        ' On  ${this.date}',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(fontSize: 15)),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    EditScreen(viewModel, id, title, body, date, updated)))
      },
    );
  }
}
