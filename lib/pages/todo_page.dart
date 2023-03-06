import 'package:flutter/material.dart';

import 'package:todo_list_app/data/todo_service.dart';
import 'package:todo_list_app/models/todo.dart';

// ignore: must_be_immutable
class TodoPage extends StatelessWidget {
  TodoService todoService = TodoService.instance;
  final titleController = TextEditingController();
  final descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final titleField = TextFormField(
      controller: titleController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );
    final descriptionField = TextFormField(
      controller: descController,
      maxLines: 5,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );

    final saveButton = FloatingActionButton(
      onPressed: () {
        todoService
            .addTodo(Todo(
                id: 1,
                title: titleController.text,
                description: descController.text,
                isDone: false))
            .then((value) => Navigator.pop(context));
      },
      child: Text(
        "Save",
        style: TextStyle(color: Colors.white),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("New To do"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: titleField,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: descriptionField,
          ),
          saveButton,
        ],
      ),
    );
  }
}
