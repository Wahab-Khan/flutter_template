import 'package:flutter/material.dart';
import 'package:flutter_template/flavour_config.dart';
import 'package:flutter_template/setting_screen.dart';

class SideMenuModel {
  final String screenName;
  final int screenId;

  SideMenuModel({required this.screenName, required this.screenId});
}

class MyHomePage extends StatelessWidget {
  final sideMenu = [
    SideMenuModel(screenName: "Item 1", screenId: 1),
    SideMenuModel(screenName: "Item 2", screenId: 2),
    SideMenuModel(screenName: "Item 3", screenId: 3),
    SideMenuModel(screenName: "Item 4", screenId: 4),
    SideMenuModel(screenName: "Settings", screenId: 5)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Debug App"),
      ),
      drawer: Drawer(
        child: ListView.builder(
            itemCount: sideMenu.length,
            itemBuilder: (buildContest, index) {
              return ListTile(
                  title: Text(sideMenu[index].screenName),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingScreen()),
                    );
                  });
            }),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(FlavorConfig.instance.flavor.toString()),
            Text(
              'This is base url for QA ${FlavorConfig.instance.domainURL}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
