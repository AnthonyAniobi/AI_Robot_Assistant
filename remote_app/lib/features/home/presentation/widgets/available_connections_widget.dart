import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remote_app/features/core/presentation/blocs/bloc/wifi_bloc.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_button.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_color.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_spacer.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_text.dart';
import 'package:remote_app/features/home/presentation/widgets/wifi_password_dialog.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wifi_scan/wifi_scan.dart';

class AvailableConnectionsWidget extends StatelessWidget {
  const AvailableConnectionsWidget({
    super.key,
    required this.acessPoints,
  });
  final List<WiFiAccessPoint> acessPoints;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaText.sp18('${acessPoints.length} Connections').w600,
        Expanded(
          child: Stack(
            children: [
              ListView(
                children: [
                  ...acessPoints.map((point) {
                    bool hasPassword = point.isPasspoint ?? false;
                    return ListTile(
                      leading: Icon(
                        Icons.wifi,
                        color: RaColor.grey,
                        size: 5.w,
                      ),
                      title: RaText.sp18(point.ssid).w500,
                      onTap: () async {
                        if (hasPassword) {
                          submit(context, point, null);
                        } else {
                          String? password = await showDialog(
                              context: context,
                              builder: (context) =>
                                  WifiPasswordDialog(name: point.ssid));
                          if (password != null) {
                            // ignore: use_build_context_synchronously
                            submit(context, point, password);
                          }
                        }
                      },
                      // subtitle:
                      //     RaText.sp14(hasPassword ? '' : 'Password required')
                      //         .w600
                      //         .grey,
                      trailing: hasPassword
                          ? null
                          : Icon(
                              Icons.lock,
                              size: 5.w,
                            ),
                    );
                  }),
                  RaSpacer.h16,
                ],
              ),
              Positioned(
                bottom: 2.w,
                right: 2.w,
                child: RaButton.smallPrimary(
                    text: 'Reload',
                    onPresed: () {
                      context
                          .read<WifiBloc>()
                          .add(SearchWifiAccessPointEvent());
                    }),
              )
            ],
          ),
        ),
      ],
    );
  }

  Future submit(BuildContext context, WiFiAccessPoint accessPoint,
      String? password) async {
    context
        .read<WifiBloc>()
        .add(ConnectWifiEvent(accessPoint: accessPoint, password: password));
  }
}
