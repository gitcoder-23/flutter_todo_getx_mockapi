import 'package:flutter/material.dart';
import 'package:flutter_todo_getx_mockapi/controllers/api/api_controller.dart';
import 'package:flutter_todo_getx_mockapi/models/todo_model.dart';
import 'package:get/get.dart';

import 'todolist/todo_list_page.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  TextEditingController textTodoName = TextEditingController();

  @override
  void initState() {
    getAllTodos();
    super.initState();
  }

  getAllTodos() async {
    final TodoController todoController = Get.put(TodoController());

    if (mounted) {
      todoController.getTodos();
    } else {
      await Future.delayed(const Duration(milliseconds: 1000));
      getAllTodos();
    }
  }

  Future<void> _onRefresh() async {
    try {
      getAllTodos();
    } catch (e) {
      print('todo-List-refresh[error]: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());

    TextEditingController textTodoName = TextEditingController();

    onAddTodo() {
      Get.defaultDialog(
        title: 'Enter new task',
        backgroundColor: const Color.fromARGB(255, 210, 200, 229),
        content: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: textTodoName,
                    decoration: const InputDecoration(hintText: "Enter Task"),
                  ),
                ),
              ],
            ),
          ],
        ),
        titlePadding: const EdgeInsets.all(8.0),
        contentPadding: const EdgeInsets.all(8.0),
        radius: 20,
        actions: [
          OutlinedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              print('textTodoName--> ${textTodoName.text}');
              todoController.addTodo(textTodoName.text);
              textTodoName.clear();
              Get.back();
            },
            child: const Text('Submit'),
          )
        ],
      );
    }

    openEditDialog(eTodoId, todoSpecificData) {
      print('eTodoId--> $eTodoId  $todoSpecificData');

      final todoName = todoSpecificData;
      textTodoName.text = todoName.toString();

      Get.defaultDialog(
        title: 'Edit a task',
        backgroundColor: const Color.fromARGB(255, 210, 200, 229),
        content: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: textTodoName,
                    decoration: const InputDecoration(hintText: "Enter Task"),
                  ),
                ),
              ],
            ),
          ],
        ),
        titlePadding: const EdgeInsets.all(8.0),
        contentPadding: const EdgeInsets.all(8.0),
        radius: 20,
        actions: [
          OutlinedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              todoController.editTodo(
                textTodoName.text,
                eTodoId,
              );
              Get.back();
            },
            child: const Text('Save'),
          )
        ],
      );
    }

    onDeleteDialog(specificTodoId) {
      print('todoId--> $specificTodoId');
      Get.defaultDialog(
        title: 'Delete Todo',
        backgroundColor: const Color.fromARGB(255, 210, 200, 229),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Do you want to delete?'),
              ],
            ),
          ],
        ),
        actions: [
          OutlinedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('No'),
          ),
          ElevatedButton(
            onPressed: () {
              todoController.deleteTodo(specificTodoId);
              Get.back();
            },
            child: const Text('Yes'),
          )
        ],
      );
    }

    openViewTodo(vId, todoName) {
      Get.defaultDialog(
        title: 'View Todo',
        backgroundColor: const Color.fromARGB(255, 210, 200, 229),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('todo Name: $todoName'),
              ],
            ),
          ],
        ),
        actions: [
          OutlinedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Close'),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Todo App'),
      ),
      bottomNavigationBar: Container(
        width: 200,
        margin: const EdgeInsets.only(
          bottom: 40,
          right: 40,
          left: 40,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: onAddTodo,
              icon: const Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
              label: const Text(
                'Add Todo',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'All Todos',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Obx(
                  () {
                    if (todoController.isLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.purple,
                        ),
                      );
                    } else {
                      return RefreshIndicator(
                        onRefresh: _onRefresh,
                        child: ListView.builder(
                          itemCount: todoController.todoList.length,
                          itemBuilder: (context, index) {
                            TodoModelMain todoData = todoController
                                .todoList.reversed
                                .toList()[index];

                            return TodoListPage(
                              todoData: todoData,
                              openViewTodo: openViewTodo,
                              openEditDialog: openEditDialog,
                              onDeleteDialog: onDeleteDialog,
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ),

              // Expanded(
              //   child: ListView.builder(
              //     itemCount: todoController.todoList.length,
              //     itemBuilder: (context, index) {
              //       TodoModelMain todoData = todoController.todoList[index];
              //       print('todoData--> $todoData');
              //       return Obx(
              //         () => Column(
              //           children: todoController.todoList
              //               .map(
              //                 (element) => todoDataList(
              //                     element, openEditDialog, onDeleteDialog),
              //               )
              //               .toList(),
              //         ),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
