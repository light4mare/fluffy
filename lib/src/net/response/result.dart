import 'package:fluffy/src/net/error/error.dart';

class Result {
  final Map<String, dynamic> data;
  final NetError error;

  Result(this.data, this.error);
}