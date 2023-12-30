import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remote_app/features/core/presentation/blocs/bloc/wifi_bloc.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_button.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_spacer.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_text.dart';

class SearchNetworkWidget extends StatelessWidget {
  const SearchNetworkWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaText.sp18('Search For network'),
        RaSpacer.h2,
        const Row(),
        RaButton.smallPrimary(
            text: 'Search',
            onPresed: () {
              context.read<WifiBloc>().add(SearchWifiAccessPointEvent());
            })
      ],
    );
  }
}
