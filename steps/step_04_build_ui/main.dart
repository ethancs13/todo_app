// STEP 4 — Build the UI
// You should see: a list area (empty), a text box, and an Add button.
// NOTE: the button and delete icon don't work yet — that's Step 5!

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      home: const TodoHome(),
    );
  }
}

class TodoHome extends StatefulWidget {
  const TodoHome({super.key});

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  final List<String> _tasks = [];
  final TextEditingController _controller = TextEditingController();

  // These functions are empty stubs for now — filled in during Step 5
  void _addTask() {}
  void _deleteTask(int index) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My To-Do List')),
      body: Column( // stacks children vertically from top to bottom
        children: [
          Expanded( // takes up ALL remaining space, pushing the input bar to the bottom
            child: ListView.builder( // builds list rows on demand — efficient for dynamic lists
              itemCount: _tasks.length, // how many rows to build
              itemBuilder: (context, index) { // called once per row, index = row number
                return ListTile( // pre-built row widget with slots for title and icons
                  title: Text(_tasks[index]),
                  trailing: IconButton( // icon placed on the right side of the row
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteTask(index),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0), // 8px of space on all sides
            child: Row( // lines children up horizontally, side by side
              children: [
                Expanded( // makes the TextField fill all available horizontal space
                  child: TextField(
                    controller: _controller, // connects this box to _controller so we can read it
                    decoration: const InputDecoration(
                      hintText: 'Enter a task...', // grey placeholder shown when empty
                      border: OutlineInputBorder(), // draws a border box around the field
                    ),
                  ),
                ),
                const SizedBox(width: 8), // invisible 8px gap between the field and button
                ElevatedButton(
                  onPressed: _addTask, // calls _addTask when tapped
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
