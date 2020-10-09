import 'package:dio/dio.dart';

class Api {
  final String method;
  final CancelToken cancelToken;

  const Api(this.method, {this.cancelToken});
}