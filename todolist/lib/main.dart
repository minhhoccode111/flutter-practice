import 'package:flutter/material.dart';
import 'models/todo.dart';
import 'constants/app_constants.dart';
import 'widgets/small_button.dart';

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
- [x] refactor

*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: AppConstants.appTitle),
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
  var editIndex = -1;

  final List<Todo> _todos = [
    Todo(title: "Setup Development Environment", isDone: true),
    Todo(title: "Read the docs"),
    Todo(title: "Watch tutorials"),
    Todo(title: "Create todolist app", isDone: true),
  ];

  void _newTodo() {
    final text = controllerAdd.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _todos.insert(0, Todo(title: text));
    });
    controllerAdd.clear();
  }

  void _toggleDoneTodo(int index) {
    setState(() {
      _todos[index] = _todos[index].copyWith(isDone: !_todos[index].isDone);
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
    controllerEdit.clear();
  }

  void _saveEdit() {
    final text = controllerEdit.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _todos[editIndex] = _todos[editIndex].copyWith(title: text);
      editIndex = -1;
    });
    controllerEdit.clear();
  }

  void _deleteTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  Widget _buildTodoItem(Todo item, int index) {
    if (index == editIndex) {
      return _buildEditField();
    }

    return Padding(
      padding: AppConstants.defaultPadding,
      child: Row(
        children: [
          Expanded(child: item.buildTodo(context)),
          SmallButton(
            onPressed: () => _toggleDoneTodo(index),
            icon: Icons.check,
          ),
          SmallButton(onPressed: () => _startEdit(index), icon: Icons.edit),
          SmallButton(onPressed: () => _deleteTodo(index), icon: Icons.delete),
        ],
      ),
    );
  }

  Widget _buildEditField() {
    return Padding(
      padding: AppConstants.defaultPadding,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controllerEdit,
              decoration: InputDecoration(
                hintText: AppConstants.editTodoHint,
                isDense: true,
                contentPadding: AppConstants.textFieldPadding,
                suffixIcon: IconButton(
                  onPressed: () => controllerEdit.clear(),
                  icon: const Icon(Icons.clear, size: AppConstants.iconSize),
                ),
              ),
              onSubmitted: (_) => _saveEdit(),
            ),
          ),
          SmallButton(onPressed: _saveEdit, icon: Icons.save),
          SmallButton(onPressed: _cancelEdit, icon: Icons.cancel),
        ],
      ),
    );
  }

  Widget _buildAddTodoField() {
    return Padding(
      padding: AppConstants.defaultPadding,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controllerAdd,
              decoration: InputDecoration(
                hintText: AppConstants.addTodoHint,
                isDense: true,
                contentPadding: AppConstants.textFieldPadding,
                suffixIcon: IconButton(
                  onPressed: () => controllerAdd.clear(),
                  icon: const Icon(Icons.clear, size: AppConstants.iconSize),
                ),
              ),
              onSubmitted: (_) => _newTodo(),
            ),
          ),
          const SizedBox(width: AppConstants.padding),
          SmallButton(onPressed: _newTodo, icon: Icons.add),
        ],
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
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _todos.length,
              itemBuilder:
                  (context, index) => _buildTodoItem(_todos[index], index),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildAddTodoField(),
    );
  }

  // clean up
  @override
  void dispose() {
    controllerAdd.dispose();
    controllerEdit.dispose();
    super.dispose();
  }
}
