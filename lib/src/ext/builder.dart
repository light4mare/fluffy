import 'package:flutter/material.dart';

extension WidgetExtensioin on WidgetBuilder {
  Widget build(BuildContext context) {
    if(this != null){
      return this(context);
    }
    return null;
  }
}
