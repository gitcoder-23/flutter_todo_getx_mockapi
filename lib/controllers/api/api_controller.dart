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

  //
}
