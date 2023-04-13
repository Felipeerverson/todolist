import 'package:flutter/material.dart';
import 'package:todolist/models/todo.dart';
import 'package:todolist/widgets/todo_list_item.dart';


class TodoListPage extends StatefulWidget {
   TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();

  List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
            Row(
            children: [
            Expanded(
            child: TextField(
              controller: todoController,
              decoration: InputDecoration (
                border: OutlineInputBorder (),
                labelText: 'Adicionar Tarefa',
                hintText: 'Estudar Flutter',

              ),
            ),
          ),
          SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              String text = todoController.text;
              setState(() {
                Todo newTodo = Todo(
                  title: text,
                  dateTime: DateTime.now(),
                );
                todos.add(newTodo);
              });
              todoController.clear();

            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xff00d7f3),
              padding: EdgeInsets.all(14),
            ),
            child: Icon (
              Icons.add,
              size: 30,
            ),
          ),
          ],
        ),
        SizedBox( height: 16,),
        Flexible(
          child: ListView(
              shrinkWrap: true,
              children: [
              for (Todo todo in todos)
               TodoListItem(
                 todo: todo,
               ),
        ],
       ),
      ),
      SizedBox( height: 16,),

      Row(
      children: [
      Expanded(
      child: Text(
      'Você possuí ${todos.length} Tarefas pendentes',
      ),
      ),
      SizedBox (width: 8),
      ElevatedButton(
      onPressed: ()  {},
      style: ElevatedButton.styleFrom(
      primary: Color(0xff00d7f3),
      padding: EdgeInsets.all(14),
      ),
      child: Text('limpar tudo'),
      ),
      ],
      ),
      ],
      ),
      ),
      ),
      ),
    );
  }
}
