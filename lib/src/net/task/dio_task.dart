import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fluffy/src/net/converter/response_converter.dart';
import 'package:fluffy/src/net/error/error.dart';

import '../net_const.dart';
import 'task.dart';

typedef SuccessCallback<T> = Function(Response<T> response);

typedef Converter<T> = T Function(Map<String, dynamic> map);

class DioTask<T> extends NetTask<T> {
  final Future<Response<String>> dioFuture;
  final ResponseHandler responseHandler;
  final Converter converter;

  CancelToken _cancelToken;
  ErrorCallback _errorCallback;
  Dio _dio;

  int _maxRetryCount = 0;

  DioTask(this.dioFuture, this.responseHandler, this.converter,
      {CancelToken cancelToken, Dio dio, int maxRetryCount}) {
    this._dio = dio;
    this._cancelToken = cancelToken;
    this._maxRetryCount = maxRetryCount;
  }

  @override
  bool cancel() {
    _cancelToken?.cancel();
    return _cancelToken?.isCancelled ?? false;
  }

  @override
  Future<T> result() async {
    return converter.call(responseHandler.handle((await dioFuture)).data);
  }

  _onError(DioError error) {
    int retryCount = error.request.extra[NetConst.KEY_RETRY_COUNT];
    if (_dio != null && retryCount < _maxRetryCount) {
      retry(error.request);
    } else {
      _errorCallback?.call(responseHandler.transformError(error));
    }
  }

  Future<T> catchError(ErrorCallback callback) async {
    this._errorCallback = callback;
    dioFuture.catchError(_onError);
    return result();
  }

  then(SuccessCallback<T> callback) {
    dioFuture.then((Response<String> response) =>
        converter.call(responseHandler.handle(response).data));
  }

  Future<Response<T>> retry(RequestOptions requestOptions) async {
    final responseCompleter = Completer<Response<T>>();

    responseCompleter.complete(
      _dio.request(
        requestOptions.path,
        cancelToken: requestOptions.cancelToken,
        data: requestOptions.data,
        onReceiveProgress: requestOptions.onReceiveProgress,
        onSendProgress: requestOptions.onSendProgress,
        queryParameters: requestOptions.queryParameters,
        options: requestOptions,
      ),
    );

    return responseCompleter.future;
  }
}
