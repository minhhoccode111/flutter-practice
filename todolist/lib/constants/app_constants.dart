import 'package:flutter/material.dart';

class AppConstants {
  static const double buttonSize = 28.0;
  static const double iconSize = 16.0;
  static const double padding = 8.0;
  static const double borderRadius = 0.0;

  static const EdgeInsets defaultPadding = EdgeInsets.all(padding);
  static const EdgeInsets textFieldPadding = EdgeInsets.symmetric(
    vertical: padding,
    horizontal: padding,
  );

  static const String appTitle = 'Todolist';
  static const String addTodoHint = 'enter todo';
  static const String editTodoHint = 'edit todo';
}

