import 'package:flutter/material.dart';
import 'package:flutter_todo_getx_mockapi/controllers/api/api_controller.dart';
import 'package:flutter_todo_getx_mockapi/models/todo_model.dart';
import 'package:get/get.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());
    TextEditingController textTodoName = TextEditingController();

    onOpenDialog() {
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
              Get.back();
            },
            child: const Text('Save'),
          )
        ],
      );
    }

    openEditDialog() {
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
              print('textTodoName--> ${textTodoName.text}');
              Get.back();
            },
            child: const Text('Save'),
          )
        ],
      );
    }

    onDeleteDialog() {
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
              print('delete');
            },
            child: const Text('Yes'),
          )
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
              onPressed: onOpenDialog,
              icon: const Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
              label: const Text(
                'Add New',
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
                      return ListView.builder(
                        itemCount: todoController.todoList.length,
                        itemBuilder: (context, index) {
                          TodoModelMain todoData =
                              todoController.todoList[index];

                          return todoDataList(
                            todoData,
                            openEditDialog,
                            onDeleteDialog,
                          );
                        },
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

  Widget todoDataList(TodoModelMain todoData, Null Function() openEditDialog,
      Null Function() onDeleteDialog) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.deepPurple[500],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Row(
            children: [
              const Icon(
                Icons.task,
                size: 20,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                todoData.todoName!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              IconButton(
                onPressed: openEditDialog,
                icon: const Icon(
                  Icons.edit,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: onDeleteDialog,
                icon: const Icon(
                  Icons.delete,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
