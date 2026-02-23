// STEP 6a — Task Completion with Checkboxes
// You should see: a checkbox on each task. Tapping it strikes through the text.

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
  // Changed from List<String> — each task is now a Map: {'text': 'Buy milk', 'done': false}
  final List<Map<String, dynamic>> _tasks = [];
  final TextEditingController _controller = TextEditingController();

  void _addTask() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _tasks.add({'text': text, 'done': false}); // stores both the text and a done/not-done flag
      _controller.clear();
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My To-Do List')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Checkbox( // checkbox on the LEFT side of the row
                    value: _tasks[index]['done'], // true = checked, false = unchecked
                    onChanged: (val) { // runs when the user taps the checkbox
                      setState(() {
                        _tasks[index]['done'] = val; // flip the done flag, then redraw
                      });
                    },
                  ),
                  title: Text(
                    _tasks[index]['text'],
                    style: TextStyle(
                      decoration: _tasks[index]['done']
                          ? TextDecoration.lineThrough // strike through if done
                          : TextDecoration.none,       // normal if not done
                      color: _tasks[index]['done']
                          ? Colors.grey  // grey if done
                          : Colors.black, // black if not done
                      // the ? : above is a ternary: condition ? valueIfTrue : valueIfFalse
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteTask(index),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter a task...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addTask,
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
