import 'package:fluffy/src/app/app_ex.dart';
import 'package:fluffy/src/config/app_ui_config.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';

abstract class RouteMixin {
  void pop<T extends Object>([T result]) {
    AppConfig.router.pop(appContext);
  }

  void push(BuildContext context, String path,
      {bool replace = false,
      bool clearStack = false,
      TransitionType transition,
      Duration transitionDuration = const Duration(milliseconds: 250),
      RouteTransitionsBuilder transitionBuilder}) {
    AppConfig.router.navigateTo(context, path);
  }
}
