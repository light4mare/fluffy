import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fluffy/src/config/app_ui_config.dart';
import 'package:fluffy/src/net/task/dio_task.dart';

DioTask<T> methodName<T>(String param, bool param1) {
  CancelToken token = CancelToken();
  Future future = AppConfig.client.dio.get("url_path", queryParameters: {"param": param, "param1": param1}, cancelToken: token);
  DioTask task = DioTask<T>(future, AppConfig.client.handler, (map) => {}, cancelToken: token);
  return task;
}

test() async {
  var asdas = methodName("112", false);
  var response = await asdas.result();
  asdas.cancel();
  response.data.test();
}
