// STEP 6b — Empty State Message
// You should see: "No tasks yet! Tap Add to get started." when the list is empty.

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
  final List<Map<String, dynamic>> _tasks = [];
  final TextEditingController _controller = TextEditingController();

  void _addTask() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _tasks.add({'text': text, 'done': false});
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
            child: _tasks.isEmpty // isEmpty = true when the list has zero items
                ? const Center( // show this when empty
                    child: Text(
                      'No tasks yet!\nTap Add to get started.', // \n = new line
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  )
                : ListView.builder( // show this when there are tasks
                    itemCount: _tasks.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Checkbox(
                          value: _tasks[index]['done'],
                          onChanged: (val) {
                            setState(() {
                              _tasks[index]['done'] = val;
                            });
                          },
                        ),
                        title: Text(
                          _tasks[index]['text'],
                          style: TextStyle(
                            decoration: _tasks[index]['done']
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            color: _tasks[index]['done']
                                ? Colors.grey
                                : Colors.black,
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
