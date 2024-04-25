import 'package:flutter/material.dart';
import 'package:flutter_template/Themes/darktheme.dart';
import 'package:flutter_template/flavour_config.dart';
import 'package:flutter_template/my_home_page.dart';

void main() {
  FlavorConfig(flavor: AppFlavors.dev, domainURL: "qa.api.com/v1");
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App QA Version',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      darkTheme: darkTheme,
      home: MyHomePage(),
    );
  }
}
