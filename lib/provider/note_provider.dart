import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note/constant.dart';
import 'package:note/model/note.dart';

class NoteProvider {
  Box<Note>? noteBox;

  NoteProvider() {
    noteBox = Hive.box<Note>(BOX_NOTE);
  }

  Future<Note?> getNote() async {
    return noteBox!.getAt(0);
  }

  Future<Null> addNote(Note note) async {
    await noteBox?.add(note);
  }

  Future<void> deleteNote(Note note) async {
    await noteBox?.delete(note.key);
  }

  Future<List<Note>> getAllNote() async {
    return await _getAllNotesfromDB();
  }

  List<Note> _getAllNotesfromDB() {
    var notes = <Note>[];
    int availableNotesLength = noteBox?.length ?? 0;

    print("available record is $availableNotesLength");
    if (availableNotesLength != 0) {
      Note? note;
      for (int i = 0; i < availableNotesLength; i++) {
        note = noteBox?.getAt(i);
        notes.add(note!);
      }
    }
    return notes;
  }

}
