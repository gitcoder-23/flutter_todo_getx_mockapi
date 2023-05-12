import 'package:flutter/material.dart';
import 'package:get/get.dart';

void mySnackBar() {
  Get.snackbar(
    'This is alert', 'Getx snackbar',
    colorText: Colors.white,
    // titleText: const Text(
    //   'data',
    //   style: TextStyle(
    //     color: Colors.black,
    //   ),
    // ),
    icon: const Icon(
      Icons.notification_add,
      size: 30,
      color: Colors.white,
    ),
    shouldIconPulse: true,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.deepPurple[500],
    // animationDuration: const Duration(seconds: 1),
    duration: const Duration(seconds: 5),
    borderRadius: 40,
    dismissDirection: DismissDirection.horizontal,
    // isDismissible: false,
    mainButton: TextButton(
      onPressed: () {},
      child: const Text('Button Done'),
    ),
  );
}
