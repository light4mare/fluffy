import 'package:flutter/widgets.dart';

class AppLocale extends ChangeNotifier {
  Locale locale;

  void switchTo(Locale locale) {
    this.locale = locale;
    notifyListeners();
  }
}

class LocaleHelper {
  Locale en() {
    return Locale('en', '');
  }

  Locale zhCH() {
    return Locale('zh', '');
  }

  Locale zhTW() {
    return Locale('zh', 'TW');
  }
}
