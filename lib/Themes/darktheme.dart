import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.blueGrey,
  appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
  drawerTheme: DrawerThemeData(
    backgroundColor: Colors.grey[800],
  ),
  navigationBarTheme: NavigationBarThemeData(backgroundColor: Colors.blue),
  bottomNavigationBarTheme:
      BottomNavigationBarThemeData(backgroundColor: Colors.blueAccent),
);
