import 'package:get/get.dart';
import 'package:getx_sqflite_todo/controller/controller.dart';

class TaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SQLController());
  }
}
