import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

Widget circularWidget(String imgUrl, double currRadius) {
  return CircleAvatar(
    radius: currRadius,
    backgroundImage: AssetImage(
      imgUrl,
    ),
  );
}

String dateFormatterActivity(DateTime? dateTime) {
  if (dateTime != null) {
    String dateFormatter = DateFormat("yyyy-MM-dd").format(dateTime);
    return dateFormatter;
  }
  return "";
}
