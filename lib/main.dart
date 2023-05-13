import 'package:flutter/material.dart';
import 'package:flutter_todo_getx_mockapi/components/routes.dart';
import 'package:get/get.dart';

import 'pages/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Getx App Tutorial',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.deepPurple[100],
      ),

      // Routing using Getx
      // getPages: [
      //   GetPage(name: '/', page: () => const MyHomePage()),
      //   GetPage(name: '/about', page: () => const AboutUsPage()),
      //   GetPage(name: '/contact', page: () => const ContactUsPage()),
      // ],
      getPages: allRoutedPages,
      home: const MyHomePage(),
    );
  }
}
