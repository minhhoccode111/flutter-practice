import 'dart:ffi';

import 'package:flutter/material.dart';

class Todo {
  final String title;
  final bool isDone;
  Todo(this.title, {this.isDone = false});
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todolist',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Todolist'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> _todos = [
    Todo("Setup Development Environment", isDone: true),
    Todo("Read the docs"),
    Todo("Watch tutorials"),
    Todo("Do projects"),
  ];

  final TextEditingController controller = TextEditingController();

  void _newTodo() {
    print("new todo button clicked");
    print(_todos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 4,
          children: [
            //
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "enter todo",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  suffixIcon: IconButton(
                    onPressed: () => controller.clear(),
                    icon: const Icon(Icons.clear),
                  ),
                ),
                onSubmitted: (_) => _newTodo(),
              ),
            ),
            const SizedBox(width: 8),
            FilledButton.tonal(
              onPressed: _newTodo,
              child: const Text(
                "add",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
