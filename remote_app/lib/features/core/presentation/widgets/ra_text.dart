import 'package:flutter/material.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RaText{
  static Text sp12(String text)=>Text(text, style: TextStyle(color: RaColor.black, fontSize: 12.sp),);
  static Text sp14(String text)=>Text(text, style: TextStyle(color: RaColor.black, fontSize: 14.sp),);
  static Text sp16(String text)=>Text(text, style: TextStyle(color: RaColor.black, fontSize: 16.sp),);
  static Text sp18(String text)=>Text(text, style: TextStyle(color: RaColor.black, fontSize: 18.sp),);
  static Text sp20(String text)=>Text(text, style: TextStyle(color: RaColor.black, fontSize: 20.sp),);
  static Text sp22(String text)=>Text(text, style: TextStyle(color: RaColor.black, fontSize: 22.sp),);
}

extension RaTextExtension on Text{
  Text copy({TextStyle? style, int? maxLines, TextAlign? textAlign}){
    return Text(data??"", maxLines: maxLines??this.maxLines, textAlign: textAlign, style: this.style?.merge(style),);
  }

  Text color(Color color)=> copy(style: TextStyle(color: color));
  Text setMaxLines(int maxLines) => copy(maxLines: maxLines);
  Text get center => copy(textAlign: TextAlign.center);
  Text get white => color(RaColor.white);
  Text get grey => color(RaColor.grey);
  Text get w400 => copy(style: const TextStyle(fontWeight: FontWeight.w400));
  Text get w500 => copy(style: const TextStyle(fontWeight: FontWeight.w500));
  Text get w600 => copy(style: const TextStyle(fontWeight: FontWeight.w600));
  Text get w700 => copy(style: const TextStyle(fontWeight: FontWeight.w700));
  Text get w800 => copy(style: const TextStyle(fontWeight: FontWeight.w800));
}