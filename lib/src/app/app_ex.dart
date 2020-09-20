import 'package:fluffy/fluffy.dart';
import 'package:fluffy/src/config/app_ui_config.dart';
import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_locale.dart';

BuildContext appContext;

abstract class AppEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _configureRoute(AppConfig.router);
    initConfig(context);

    return ChangeNotifierProvider<AppLocale>.value(
      value: AppLocale(),
      child: Consumer<AppLocale>(
        builder: (BuildContext context, appLocale, Widget child) {
          appContext = context;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.white,
            ),
            locale: appLocale.locale,
            home: buildHome(context),
            onGenerateRoute: AppConfig.router.generator,
            localizationsDelegates: getLocaleDelegates(),
            supportedLocales: supportedLocales(),
          );
        },
      ),
    );
  }

  List<LocalizationsDelegate> getLocaleDelegates() {
    var list = List<LocalizationsDelegate>();
    list.addAll(localeDelegates());
    list.add(GlobalCupertinoLocalizations.delegate);
    list.add(GlobalMaterialLocalizations.delegate);
    list.add(GlobalWidgetsLocalizations.delegate);
    return list;
  }

  void onRoutePushed(
    String pageName,
    String uniqueId,
    Map<String, dynamic> params,
    Route<dynamic> route,
    Future<dynamic> _,
  ) {}

  void initConfig(BuildContext context){}

  void _configureRoute(fluro.Router router) {}

  Widget buildHome(BuildContext context);

  Iterable<LocalizationsDelegate> localeDelegates();

  Iterable<Locale> supportedLocales();
}

// class AppStateEx extends State<AppEx> {
//   @override
//   void initState() {
//     configureRoute(AppConfig.router);
//     super.initState();
//   }
//
//   void configureRoute(Router router) {}
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Colors.white,
//       ),
//       builder: FlutterBoost.init(postPush: _onRoutePushed),
//       home: Container(),
//       onGenerateRoute: AppConfig.router.generator,
//     );
//   }
//
//   void _onRoutePushed(
//     String pageName,
//     String uniqueId,
//     Map<String, dynamic> params,
//     Route<dynamic> route,
//     Future<dynamic> _,
//   ) {}
// }
