import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

class AppEx extends StatefulWidget {
  test(){
    MaterialApp(
        title: 'Flutter Boost example',
        builder: FlutterBoost.init(postPush: _onRoutePushed),
        home: Container(color: Colors.white));
  }

  void _onRoutePushed(
      String pageName,
      String uniqueId,
      Map<String, dynamic> params,
      Route<dynamic> route,
      Future<dynamic> _,
      ) {}

  @override
  State<StatefulWidget> createState() {
    return AppStateEx();
  }
}

class AppStateEx extends State {
  @override
  void initState() {
    // https://zhuanlan.zhihu.com/p/61657041

    // FlutterBoost.singleton.registerPageBuilders(<String, PageBuilder>{
    //   'embeded': (String pageName, Map<String, dynamic> params, String _) =>
    //       EmbeddedFirstRouteWidget(),
    //   'first': (String pageName, Map<String, dynamic> params, String _) => FirstRouteWidget(),
    //   'firstFirst': (String pageName, Map<String, dynamic> params, String _) =>
    //       FirstFirstRouteWidget(),
    //   'second': (String pageName, Map<String, dynamic> params, String _) => SecondRouteWidget(),
    //   'secondStateful': (String pageName, Map<String, dynamic> params, String _) =>
    //       SecondStatefulRouteWidget(),
    //   'tab': (String pageName, Map<String, dynamic> params, String _) => TabRouteWidget(),
    //   'platformView': (String pageName, Map<String, dynamic> params, String _) =>
    //       PlatformRouteWidget(),
    //   'flutterFragment': (String pageName, Map<String, dynamic> params, String _) =>
    //       FragmentRouteWidget(params),
    //
    //   ///可以在native层通过 getContainerParams 来传递参数
    //   'flutterPage': (String pageName, Map<String, dynamic> params, String _) {
    //     print('flutterPage params:$params');
    //
    //     return FlutterRouteWidget(params: params);
    //   },
    // });
    // FlutterBoost.singleton.addBoostNavigatorObserver(TestBoostNavigatorObserver());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}