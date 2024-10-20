
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/pages/databse.dart';
import 'package:todo_app/pages/dialogbox.dart';
import 'package:todo_app/pages/todo_tile.dart';


class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  

}

class _HomePageState extends State<HomePage> {

  final _myBox = Hive.box('myBox');
  todoDatabase db = todoDatabase();

    @override
  void initState() {
    if (_myBox.get('TODOTASKS') == null){
      db.initData();
    }
    else{
    db.loadData();
    }
    super.initState();
  }


  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.toDoTasks[index][1] = !db.toDoTasks[index][1];
    });
    db.updateDb();
  }

  void saveTask(){
    setState(() {
      db.toDoTasks.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDb();
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
      db.toDoTasks.removeAt(index);
    });
    db.updateDb();
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        child: const Icon(Icons.add),
        ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ToDo'),
        backgroundColor: Colors.yellow[400],
        elevation: 0,
      )
      ,
      body: ListView.builder(
        itemCount: db.toDoTasks.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.toDoTasks[index][0],
            taskCompleted: db.toDoTasks[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            delTask: (context) => deleteTask(index),
            );
        }
        )
    );
  }
}