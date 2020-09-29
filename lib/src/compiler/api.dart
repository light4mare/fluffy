import 'package:dio/dio.dart';
import 'package:fluffy/src/net/client/client.dart';

class Api {
  final String method;
  final CancelToken cancelToken;
  final NetClient client;

  const Api(this.method, this.client, {this.cancelToken});
}