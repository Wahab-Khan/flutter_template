import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/feature/home.dart';
import 'package:flutter_template/feature/logger/my_logger.dart';
import 'package:flutter_template/feature/routing/routing_screen.dart';
import 'package:flutter_template/flavors/flavour_config.dart';
import 'package:flutter_template/feature/camera/profile_picture.dart';
import 'package:flutter_template/feature/setting/setting_screen.dart';
import 'package:flutter_template/list_view_with_pagination/post_list.dart';
import 'package:flutter_template/list_view_with_riverpod_generator/data_list.dart';
import 'package:flutter_template/list_view_with_riverpod_generator/data_list_with_pagination.dart';
import 'package:flutter_template/translations/locale_keys.g.dart';

enum ScreensData { camera, routing, logger, item, settings }

IconData getScreenIcon(ScreensData screen) {
  switch (screen) {
    case ScreensData.camera:
      return Icons.camera;
    case ScreensData.routing:
      return Icons.navigation;
    case ScreensData.logger:
      return Icons.print;
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
    case ScreensData.routing:
      return Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RoutingScreen()),
      );
    case ScreensData.logger:
      return Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyLogger()),
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> screens = ScreensData.values.map((e) => e.name).toList();

  //bottom navigation bar
  int _selectedIndex = 0;

  // final List<Widget> _widgetOptions = [
  final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Users List',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Data list',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.list),
      label: 'Pagination with G',
    ),
  ];

  final List<Widget> _screens = [
    Home(),
    PostListScreen(),
    DataList(),
    PostPagginationListView()
  ];

  final List<String> _appTitles = [
    "${FlavorConfig.instance.flavor} App",
    "Users List",
    "List with gen",
    "List With pagination gen"
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_appTitles.elementAt(_selectedIndex)),
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
          },
        ),
      ),
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigationBarItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black12,
        onTap: _onItemTapped,
      ),
    );
  }
}
