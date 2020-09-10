
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
    return StatefulBuilder(
      builder: (context, child){

      },
    );
  }
}


class View<DATA> {
  Widget build() {

  }
}