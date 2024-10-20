
import 'package:flutter/material.dart';
import 'package:todo_app/pages/dialogbox.dart';
import 'package:todo_app/pages/todo_tile.dart';


class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  

}

class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();
  List toDoTasks = [
    ["Learn Flutter", true],
    ["Get Job",false],
  ];

  void checkBoxChanged(bool? value, int index){
    setState(() {
      toDoTasks[index][1] = !toDoTasks[index][1];
    });

  }

  void saveTask(){
    setState(() {
      toDoTasks.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void addTask(){
    showDialog(
      context: context,
      builder: (context){
        return Dialogbox(
            controller: _controller,
            onSave: saveTask,
            onCancel: () => Navigator.of(context).pop(),
        );
      });
  }

  void deleteTask(int index){
    setState(() {
      toDoTasks.removeAt(index);
    });

  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        child: Icon(Icons.add),
        ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('ToDo'),
        backgroundColor: Colors.yellow[400],
        elevation: 0,
      )
      ,
      body: ListView.builder(
        itemCount: toDoTasks.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: toDoTasks[index][0],
            taskCompleted: toDoTasks[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            delTask: (context) => deleteTask(index),
            );
        }
        )
    );
  }
}