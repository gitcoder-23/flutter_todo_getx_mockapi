// ignore_for_file: unused_import

import 'dart:convert';

import 'package:flutter_todo_getx_mockapi/models/todo_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TodoController extends GetxController {
  String baseUrl =
      "https://645df1228d08100293f2b187.mockapi.io/api/v1/todoList";
  // var TodoList = RxList<TodoModelMain>();
  var isLoading = true.obs;
  List<TodoModelMain> todoList = <TodoModelMain>[].obs;

  // Call when app is running
  @override
  void onInit() {
    getTodos();
    super.onInit();
  }

// Get Todos
  void getTodos() async {
    try {
      isLoading(true);

      final response = await http.get(
        Uri.parse(baseUrl),
      );

      var resData = jsonDecode(response.body.toString());
      // print('resData--> $resData');

      if (response.statusCode == 200) {
        for (Map<String, dynamic> todoRes in resData) {
          isLoading(false);
          todoList.add(TodoModelMain.fromJson(todoRes));
        }
      }
      // todoList.clear();
    } catch (e) {
      isLoading(false);
      print('error-fetch-todo--> $e');
    }
  }

  // Future<RxList<TodoModelMain>> getTodos() async {
  //   final response = await http.get(
  //     Uri.parse(baseUrl),
  //   );

  //   var resData = jsonDecode(response.body.toString());
  //   print('resData--> $resData');

  //   if (response.statusCode == 200) {
  //     for (Map<String, dynamic> index in resData) {
  //       TodoList.add(TodoModelMain.fromJson(index));
  //     }
  //     return TodoList;
  //   } else {
  //     return TodoList;
  //   }
  // }

  //Post Todo--add toto
  Future<void> addTodo(todoName) async {
    print('addTodo--state--> $todoName');
    try {
      isLoading.value = true;
      final response = "".obs;

      final uriRes = await http.post(
        Uri.parse(baseUrl),
        headers: {'content-type': 'application/json'},
        body: json.encode(
          {"todoName": todoName},
        ),
      );
      if (uriRes.statusCode == 201) {
        print('Done to add');

        print('uriRes--state--> $uriRes');
        response.value = uriRes.body;
        todoList.clear();
        isLoading.value = false;
        getTodos();
      } else {
        print('failed to add');
        isLoading.value = false;
      }

      // print('resData--> $resData');
    } catch (e) {
      print('add--error--> $e');
    }
  }

  //Post Todo--add toto
  Future<void> editTodo(todoName, todoId) async {
    print('todoName--state--> $todoName,  -> $todoId');
    try {
      isLoading.value = true;
      final response = "".obs;

      final uriRes = await http.put(
        Uri.parse('$baseUrl/$todoId'),
        headers: {'content-type': 'application/json'},
        body: json.encode(
          {"todoName": todoName},
        ),
      );
      if (uriRes.statusCode == 200) {
        print('Done to edit');

        response.value = uriRes.body;
        todoList.clear();
        isLoading.value = false;
        getTodos();
      } else {
        print('failed to add');
        isLoading.value = false;
      }

      // print('resData--> $resData');
    } catch (e) {
      print('add--error--> $e');
    }
  }

  // Delete Todo
  Future<void> deleteTodo(todoTd) async {
    print('todoTd--state--> $todoTd');

    try {
      isLoading.value = true;

      final uriRes = await http.delete(
        Uri.parse('$baseUrl/$todoTd'),
      );
      print('uriRes--> $uriRes');
      if (uriRes.statusCode == 200) {
        print('Done to delete');
        isLoading.value = false;
        todoList.clear();
        getTodos();
      } else {
        print('failed to delete');
        isLoading.value = false;
      }

      // print('resData--> $resData');
    } catch (e) {
      print('delete--error--> $e');
    }
  }
}
