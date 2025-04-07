import 'package:flutter/material.dart';

/*

what's next:
- [x] init project with Todo shape
- [x] render the todos list, differentiate between done and not done
- [x] ui bottom input and submit button
- [x] add new todo when submit form
- [ ] ui button delete todo
- [ ] delete todo functionality
- [ ] ui button edit todo
- [ ] edit todo functionality

*/

class Todo {
  String title;
  bool isDone;
  Todo(this.title, {this.isDone = false});
  Widget buildTodo(BuildContext context) {
    return isDone
        ? Text(
          title,
          style: TextStyle(
            decoration: TextDecoration.lineThrough,
            decorationThickness: 2,
          ),
        )
        : Text(title);
  }
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

  void _newTodo(String todo) {
    setState(() {
      _todos = [..._todos, Todo(todo)];
    });
    controller.clear();
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
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                final item = _todos[index];
                return item.buildTodo(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "enter todo",
                suffixIcon: IconButton(
                  onPressed: () => controller.clear(),
                  icon: const Icon(Icons.clear),
                ),
              ),
              onSubmitted: (_) => _newTodo(controller.text),
            ),
          ),
          const SizedBox(width: 8),
          FilledButton.tonal(
            onPressed: () => _newTodo(controller.text),
            child: const Text("add"),
          ),
        ],
      ),
    );
  }
}
