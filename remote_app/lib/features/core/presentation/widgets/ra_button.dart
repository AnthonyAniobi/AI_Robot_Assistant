import 'package:flutter/material.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_text.dart';

class RaButton {
  static Widget bigPrimary(
          {required String text, required Function onPresed}) =>
      InkWell(
        onTap: () {
          onPresed();
        },
        child: Container(child: RaText.sp18(text).w500),
      );
  static Widget smallPrimary(
          {required String text, required Function onPresed}) =>
      InkWell(
        onTap: () {
          onPresed();
        },
        child: Container(child: RaText.sp18(text).w500),
      );
}
