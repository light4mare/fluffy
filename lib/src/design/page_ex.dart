
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'simple_page_ex.dart';

typedef OnTap = void Function();

typedef PageBuilder = Function(BuildContext context);

abstract class PageEx<VM extends ChangeNotifier> extends SimplePageEx {
  Widget buildView(BuildContext context);
  VM createVM();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<VM>.value(
      value: createVM(),
      child: buildView(context),
    );
  }
}

abstract class ViewModelEx extends ChangeNotifier {
  void init(){}
}