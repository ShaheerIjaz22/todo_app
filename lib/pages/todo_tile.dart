import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget{
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;



   TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    });

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(top: 15, left: 25, right: 25),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.amber[200],
          borderRadius: BorderRadius.circular(15)
          ),
        child: Row(
          children: [
            Checkbox(value: taskCompleted, onChanged: onChanged),
            Text(taskName),
          ],
        ),
      )
    );
  }
}