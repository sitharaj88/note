

import 'package:get/get.dart';
import 'package:note/controller/note_controller.dart';
import 'package:note/provider/note_provider.dart';

class NoteBind extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NoteProvider());
    Get.lazyPut(() => NoteController(noteProvider: Get.find()));
  }
}