import 'package:dio/dio.dart';

class NetError {
  final String code;
  final String message;

  NetError(this.code, this.message);
}

typedef ErrorTransformer = NetError Function(DioError e);

typedef ErrorCallback = Function(NetError e);
