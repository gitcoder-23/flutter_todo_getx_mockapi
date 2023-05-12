import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    void onSnackBar() {
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
          child: const Text(
            'Done',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        padding: const EdgeInsets.all(10),
        margin: Platform.isIOS
            ? const EdgeInsets.only(bottom: 350, right: 10, left: 10)
            : const EdgeInsets.only(bottom: 10, right: 10, left: 10),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page Getx Feature Demo'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: onSnackBar,
                  child: const Text('Show Snakbar'),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
