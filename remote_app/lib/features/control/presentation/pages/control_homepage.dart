import 'package:flutter/material.dart';
import 'package:remote_app/features/core/data/datasources/app_utils.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_color.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_text.dart';

class ControlHomepage extends StatelessWidget {
  const ControlHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              AppUtils.scaffoldKey.currentState?.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: RaColor.black,
            )),
        title: RaText.sp18('Controls').w600,
      ),
    );
  }
}
