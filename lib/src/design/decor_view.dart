import 'package:fluffy/fluffy.dart';
import 'package:flutter/widgets.dart';

import 'ui_host.dart';

abstract class DecorMixin implements UIHost {
  DecorLogic _logic = DecorLogic();

  @override
  Widget buildBody(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _logic,
      child: Stack(
        children: [
          _buildWithError(context),
          _buildLoading(context),
        ].removeNull(),
      ),
    );
  }

  Widget _buildWithError(BuildContext context) {
    return GestureDetector(
      child: Consumer<DecorLogic>(
        builder: (context, logic, child) {
          print("_buildWithError");
          return Visibility(
            visible: true,
            child: buildView(context),
            replacement: customErrorView(context) ??
                AppConfig.errorViewBuilder.build(context) ??
                SizedBox.shrink(),
          );
        },
        // selector: (context, decor) => !_logic._showError,
      ),
      onTap: onRetry,
    );
  }

  Widget _buildLoading(BuildContext context) {
    return Selector<DecorLogic, bool>(
      builder: (context, visible, child) {
        return Offstage(
          offstage: visible,
          child: customErrorView(context) ??
              AppConfig.loadingViewBuilder.build(context) ??
              SizedBox.shrink(),
        );
      },
      selector: (context, decor) => !_logic._showLoading,
    );
  }

  @override
  Widget customErrorView(BuildContext context) => null;

  @override
  Widget customLoadingView(BuildContext context) => null;

  @override
  onRetry() {}

  showError() {
    _logic._onError();
  }

  onNoError() {
    _logic._onNoError();
  }

  showLoading() {
    _logic._onLoading();
  }

  cancelLoading() {
    _logic._cancelLoading();
  }

  clearLoading() {
    _logic._clearLoading();
  }
}

class DecorLogic extends ChangeNotifier {
  bool _showError = false;

  bool get _showLoading => _loadingCount > 0;

  int _loadingCount = 0;

  _onError() {
    _showError = true;
    notifyListeners();
  }

  _onNoError() {
    _showError = false;
    notifyListeners();
  }

  _onLoading() {
    _loadingCount++;
    notifyListeners();
  }

  _cancelLoading() {
    _loadingCount--;
    notifyListeners();
  }

  _clearLoading() {
    _loadingCount = 0;
    notifyListeners();
  }
}
