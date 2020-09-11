import 'package:flutter/material.dart';

extension StateExt on State {
  invalidate() {
    // ignore: invalid_use_of_protected_member
    setState(() {});
  }
}
