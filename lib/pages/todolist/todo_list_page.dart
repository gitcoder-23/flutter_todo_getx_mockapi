import 'package:flutter/material.dart';

import '../../models/todo_model.dart';

class TodoListPage extends StatelessWidget {
  final TodoModelMain todoData;
  final Function openEditDialog;
  final Function onDeleteDialog;
  const TodoListPage({
    required this.todoData,
    required this.openEditDialog,
    required this.onDeleteDialog,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                onPressed: openEditDialog ?? openEditDialog(),
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
                onPressed: () => onDeleteDialog(todoData.id),
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
