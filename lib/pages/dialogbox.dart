// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/pages/button.dart';


class Dialogbox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  Dialogbox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add new Task",
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyButton(text: "Save", onPressed: onSave,),
              const SizedBox(width: 10,),
              MyButton(text: "Cancel", onPressed: onCancel,), 
            ],
          )
          ],
        ),
        ),
    );
  }
}