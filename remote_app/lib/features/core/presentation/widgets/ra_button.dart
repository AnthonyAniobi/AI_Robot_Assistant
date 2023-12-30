import 'package:flutter/material.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_color.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.w),
            decoration: BoxDecoration(
              color: RaColor.black,
              boxShadow: RaShadow.light,
              borderRadius: BorderRadius.circular(1.w),
            ),
            child: RaText.sp18(text).w500.white),
      );
  static Widget smallSecondary(
          {required String text, required Function onPresed}) =>
      InkWell(
        onTap: () {
          onPresed();
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.w),
            decoration: BoxDecoration(
              color: RaColor.white,
              boxShadow: RaShadow.light,
              border: Border.all(color: RaColor.grey),
              borderRadius: BorderRadius.circular(1.w),
            ),
            child: RaText.sp18(text).w500),
      );
}
