import 'package:hive_flutter/hive_flutter.dart';

class todoDatabase {
  List toDoTasks = [];

  final _myBox = Hive.box('myBox');

   void initData(){
     toDoTasks = [
       ["New Task", false],
       ];
   }

  void loadData(){
    toDoTasks = _myBox.get('TODOTASKS');
  }

  void updateDb(){
    _myBox.put('TODOTASKS', toDoTasks);
  }
}