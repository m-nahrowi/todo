import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodoItemWidget extends StatelessWidget {
  final Todo todo;
  final VoidCallback onToggle;
  final VoidCallback onRemove;

  const TodoItemWidget(
      {super.key,
      required this.todo,
      required this.onToggle,
      required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        todo.title,
        style: TextStyle(
          decoration:
              todo.isDone ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        value: todo.isDone,
        onChanged: (value) => onToggle(),
      ),
      onLongPress: onRemove,
    );
  }
}
