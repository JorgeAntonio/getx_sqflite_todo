import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sqflite_todo/controller/controller.dart';
import 'package:getx_sqflite_todo/view/screens/edit_screen.dart';
import 'package:getx_sqflite_todo/view/widgets/main_appbar.dart';
import 'package:getx_sqflite_todo/view/widgets/todo_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final SQLController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.updateTodo = false;
          Get.to(() => EditScreen(), transition: Transition.rightToLeft);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<SQLController>(
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TodoItem(
                  controller: controller,
                  index: index,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
