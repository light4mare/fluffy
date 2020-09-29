import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluffy/src/net/error/error.dart';
import 'package:fluffy/src/net/response/result.dart';

import 'response_converter.dart';

class DefaultHandler extends ResponseHandler {
  @override
  Result handle(Response<String> response) {
    var data = json.decode(response.data) as Map<String, dynamic>;
    return Result(data['data'], null);
  }

  @override
  NetError transformError(DioError error) => transformError(error);
}
