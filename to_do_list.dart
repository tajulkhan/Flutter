import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoScreen(),
    );
  }
}

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController _controller = TextEditingController();
  List<TodoItem> todos = [];

  void addTodo(String task) {
    setState(() {
      todos.add(TodoItem(task: task));
    });
    _controller.clear();
  }

  void removeTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void toggleDone(int index) {
    setState(() {
      todos[index].isDone = !todos[index].isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To-Do List')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter task',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  addTodo(_controller.text);
                }
              },
              child: Text('Add Task'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];

                  return ListTile(
                    title: Text(
                      todo.task,
                      style: TextStyle(
                        decoration:
                            todo.isDone ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    leading: Checkbox(
                      value: todo.isDone,
                      onChanged: (value) {
                        toggleDone(index);
                      },
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        removeTodo(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TodoItem {
  String task;
  bool isDone;

  TodoItem({required this.task, this.isDone = false});
}
