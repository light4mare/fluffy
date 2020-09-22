import 'package:fluffy/src/app/app_ex.dart';
import 'package:fluffy/src/config/app_ui_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'decor_view.dart';
import 'route_mixin.dart';
import 'view_model_ex.dart';

// ignore: must_be_immutable
abstract class StatePageEx<VM extends ViewModelEx> extends StatefulWidget
    with RouteMixin {
  final Color bgColor = AppConfig.bodyColor;

  VM vm;

  @override
  State<StatefulWidget> createState() {
    return PageStateEx<VM>();
  }

  Widget buildView(BuildContext context);

  VM createVM();

  Widget buildNavigator(BuildContext context) => null;

  Widget buildErrorView(BuildContext context) => null;

  void onBuild(BuildContext context) {}

  bool onPop() => vm.onPop();

  T of<T>({bool listen = true}) {
    return Provider.of(appContext, listen: listen);
  }
}

class PageStateEx<VM extends ViewModelEx> extends State<StatePageEx>
    with DecorMixin, WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // FIXME 是否真的需要appContext，放这里也不合适
    if (appContext == null) {
      appContext = context;
    }
    widget.vm = widget.createVM();
    widget.vm.init();
    widget.onBuild(context);
    return ChangeNotifierProvider<VM>.value(
      value: widget.vm,
      child: Scaffold(
        backgroundColor: widget.bgColor,
        appBar: widget.buildNavigator(context),
        body: buildBody(context),
      ),
      // child: buildView(context),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  bool onPop() => widget.onPop();

  @override
  Widget buildView(BuildContext context) => widget.buildView(context);

  @override
  Widget customErrorView(BuildContext context) =>
      widget.buildNavigator(context);

  @override
  Widget customLoadingView(BuildContext context) =>
      widget.buildErrorView(context);
}

class StateMixin {}
