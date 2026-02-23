// STEP 2 — Hello Flutter
// You should see: "Hello Flutter!" centered on screen.

import 'package:flutter/material.dart'; // loads Flutter's entire UI toolkit

void main() => runApp(const MyApp()); // entry point — first thing Dart runs

class MyApp extends StatelessWidget { // StatelessWidget = display only, never changes on its own
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) { // Flutter calls build() whenever it needs to draw this widget
    return MaterialApp( // the top-level "shell" that wraps the whole app
      title: 'To-Do App',
      home: Scaffold( // provides the standard screen layout (app bar + body)
        appBar: AppBar(title: const Text('My To-Do List')), // the bar at the top
        body: const Center(child: Text('Hello Flutter!')), // centered text in the middle
      ),
    );
  }
}
