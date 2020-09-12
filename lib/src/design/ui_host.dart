import 'package:flutter/widgets.dart';

abstract class UIHost {
  Widget buildBody(BuildContext context);
  Widget buildView(BuildContext context);
}
