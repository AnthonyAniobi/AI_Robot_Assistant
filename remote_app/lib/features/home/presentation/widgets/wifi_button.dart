import 'package:flutter/material.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WifiButton extends StatelessWidget {
  const WifiButton({
    super.key, required this.selected, required this.onPressed,
  });

  final bool selected;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onPressed();
      },
      child: Container(
        width: 40.w,
        height: 40.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected? RaColor.black: RaColor.white,
          boxShadow: RaShadow.mid,
        ),
        child: Icon(selected? Icons.wifi: Icons.wifi_off, size: 20.w, color: selected? RaColor.white: RaColor.black,),
      ),
    );
  }
}