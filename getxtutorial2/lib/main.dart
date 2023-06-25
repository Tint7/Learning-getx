import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'TodoController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Todo List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TodoScreen(),
    );
  }
}

class TodoScreen extends StatelessWidget {
  final TodoController _controller = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX Todo List')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'New Todo',
              ),
              onSubmitted: (value) {
                _controller.addTodo(value);
              },
            ),
            SizedBox(height: 16),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: _controller.todos.length,
                  itemBuilder: (context, index) {
                    final todo = _controller.todos[index];
                    return ListTile(
                      title: Text(todo.title),
                      trailing: Checkbox(
                        value: todo.completed,
                        onChanged: (_) {
                          _controller.toggleTodoStatus(index);
                        },
                      ),
                      onLongPress: () {
                        _controller.removeTodo(index);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
