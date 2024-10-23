import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class LoggerNavigatorObserver extends NavigatorObserver {
  final Logger _navigationlogger = Logger();
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    _logNavigation("didPush", route.settings.name);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    _logNavigation("Pop", route.settings.name);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _logNavigation("Replace", newRoute?.settings.name);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    _logNavigation("Removed", route.settings.name);
  }

  void _logNavigation(String action, String? routeName) {
    if (routeName == null || routeName.isEmpty) {
      return;
    }
    _navigationlogger.i("Navigation : $action  : Screen Name $routeName");
  }
}
