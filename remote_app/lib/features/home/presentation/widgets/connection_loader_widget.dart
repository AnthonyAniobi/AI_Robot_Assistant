import 'package:flutter/material.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_color.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_spacer.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_text.dart';

class ConnectionLoaderWidget extends StatelessWidget {
  const ConnectionLoaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        color: RaColor.black.withOpacity(0.4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: RaColor.white,
            ),
            RaSpacer.h2,
            RaText.sp16('Loading Connections . . .').white.w500,
          ],
        ),
      ),
    );
  }
}
