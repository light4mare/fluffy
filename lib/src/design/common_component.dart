import 'package:fluffy/src/config/app_ui_config.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

Widget buildAppBar(String title){
  return AppBar(
    toolbarHeight: AppConfig.appBarHeight,
    title: Text(title),
    centerTitle: true,
  );
}