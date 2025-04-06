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
  List<Todo> _todos = [];

  void _newTodo() {
    print("new todo button clicked");
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
            Row(
              spacing: 4,
              children: [
                Expanded(child: Text("Read the docs")),
                Icon(Icons.check),
                Icon(Icons.delete),
              ],
            ),
            Row(
              spacing: 4,
              children: [
                Expanded(child: Text("Watch tutorials")),
                Icon(Icons.check),
                Icon(Icons.delete),
              ],
            ),
            Row(
              spacing: 4,
              children: [
                Expanded(child: Text("Do projects")),
                Icon(Icons.check),
                Icon(Icons.delete),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            ElevatedButton(onPressed: _newTodo, child: Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}
