const temple_get =
    '''DioTask<{{RspType}}> {{methodName}}({{originParam}}) {
  CancelToken token = CancelToken();
  Future future = AppConfig.client.dio.get('{{url}}', queryParameters: {{parameter}}, cancelToken: token);
  DioTask task = DioTask<{{RspType}}>(future, AppConfig.client.handler, (map) => { {{RspType}}.{{jsonMethod}}(map) }, cancelToken: token);
  return task;
}''';

const temple_post =
    '''DioTask<{{RspType}}> {{methodName}}({{originParam}}) {
  CancelToken token = CancelToken();
  Future future = AppConfig.client.dio.post('{{url}}', queryParameters: {{parameter}}, cancelToken: token);
  DioTask task = DioTask<{{RspType}}>(future, AppConfig.client.handler, (map) => { {{RspType}}.{{jsonMethod}}(map) }, cancelToken: token);
  return task;
}''';