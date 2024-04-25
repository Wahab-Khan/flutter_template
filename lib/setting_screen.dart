import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting Screen"),
      ),
      body: const Center(
        child: Column(
          //TODO: for language add drop down
          children: [Text("data")],
        ),
      ),
    );
  }
}
