// STEP 3 — Create the StatefulWidget
// You should see: AppBar "My To-Do List", body "Coming soon...".

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      home: const TodoHome(), // replaced the inline Scaffold with our new widget
    );
  }
}

class TodoHome extends StatefulWidget { // StatefulWidget = CAN hold and update data
  const TodoHome({super.key});

  @override
  State<TodoHome> createState() => _TodoHomeState(); // creates the state object that holds our data
}

class _TodoHomeState extends State<TodoHome> { // _ means private — only this file can use it
  // ignore: unused_field
  final List<String> _tasks = []; // our to-do list — starts empty, will grow as tasks are added
  // ignore: unused_field
  final TextEditingController _controller = TextEditingController(); // "wire" attached to the text box

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My To-Do List')),
      body: const Center(child: Text('Coming soon...')), // placeholder — replaced in Step 4
    );
  }
}
