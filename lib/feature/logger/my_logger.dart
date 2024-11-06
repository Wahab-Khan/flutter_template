import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class MyLogger extends StatelessWidget {
  MyLogger({super.key});

  var logger = Logger(
    printer: PrettyPrinter(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Logger"),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Text(
                    "You can use following logger package for debug a highlight your print statments (note: currenlty colors only working with android )"),
                ElevatedButton(
                  onPressed: () {
                    logger.d('Log message with 2 methods');

                    logger.d('Log message with 2 methods');

                    logger.i('Info message');

                    logger.w('Just a warning!');

                    logger.e('Error! Something bad happened',
                        error: 'Test Error');

                    logger.t({'key': 5, 'value': 'something'});

                    Logger(printer: SimplePrinter(colors: true)).t('boom');
                  },
                  child: Text("show debug"),
                ),
                Text("See to Debug consle for output")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
