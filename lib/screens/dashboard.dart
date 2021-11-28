import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/model/note.dart';
import 'package:note/controller/note_controller.dart';

import 'add_note.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var noteController = Get.find<NoteController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Note'),
      ),
      body: Container(
        child: Obx(() => shownNotes(noteController)),
        padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 25.0),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(AddNote());
        },
      ),
    );
  }

  Widget shownNotes(NoteController noteController) {
    var notes = noteController.notes;
    Widget notesWidget =
        Center(child: Text("No notes available"));
    if (notes.isNotEmpty) {
      notesWidget = ListView.builder(
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notes[index].title,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    notes[index].content,
                    style: TextStyle(fontSize: 12.0),
                  ),
                  Divider()
                ],
              ),
             IconButton(icon: Icon(Icons.delete), onPressed: (){
                noteController.deleteNote(notes[index]);
              },)
            ],
          );
        },
        itemCount: notes.length,
      );
    } else {
      noteController.getAllNotes();
    }

    return notesWidget;
  }
}
