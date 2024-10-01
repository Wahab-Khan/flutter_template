import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/flavour_config.dart';
import 'package:flutter_template/feature/camera/profile_picture.dart';
import 'package:flutter_template/feature/setting/setting_screen.dart';
import 'package:flutter_template/translations/locale_keys.g.dart';

enum ScreensData { camera, item, settings }
// class SideMenuModel {
//   final String screenName;
//   final int screenId;
//
//   SideMenuModel({required this.screenName, required this.screenId});
// }

// extension NavigateToScreen on ScreensData {
//   Widget get screenName {
//     switch (this) {
//       case ScreensData.camera:
//         // TODO: Handle this case.
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const SettingScreen(),
//           ),
//         );
//       case ScreensData.item:
//         // TODO: Handle this case.
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const SettingScreen()),
//         );
//       case ScreensData.settings:
//         // TODO: Handle this case.
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const SettingScreen()),
//         );
//     }
//   }
// }

IconData getScreenIcon(ScreensData screen) {
  switch (screen) {
    case ScreensData.camera:
      return Icons.camera;
    case ScreensData.settings:
      return Icons.settings;
    case ScreensData.item:
      return Icons.info;
    default:
      return Icons.error;
  }
}

Object navigateToScreen(ScreensData screen, BuildContext context) {
  switch (screen) {
    case ScreensData.camera:
      return Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePicture()),
      );
    case ScreensData.settings:
      return Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingScreen()),
      );
    case ScreensData.item:
      return Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingScreen()),
      );
    default:
      return Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingScreen()),
      );
  }
}

class MyHomePage extends StatelessWidget {
  List<String> screens = ScreensData.values.map((e) => e.name).toList();
  // final sideMenu = [
  //   SideMenuModel(screenName: "Camera", screenId: 1),
  //   SideMenuModel(screenName: "Item 2", screenId: 2),
  //   SideMenuModel(screenName: "Item 3", screenId: 3),
  //   SideMenuModel(screenName: "Item 4", screenId: 4),
  //   SideMenuModel(screenName: "Settings", screenId: 5)
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Debug App"),
      ),
      drawer: Drawer(
        child: ListView.builder(
            itemCount: screens.length,
            itemBuilder: (buildContest, index) {
              return ListTile(
                  leading: Icon(getScreenIcon(ScreensData.values[index])),
                  title: Text(screens[index]),
                  onTap: () {
                    navigateToScreen(ScreensData.values[index], context);
                  });
            }),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(FlavorConfig.instance.flavor.toString()),
            Text(
              '${LocaleKeys.baseURL.tr()} ${FlavorConfig.instance.domainURL}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
