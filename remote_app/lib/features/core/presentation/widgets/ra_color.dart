import 'package:flutter/material.dart';

class RaColor{
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Colors.grey;
}

class RaShadow{
  static const List<BoxShadow> light = [BoxShadow(
    color: Color(0x4F000000),
    blurRadius: 5,
    offset: Offset(2, 2),
  )];
  static const List<BoxShadow> mid = [BoxShadow(
    color: Color(0x8F000000),
    blurRadius: 5,
    offset: Offset(2, 2),
  )];
  static const List<BoxShadow> dark = [BoxShadow(
    color: Color(0xFF000000),
    blurRadius: 5,
    offset: Offset(2, 2),
  )];
}