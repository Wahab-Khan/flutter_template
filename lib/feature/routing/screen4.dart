import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen 4"),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: [
              Text(
                  "move to some other screen out of navigation stack like login"),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/home', (routes) {
                    return false; //false will make sure that all routes before the pushed route be removed.
                  });
                },
                child: Text("pushNamedAndRemoveUntil"),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                  "before the pushed route, we can only remove certain number of routes and push one."),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/screen2', // 2: push screen 2 when done with pop
                    ModalRoute.withName('/screen3'), // 1: pop until screen 3
                  );
                },
                child: Text("pushNamedAndRemoveUntil"),
              ),
              SizedBox(
                height: 30,
              ),
              Text("pop until some screen."),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/screen1'));
                },
                child: Text("popUntil"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
