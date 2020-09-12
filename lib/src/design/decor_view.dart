import 'package:fluffy/fluffy.dart';
import 'package:flutter/widgets.dart';

import 'ui_host.dart';

abstract class DecorMixin implements UIHost {
  Widget _errorView;
  Widget _loadingView;

  @override
  Widget buildBody(BuildContext context) {
    _errorView = AppConfig.errorViewBuilder.build(context);
    _loadingView = AppConfig.loadingViewBuilder.build(context);
    return Stack(
      children: [
        buildView(context),
        _errorView,
        _loadingView,
      ].removeNull(),
    );
  }

  showError() {}
  showLoading() {}
}
