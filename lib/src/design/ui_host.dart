import 'package:flutter/widgets.dart';

abstract class UIHost {
  Widget buildBody(BuildContext context);
  Widget buildView(BuildContext context);

  Widget customErrorView(BuildContext context);
  Widget customLoadingView(BuildContext context);

  void onRetry();
}
