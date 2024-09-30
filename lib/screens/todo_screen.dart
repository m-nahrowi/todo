import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todo_controller.dart';
import '../widgets/todo_item_widget.dart';

class TodoScreen extends StatelessWidget {
  final TodoController todoController = Get.put(TodoController());
  final TextEditingController textController  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: todoController.todoList.length,
                itemBuilder: (context, index) {
                  final todo = todoController.todoList[index];
                  return TodoItemWidget(
                    todo: todo,
                    onToggle: () => todoController.toggleTodoStatus(index),
                    onRemove: () => todoController.removeTodoAt(index),
                  );
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textController,
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  todoController.addTodo(value);
                  textController.clear();
                }
              },
              decoration: InputDecoration(
                labelText: 'Add Todo',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
