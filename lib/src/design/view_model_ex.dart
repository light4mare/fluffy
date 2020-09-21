import 'package:flutter/widgets.dart';

abstract class ViewModelEx extends ChangeNotifier {
  void init() {}

  bool onPop() => true;
}
