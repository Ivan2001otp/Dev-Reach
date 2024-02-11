import 'package:flutter/material.dart';

Widget separatorUIWidget(BuildContext context_, double width_, double height_,
    Color color_, double radius_) {
  return Container(
    width: width_,
    height: height_,
    decoration: BoxDecoration(
      color: color_,
      borderRadius: BorderRadius.circular(radius_),
    ),
  );
}
