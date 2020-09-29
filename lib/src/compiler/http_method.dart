import 'package:dio/dio.dart';

abstract class BaseMethod {
  final String path;
  final String jsonMethod;
  final int retryCount;
  final CancelToken cancelToken;

  BaseMethod(this.path, this.jsonMethod, this.retryCount, this.cancelToken);
}

class Get extends BaseMethod {
  Get(String path, {String jsonMethod = '', retryCount = 0, CancelToken cancelToken})
      : super(path, jsonMethod, retryCount, cancelToken);
}

class Post extends BaseMethod {
  Post(String path, {String jsonMethod = '', retryCount = 0, CancelToken cancelToken})
      : super(path, jsonMethod, retryCount, cancelToken);
}
