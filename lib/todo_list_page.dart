import 'package:flutter/material.dart';
import 'package:todolist/widgets/todo_list_item.dart';


class TodolistPage extends StatefulWidget {
   TodolistPage({Key? key}) : super(key: key);

  final TextEditingController todoController = TextEditingController();

  List <String> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      String Text = todoController.text;
                      todos.add(Text);
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
                    for (String todo in todos)
                    TodoListItem(
                  title: todo,
              );
                  ],
                ),
              ),
              SizedBox( height: 16,),

              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Você possuí 0 Tarefas pendentes',
                    ),
                  ),
                  SizedBox(child: 8),
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
    );
  }
}
