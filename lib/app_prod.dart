import 'package:flutter/material.dart';
import 'package:flutter_template/flavour_config.dart';
import 'package:flutter_template/my_home_page.dart';

void main() {
  FlavorConfig(flavor: AppFlavors.prod, domainURL: "prod.api.com/v1");
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Live Version',
      // themeMode: ,
      // darkTheme: ,
      // routes: ,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
