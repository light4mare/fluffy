import 'package:fluffy/fluffy.dart';
import 'package:fluffy/src/config/app_ui_config.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'decor_view.dart';
import 'simple_page_ex.dart';

typedef OnTap = void Function();

typedef PageBuilder = Function(BuildContext context);

abstract class PageEx<VM extends ChangeNotifier> extends SimplePageEx with DecorMixin {
  Color bgColor = AppConfig.bodyColor;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<VM>.value(
      value: createVM(),
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: buildNavigator(context),
        body: buildBody(context),
      ),
      // child: buildView(context),
    );
  }

  Widget _buildDecorView(BuildContext context) {
    return Stack(
      children: [
        buildView(context),
        AppConfig.errorViewBuilder.build(context),
        AppConfig.loadingViewBuilder.build(context),
      ].removeNull(),
    );
  }

  VM createVM();

  Widget buildNavigator(BuildContext context) {
    return null;
  }

  Widget buildErrorView() {}
}

abstract class ViewModelEx extends ChangeNotifier {
  void init() {}
}
