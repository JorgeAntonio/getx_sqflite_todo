import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sqflite_todo/controller/controller.dart';
import 'package:getx_sqflite_todo/shared/custom_text_form_field.dart';

class EditScreen extends StatefulWidget {
  EditScreen({Key? key, this.id, this.title, this.description, this.time})
      : super(key: key);

  final int? id;
  final String? title;
  final String? description;
  final String? time;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final SQLController controller = Get.find();

  final titleController = TextEditingController();

  final desController = TextEditingController();

  final timeController = TextEditingController();

  @override
  void initState() {
    if (controller.updateTodo) {
      titleController.text = widget.title!.toString();
      desController.text = widget.description!.toString();
      timeController.text = widget.time!.toString();
    } else {
      titleController.clear();
      desController.clear();
      timeController.clear();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(controller.updateTodo ? 'Update todo' : 'Add todo'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              CustomTextformfield(
                textLabel: 'Title',
                controller: titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              CustomTextformfield(
                textLabel: 'Description',
                controller: desController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              CustomTextformfield(
                textLabel: 'Time',
                controller: timeController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              MaterialButton(
                color: Theme.of(context).colorScheme.inversePrimary,
                onPressed: () {
                  if (!controller.updateTodo) {
                    controller.insertData(
                        title: titleController.text,
                        description: desController.text,
                        time: timeController.text);
                  } else {
                    controller.updateData(
                        id: widget.id!,
                        title: titleController.text,
                        description: desController.text,
                        time: timeController.text);
                  }
                },
                height: 50.0,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Text(controller.updateTodo ? 'Update todo' : 'Add todo'),
              )
            ],
          ),
        ));
  }
}
