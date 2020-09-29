import 'package:dio/dio.dart';

import 'error.dart';

NetError transformError(DioError error) {
  return NetError(error.type.toString(), error.message);
}
