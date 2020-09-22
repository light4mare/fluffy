import 'package:fluffy/fluffy.dart';
import 'package:fluffy/src/config/app_ui_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'decor_view.dart';
import 'view_model_ex.dart';

typedef OnTap = void Function();

typedef PageBuilder = Function(BuildContext context);

// ignore: must_be_immutable
abstract class PageEx<VM extends ViewModelEx> extends StatelessWidget
    with DecorMixin, RouteMixin {
  Color bgColor = AppConfig.bodyColor;

  VM vm;

  @override
  Widget build(BuildContext context) {
    // FIXME 是否真的需要appContext，放这里也不合适
    if (appContext == null){
      appContext = context;
    }
    vm = createVM();
    vm.init();
    return ChangeNotifierProvider<VM>.value(
      value: vm,
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: buildNavigator(context),
        body: buildBody(context),
      ),
      // child: buildView(context),
    );
  }

  VM createVM();

  Widget buildNavigator(BuildContext context) => null;

  Widget buildErrorView() => null;

  T of<T>({bool listen = true}) {
    return Provider.of(appContext, listen: listen);
  }

  @override
  bool onPop() => vm.onPop();
}
