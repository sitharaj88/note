import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/model/note.dart';

import '../controller/note_controller.dart';

class AddNote extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    NoteController noteController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  hintText: "Titile",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)))),
            ),
            SizedBox(height: 25.0),
            TextField(
                controller: contentController,
                decoration: InputDecoration(
                    hintText: "Content",
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(20.0))))),
            SizedBox(height: 25.0),

            ElevatedButton(
                onPressed: () {
                  if (titleController.text.isNotEmpty &&
                      contentController.text.isNotEmpty) {
                    noteController.addNote(Note(
                        title: titleController.text,
                        content: contentController.text));
                    Get.back();
                  } else {
                    Get.snackbar(
                        "Input Error", "Please add note title and content");
                  }
                },
                child: Text("Add Note"))
          ],
        ),
      ),
    );
  }
}
