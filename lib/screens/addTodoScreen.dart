import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:myTodo/models/todo.dart';
import 'package:myTodo/client/hive_names.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

Box<Todo> box;

class _AddTaskScreenState extends State<AddTaskScreen> {
  String task;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          color: Colors.white,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Task',
                style: TextStyle(color: Colors.lightBlueAccent, fontSize: 26.0),
                textAlign: TextAlign.center,
              ),
              TextFormField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  setState(
                    () {
                      task = value;
                    },
                  );
                },
                validator: (val) {
                  return val.trim().isEmpty
                      ? 'Task name should not be empty'
                      : null;
                },
              ),
              SizedBox(height: 3.0),
              FlatButton(
                color: Colors.lightBlueAccent,
                onPressed: () {
                  _validateAndSave();
                  print(box.values.length);
                },
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int count;

  void _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      _onFormSubmit();
    } else {
      print('Form is invalid');
    }
  }

  void _onFormSubmit() {
    Box<Todo> contactsBox = Hive.box<Todo>(HiveBoxes.todo);
    contactsBox.add(Todo(task: task));
    setState(() {
      count = Hive.box<Todo>(HiveBoxes.todo).length;
    });

    print(count);
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(
    //     builder: (BuildContext context) {
    //       return HomeScreen(num: count);
    //     },
    //   ),
    // );
    Navigator.pop(context);
  }
}
