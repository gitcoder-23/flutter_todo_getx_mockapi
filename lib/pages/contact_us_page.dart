import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: const SafeArea(
        child: Center(
          child: Text('Contact Us page'),
        ),
      ),
    );
  }
}
