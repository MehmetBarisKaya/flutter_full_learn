import 'package:flutter/material.dart';
import 'package:flutter101/product/navigator/navigator_routes.dart';

class NavigatorManager {
  NavigatorManager._();
  static NavigatorManager instance = NavigatorManager._();

  final GlobalKey<NavigatorState> _navigatorGlobalKey = GlobalKey();

  GlobalKey<NavigatorState> get navigatorGlobalKey => _navigatorGlobalKey;

  void pushToPage(NavigateRoutes route, {Object? arguments}) {
    _navigatorGlobalKey.currentState?.pushNamed(route.withParaf, arguments: arguments);
  }
}
