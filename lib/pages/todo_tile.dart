import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget{
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? delTask;


   TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.delTask,
    });

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(top: 15, left: 25, right: 25),
      child: Slidable(
        startActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: delTask,
              icon: Icons.delete,
              backgroundColor: Colors.purple,
              borderRadius: BorderRadius.circular(12),
              )
          ]
          ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.amber[200],
            borderRadius: BorderRadius.circular(15)
            ),
          child: Row(
            children: [
              Checkbox(value: taskCompleted, onChanged: onChanged, activeColor: Colors.black,),
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}