import 'package:fluffy/src/app/app_ex.dart';
import 'package:fluffy/src/config/app_ui_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'decor_view.dart';
import 'view_model_ex.dart';

abstract class StatePageEx<VM extends ViewModelEx> extends StatefulWidget {
  Color bgColor = AppConfig.bodyColor;

  VM vm;

  @override
  State<StatefulWidget> createState() {
    return PageStateEx();
  }

  @override
  Widget buildView(BuildContext context);

  VM createVM();

  Widget buildNavigator(BuildContext context) => null;

  Widget buildErrorView(BuildContext context) => null;

  void onBuild(BuildContext context){}

  bool onPop() => vm.onPop();

  T of<T>({bool listen = true}) {
    return Provider.of(appContext, listen: listen);
  }
}

class PageStateEx<VM extends ViewModelEx> extends State<StatePageEx> with DecorMixin, WidgetsBindingObserver {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
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
  void deactivate() {
    print("2333333333333333 deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    print("2333333333333333 dispose");
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("2333333333333333 didChangeAppLifecycleState $state");
  }

  @override
  Future<bool> didPopRoute() {
    print("2333333333333333 didPopRoute");
    return super.didPopRoute();
  }

  @override
  bool onPop() => widget.onPop();

  @override
  Widget buildView(BuildContext context) => widget.buildView(context);

  @override
  Widget customErrorView(BuildContext context) => widget.buildNavigator(context);

  @override
  Widget customLoadingView(BuildContext context) => widget.buildErrorView(context);
}

class StateMixin {}
