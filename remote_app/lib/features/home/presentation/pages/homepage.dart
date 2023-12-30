import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remote_app/features/core/data/datasources/app_utils.dart';
import 'package:remote_app/features/core/presentation/blocs/bloc/wifi_bloc.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_button.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_color.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_spacer.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_text.dart';
import 'package:remote_app/features/home/presentation/widgets/wifi_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

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
        title: RaText.sp18('Remote App').w600,
      ),
      body: BlocBuilder<WifiBloc, WifiState>(
        builder: (context, state) {
          return Column(
            children: [
              RaSpacer.h1,
              const Row(),
              WifiButton(
                  selected: state.data.isOn,
                  onPressed: () {
                    context.read<WifiBloc>().add(ToggleWifiEvent());
                  }),
              RaSpacer.h4,
              if (state.data.isOn) ...[
                Expanded(
                    child: Stack(
                  children: [
                    if (state.data.loading) const ConnectionLoaderWidget(),
                    Column(
                      children: [
                        RaText.sp18('Available Connections').w600,
                        Expanded(
                          child: ListView.builder(
                              // itemCount: state.data.availableConnections.length,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: RaText.sp18('hello').w500,
                                  subtitle: RaText.sp14('Subtitle').w600.grey,
                                  trailing: Checkbox(
                                    value: true,
                                    onChanged: (v) {},
                                  ),
                                );
                              }),
                        ),
                      ],
                    )
                  ],
                )),
                RaSpacer.h4,
              ] else
                RaText.sp18('Turn on Wifi to Begin'),
              if (state.data.isConnected)
                RaButton.smallPrimary(text: 'Disconnect', onPresed: () {}),
              if (!state.data.isConnected && state.data.isOn)
                RaText.sp18('You are not connected to a network'),
              RaSpacer.h4,
            ],
          );
        },
      ),
    );
  }
}

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
