import 'package:flutter/material.dart';

class Todo {
  final String title;
  final bool isDone;

  Todo({required this.title, this.isDone = false});

  Todo copyWith({String? title, bool? isDone}) {
    return Todo(title: title ?? this.title, isDone: isDone ?? this.isDone);
  }

  Widget buildTodo(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        decoration: isDone ? TextDecoration.lineThrough : null,
        decorationThickness: 2,
      ),
    );
  }
}

