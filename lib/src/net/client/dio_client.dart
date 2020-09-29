import 'package:dio/dio.dart';
import 'package:fluffy/src/net/client/client.dart';
import 'package:fluffy/src/net/converter/default_converter.dart';
import 'package:fluffy/src/net/converter/response_converter.dart';

class DioClient extends NetClient {
  final Dio dio;
  final String host;
  final CancelToken cancelToken;
  ResponseHandler handler;

  DioClient(this.dio, this.host, this.cancelToken, {DefaultHandler handler}) {
    this.handler = handler ?? DefaultHandler();
  }

  @override
  cancelAll() {
    cancelToken.cancel();
  }
}

class ConstClient {
  const ConstClient();

  @override
  cancelAll() {
  }
}
