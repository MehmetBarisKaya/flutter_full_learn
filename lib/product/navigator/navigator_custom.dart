// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter101/303/lottie/lottie_learn.dart';
import 'package:flutter101/303/navigator/navigate_home_detail.dart';
import 'package:flutter101/303/navigator/navigate_home_view.dart';
import 'package:flutter101/product/navigator/navigator_routes.dart';

mixin NavigatorCustom {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name?.isEmpty ?? true) {
      return _navigateToNormal(const LottieLearn());
    }

    final routes = settings.name == NavigatorRoutes.paraf
        ? NavigateRoutes.init
        : NavigateRoutes.values.byName(settings.name!.substring(1));

    switch (routes) {
      case NavigateRoutes.init:
        return _navigateToNormal(const LottieLearn());
      case NavigateRoutes.home:
        return _navigateToNormal(const NavigateHomeView());

      case NavigateRoutes.detail:
        final _id = settings.arguments;
        return _navigateToNormal(
            NavigateHomeDetail(
              id: _id is String ? _id : null,
            ),
            isFullScreenDialog: true);
    }
  }

  Route<dynamic>? _navigateToNormal(Widget child, {bool? isFullScreenDialog}) {
    return MaterialPageRoute(
      fullscreenDialog: isFullScreenDialog ?? false,
      builder: (context) => child,
    );
  }
}
