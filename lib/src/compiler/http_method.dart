import 'package:dio/dio.dart';

abstract class BaseMethod {
  final String path;
  final String jsonMethod;
  final int retryCount;
  final CancelToken cancelToken;

  BaseMethod(this.path, this.jsonMethod, this.retryCount, this.cancelToken);
}

class Get {
  final String path;
  final String jsonMethod;
  final int retryCount;

  const Get(this.path, {this.jsonMethod, this.retryCount});
}

class Post {
  final String path;
  final String jsonMethod;
  final int retryCount;

  const Post(this.path, {this.jsonMethod, this.retryCount});
}
