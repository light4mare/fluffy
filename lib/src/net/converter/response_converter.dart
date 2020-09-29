import 'package:dio/dio.dart';
import 'package:fluffy/src/net/error/error.dart';
import 'package:fluffy/src/net/response/result.dart';

abstract class ResponseHandler {
  Result handle(Response<String> response);

  NetError transformError(DioError error);
}