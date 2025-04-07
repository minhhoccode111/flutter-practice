import 'package:flutter/material.dart';

/*

sub-problems:
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
- [x] make the ui look okay
- [x] fix overflow screen bug with SingleChildScrollView(
- [x] reusability with smallButton Widget

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
    Todo("Create todolist app", isDone: true),
  ];

  var editIndex = -1;

  void _newTodo() {
    final text = controllerAdd.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _todos = [Todo(text), ..._todos];
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

  Widget smallButton(VoidCallback onPressed, IconData icon) {
    return SizedBox(
      width: 28,
      height: 28,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        child: Icon(icon, size: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                final item = _todos[index];
                if (index == editIndex) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controllerEdit,
                            decoration: InputDecoration(
                              hintText: "edit todo",
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 8,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () => controllerEdit.clear(),
                                icon: const Icon(Icons.clear, size: 16),
                              ),
                            ),
                            onSubmitted: (_) => _saveEdit(),
                          ),
                        ),
                        smallButton(() => _saveEdit(), Icons.save),
                        smallButton(() => _cancelEdit(), Icons.cancel),
                      ],
                    ),
                  );
                }

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(child: item.buildTodo(context)),
                      smallButton(() => _toggleDoneTodo(index), Icons.check),
                      smallButton(() => _startEdit(index), Icons.edit),
                      smallButton(() => _deleteTodo(index), Icons.delete),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controllerAdd,
                decoration: InputDecoration(
                  hintText: "enter todo",
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 8,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => controllerAdd.clear(),
                    icon: const Icon(Icons.clear, size: 16),
                  ),
                ),
                onSubmitted: (_) => _newTodo(),
              ),
            ),
            const SizedBox(width: 8),
            smallButton(() => _newTodo(), Icons.add),
          ],
        ),
      ),
    );
  }
}
