import 'package:flutter/material.dart';

/*

what's next:
- [x] init project with Todo shape
- [x] render the todos list, differentiate between done and not done
- [x] ui bottom input and submit button
- [x] add new todo when submit form
- [x] ui button toggle done todo
- [x] toggle done todo functionality
- [x] ui button delete todo
- [x] delete todo functionality
- [x] ui button edit todo title
- [x] edit todo title functionality
- [x] add input fields validation
- [ ] make the ui look okay

*/

class Todo {
  // set "final" so that immutable, when we need to update an object, we just
  // remove it and create a new one, we do this to make flutter aware of the
  // state change
  final String title;
  final bool isDone;
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
  final controllerAdd = TextEditingController();
  final controllerEdit = TextEditingController();

  var _todos = [
    Todo("Setup Development Environment", isDone: true),
    Todo("Read the docs"),
    Todo("Watch tutorials"),
    Todo("Do projects"),
  ];

  var editIndex = -1;

  void _newTodo() {
    final text = controllerAdd.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _todos = [..._todos, Todo(text)];
    });
    controllerAdd.clear();
  }

  void _toggleDoneTodo(int index) {
    setState(() {
      _todos = [
        ..._todos.sublist(0, index),
        Todo(_todos[index].title, isDone: !_todos[index].isDone),
        ..._todos.sublist(index + 1),
      ];
    });
  }

  void _startEdit(int index) {
    setState(() {
      editIndex = index;
    });
    controllerEdit.text = _todos[index].title;
  }

  void _cancelEdit() {
    setState(() {
      editIndex = -1;
    });
    controllerEdit.text = "";
  }

  void _saveEdit() {
    final currentIsDone = _todos[editIndex].isDone;
    final text = controllerEdit.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _todos = [
        ..._todos.sublist(0, editIndex),
        Todo(text, isDone: currentIsDone),
        ..._todos.sublist(editIndex + 1),
      ];
      editIndex = -1;
    });
    controllerEdit.text = "";
  }

  void _deleteTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
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
                if (index == editIndex) {
                  return Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controllerEdit,
                          decoration: InputDecoration(
                            hintText: "edit todo",
                            suffixIcon: IconButton(
                              onPressed: () => controllerAdd.clear(),
                              icon: const Icon(Icons.clear),
                            ),
                          ),
                          onSubmitted: (_) => _saveEdit(),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _saveEdit();
                        },
                        child: Icon(Icons.save),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _cancelEdit();
                        },
                        child: Icon(Icons.cancel),
                      ),
                    ],
                  );
                }

                return Row(
                  children: [
                    Expanded(child: item.buildTodo(context)),
                    ElevatedButton(
                      onPressed: () {
                        _toggleDoneTodo(index);
                      },
                      child: Icon(Icons.check),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _startEdit(index);
                      },
                      child: Icon(Icons.edit),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _deleteTodo(index);
                      },
                      child: Icon(Icons.delete),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controllerAdd,
              decoration: InputDecoration(
                hintText: "enter todo",
                suffixIcon: IconButton(
                  onPressed: () => controllerAdd.clear(),
                  icon: const Icon(Icons.clear),
                ),
              ),
              onSubmitted: (_) => _newTodo(),
            ),
          ),
          const SizedBox(width: 8),
          FilledButton.tonal(
            onPressed: () => _newTodo(),
            child: const Text("add"),
          ),
        ],
      ),
    );
  }
}
