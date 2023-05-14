import 'package:flutter/material.dart';
import 'package:flutter_todo_getx_mockapi/controllers/counter_controller.dart';
import 'package:get/get.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int number = 0;

  CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    // print('number--> $number');

    return Scaffold(
      appBar: AppBar(
        title: Text('counter_head'.tr),
      ),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  counterController.countNumber < 0
                      ? '0'
                      : counterController.countNumber.toString(),
                  style: const TextStyle(
                    fontSize: 100,
                    color: Colors.white,
                  ),
                ),
              ),
              // Text(
              //   number.toString(),
              //   style: const TextStyle(
              //     fontSize: 100,
              //     color: Colors.white,
              //   ),
              // ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // setState(() {
                  //   number = number + 1;
                  // });
                  counterController.countNumber++;
                },
                child: const Text('Increment'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  // setState(() {
                  //   number = number - 1;
                  //   if (number < 0) {
                  //     number = 0;
                  //   }
                  // });
                  counterController.countNumber--;
                },
                child: const Text('Decrement'),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
