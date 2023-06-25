import 'package:get/get.dart';
import 'Todo.dart';

class TodoController extends GetxController {
  RxList<Todo> todos = <Todo>[].obs;

  void addTodo(String title) {
    final todo = Todo(title: title);
    todos.add(todo);
  }

  void toggleTodoStatus(int index) {
    todos[index].completed = !todos[index].completed;
  }

  void removeTodo(int index) {
    todos.removeAt(index);
  }
}
