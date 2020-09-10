

import 'package:flutter/widgets.dart';

typedef SelectorWidgetBuilder = Widget Function(BuildContext context, StateSetter setState);

class SelectorBuilder extends StatefulWidget {
  const SelectorBuilder(this._builder);

  final SelectorWidgetBuilder _builder;

  @override
  State<StatefulWidget> createState() => _SelectorState();
}

class _SelectorState extends State<SelectorBuilder> {
  @override
  Widget build(BuildContext context) {
    return widget._builder.call(context, null);
  }

}