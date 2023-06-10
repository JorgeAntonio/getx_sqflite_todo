import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sqflite_todo/controller/controller.dart';
import 'package:getx_sqflite_todo/view/screens/edit_screen.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.controller, required this.index});

  final SQLController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                controller.updateFavorite(controller.list[index].id!,
                    controller.list[index].favorite == 0 ? 1 : 0);
              },
              icon: controller.list[index].favorite == 0
                  ? const Icon(Icons.favorite_border)
                  : const Icon(Icons.favorite),
            ),
            IconButton(
              onPressed: () {
                controller.updateCompleted(controller.list[index].id!,
                    controller.list[index].completed == 0 ? 1 : 0);
              },
              icon: controller.list[index].completed == 0
                  ? const Icon(Icons.check_box_outline_blank)
                  : const Icon(Icons.check_box),
            ),
            IconButton(
              onPressed: () {
                controller.updateTodo = true;
                Get.to(() => EditScreen(
                      id: controller.list[index].id,
                      title: controller.list[index].title,
                      description: controller.list[index].description,
                      time: controller.list[index].time,
                    ));
              },
              icon: const Icon(Icons.edit),
            )
          ],
        ),
        title: Text(controller.list[index].title!),
        subtitle: Text(controller.list[index].description!),
        trailing: IconButton(
          onPressed: () {
            controller.deleteData(id: controller.list[index].id!);
          },
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
