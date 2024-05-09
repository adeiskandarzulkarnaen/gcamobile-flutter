import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("about app"),
      ),
      body: const Center(
        child: Text("Developer. \n2006043 - Ade Iskandar Zulkarnaen \n2006194 - Ulpah Marsipah \n2006040 - Abdul Lathif"),
      ),
    );
  }
}