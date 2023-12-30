import 'package:flutter/material.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_button.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_color.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_field.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_spacer.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WifiPasswordDialog extends StatefulWidget {
  const WifiPasswordDialog({super.key, required this.name});

  final String name;

  @override
  State<WifiPasswordDialog> createState() => _WifiPasswordDialogState();
}

class _WifiPasswordDialogState extends State<WifiPasswordDialog> {
  TextEditingController cntr = TextEditingController();
  @override
  void dispose() {
    cntr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(2.w),
        child: Container(
          width: 80.w,
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  RaText.sp20("Wifi: ").color(RaColor.grey),
                  RaText.sp20(widget.name).setMaxLines(1).w500,
                ],
              ),
              RaSpacer.h2,
              RaField.hint(
                  hintText: "Password",
                  controller: cntr,
                  onChanged: (v) {
                    setState(() {});
                  },
                  onSubmitted: (v) {
                    submit(context);
                  }),
              RaSpacer.h4,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaButton.smallSecondary(
                      text: 'Cancel',
                      onPresed: () {
                        cancel(context);
                      }),
                  if (cntr.text.isNotEmpty)
                    RaButton.smallPrimary(
                        text: 'Save',
                        onPresed: () {
                          submit(context);
                        }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  cancel(BuildContext context) {
    Navigator.pop(context);
  }

  submit(BuildContext context) {
    Navigator.pop(context, cntr.text);
  }
}
