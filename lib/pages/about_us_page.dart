import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: const SafeArea(
        child: Center(
          child: Text('About us page'),
        ),
      ),
    );
  }
}
