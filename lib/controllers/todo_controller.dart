import 'package:get/get.dart';
import '../models/todo.dart';

class TodoController extends GetxController {
  var todoList = <Todo>[].obs;

// untuk add todo
  void addTodo(String title) {
    todoList.add(Todo(title: title));
  }

// untuk remove todo
  void removeTodoAt(int index) {
    todoList.removeAt(index);
  }

  void toggleTodoStatus(int index) {
    todoList[index].isDone = !todoList[index].isDone;
    todoList.refresh();
  }
}
