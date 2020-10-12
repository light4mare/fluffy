const temple_get =
    '''DioTask<{{RspType}}> {{methodName}}({{originParam}}) {
  CancelToken token = CancelToken();
  Future future = AppConfig.client.dio.get('{{url}}', queryParameters: {{parameter}}, cancelToken: token);
  DioTask task = DioTask<{{RspType}}>(future, AppConfig.client.handler, (map) => { {{RspType}}.{{jsonMethod}}(map) }, cancelToken: token);
  return task;
}''';

// DioTask<T> methodName<T>(String param, bool param1) {
//   CancelToken token = CancelToken();
//   Future future = AppConfig.client.dio.get("url_path", queryParameters: {"param": param, "param1": param1}, cancelToken: token);
//   DioTask task = DioTask<T>(future, AppConfig.client.handler, (map) => {}, cancelToken: token);
//   return task;
// }

// test() async {
//   var asdas = methodName("112", false);
//   var response = await asdas.result();
//   asdas.cancel();
//   response.data.test();
// }
