import 'package:flutter/material.dart';

class RoutingScreen extends StatelessWidget {
  const RoutingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Routing"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("pushNamed Navigate to next screen define in routes"),
            ElevatedButton(
              onPressed: () {
                //add simple route here
                Navigator.of(context).pushNamed("/screen1");
              },
              child: Text("Push Screen 1"),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
