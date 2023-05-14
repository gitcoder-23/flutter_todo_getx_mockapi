import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

    void onDialogBox() {
      Get.defaultDialog(
        title: 'Getx Dialogbox',
        middleText: 'This is new dialogbox',
        backgroundColor: const Color.fromARGB(255, 210, 200, 229),
        content: Column(
          children: [
            const Text('1st Test'),
            const Text('2nd Test'),
            Row(
              children: [
                Expanded(
                  child: TextFormField(),
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
              // Navigator.of(context).pop();
              Get.back();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Done'),
          )
        ],
        // onCancel: () {},
        // onConfirm: () {},
      );
    }

    void onBottomSheet() {
      Get.bottomSheet(
        // backgroundColor: Colors.deepPurple[500],
        Container(
          padding: const EdgeInsets.all(20),
          height: 300,
          // color: Colors.white,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 40,
                        height: 10,
                        // color: Colors.green,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: const [
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 40,
                    child: Divider(
                      thickness: 3,
                      color: Colors.amberAccent,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Close'),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Done'),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('This is bottomsheet'),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      );
    }

    void onSelectLanguage() {
      if (mounted) {
        Get.toNamed('/language');
      }
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: onDialogBox,
                  child: const Text('Show Dialogbox'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: onBottomSheet,
                  child: const Text('Show Bottomsheet'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (mounted) {
                      // Without route
                      // Get.to(const AboutUsPage());
                      // With route
                      Get.toNamed('/about');
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => const AboutUsPage(),
                      //   ),
                      // );
                    }
                  },
                  child: const Text('About us'),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // With route with not go back
                    Get.offAllNamed('/contact');
                  },
                  child: const Text('Contact'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: onSelectLanguage,
                  child: const Text('Select Language'),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
