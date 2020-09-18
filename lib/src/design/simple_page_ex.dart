import 'package:fluffy/src/app/app_ex.dart';
import 'package:flutter/widgets.dart';
import 'package:fluro/fluro.dart';

abstract class SimplePageEx extends StatelessWidget {
  void pop<T extends Object>([T result]) {
    Navigator.of(appContext).pop(result);
  }

  void push(String path,
      {bool replace = false,
      bool clearStack = false,
      TransitionType transition,
      Duration transitionDuration = const Duration(milliseconds: 250),
      RouteTransitionsBuilder transitionBuilder}) {

  }
}
