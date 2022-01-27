import 'package:flutter/material.dart';

AppBar appBar({
  required String title,
  double? fontSize,
  Color? titleColor,
  bool? centerTitle = false,
  List<Widget>? actions,
  double? elevation,
  Color? backgroundColor,
}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        color: titleColor,
        fontSize: fontSize,
      ),
    ),
    backgroundColor: backgroundColor,
    centerTitle: centerTitle,
    actions: actions,
    elevation: elevation,
  );
}
