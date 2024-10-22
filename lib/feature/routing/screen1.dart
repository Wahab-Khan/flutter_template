import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen 1"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/screen2');
                },
                child: Text("Screen 2"),
              ),
              SizedBox(
                height: 30,
              ),
              Text("Pop navigate back to previous screen"),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: (Text("Pop Screen1")),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                  "CanPop returns true false on bases of navigation stack if its can go back to previous screen or not "),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "This widget can pop? : ${Navigator.canPop(context)}"),
                    ),
                  );
                },
                child: Text("CanPop"),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                  "Maybe Pop only pop when its have pervious screen on navigation stack otherwise its stay on same screen"),
              ElevatedButton(
                onPressed: () {
                  Navigator.maybePop(context);
                },
                child: Text("MayBePop"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
