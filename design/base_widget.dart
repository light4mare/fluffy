
import 'package:flutter/material.dart';

class BaseWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BaseState();
  }

}

class BaseState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}


class View<DATA> {
  Widget build() {

  }
}