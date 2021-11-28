import 'package:get/get.dart';
import 'package:note/model/note.dart';
import 'package:note/provider/note_provider.dart';

class NoteController extends GetxController {
  NoteProvider noteProvider;

  List<Note> notes = <Note>[].obs;

  NoteController({required this.noteProvider});

  void addNote(Note note) async {
    await noteProvider.addNote(note);
    getAllNotes();
  }

  void deleteNote(Note note) async {
    await noteProvider.deleteNote(note);
    getAllNotes();
  }

  void getAllNotes() async {
    var notesFromDB = await noteProvider.getAllNote();
    notes.clear();
    notes.addAll(notesFromDB);
  }
}
