import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note/constant.dart';
import 'package:note/model/note.dart';
import 'package:note/provider/note_provider.dart';
import 'package:note/screens/dashboard.dart';
import 'package:path_provider/path_provider.dart';

import 'bindings/note_binding.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>(BOX_NOTE);
  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: NoteBind(),
      home: Dashboard(),
    );
  }
}
