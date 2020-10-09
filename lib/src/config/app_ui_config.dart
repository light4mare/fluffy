import 'package:fluffy/src/net/client/dio_client.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart' as fluro;

// class AppConfig {
//   // 工厂模式 : 单例公开访问点
//   factory AppConfig() => _getInstance();
//
//   static AppConfig get instance => _getInstance();
//
//   // 静态私有成员，没有初始化
//   static AppConfig _instance;
//
//   // 私有构造函数
//   AppConfig._internal() {
//     // 初始化
//   }
//
//   // 静态、同步、私有访问点
//   static AppConfig _getInstance() {
//     if (_instance == null) {
//       _instance = new AppConfig._internal();
//     }
//     return _instance;
//   }
//
//   double appBarHeight = 48;
//   Color bodyColor = Colors.white;
//   // 全局错误视图，页面必需资源初始化失败时展示
//   WidgetBuilder errorViewBuilder;
//   // 全局加载视图，页面发生耗时、处理加载时展示
//   WidgetBuilder loadingViewBuilder;
// }

class AppConfig {
  static double appBarHeight = 48;
  static Color bodyColor = Colors.white;

  // 全局错误视图，页面必需资源初始化失败时展示
  static WidgetBuilder errorViewBuilder;
// 全局加载视图，页面发生耗时、处理加载时展示
  static WidgetBuilder loadingViewBuilder;

  // https://zhuanlan.zhihu.com/p/61657041
  static final router = fluro.Router();

  static DioClient client;
}

// library AppConfig.globals;
//
// import 'package:flutter/material.dart';
//
// double appBarHeight = 148;
// Color bodyColor = Colors.amberAccent;