import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remote_app/features/core/data/datasources/app_utils.dart';
import 'package:remote_app/features/core/presentation/blocs/bloc/wifi_bloc.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_button.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_color.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_spacer.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_text.dart';
import 'package:remote_app/features/home/presentation/widgets/available_connections_widget.dart';
import 'package:remote_app/features/home/presentation/widgets/connection_loader_widget.dart';
import 'package:remote_app/features/home/presentation/widgets/search_network_widget.dart';
import 'package:remote_app/features/home/presentation/widgets/wifi_button.dart';

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
              if (state.data.isOn && !state.data.isConnected) ...[
                Expanded(
                    child: Stack(
                  children: [
                    if (state.data.loading) const ConnectionLoaderWidget(),
                    if (state.data.availableConnections.isEmpty)
                      const SearchNetworkWidget()
                    else
                      AvailableConnectionsWidget(
                        acessPoints: state.data.availableConnections,
                      ),
                  ],
                )),
                RaSpacer.h4,
                RaText.sp18('You are not connected to a network'),
              ] else if (!state.data.isOn)
                RaText.sp18('Turn on Wifi to Begin'),
              if (state.data.isConnected) ...[
                RaText.sp18(state.data.connectedNetwork?.ssid ?? ""),
                RaButton.smallPrimary(
                    text: 'Disconnect',
                    onPresed: () {
                      context.read<WifiBloc>().add(DisconnectWifiEvent());
                    }),
              ],
              RaSpacer.h4,
            ],
          );
        },
      ),
    );
  }
}
