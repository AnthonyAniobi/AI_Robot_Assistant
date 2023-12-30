import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remote_app/features/core/data/datasources/app_utils.dart';
import 'package:remote_app/features/core/presentation/blocs/navigator/navigator_bloc.dart' as nv;
// import 'package:remote_app/features/core/presentation/bloc/navigator/navigator_bloc.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_color.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_spacer.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RaBottomNav extends StatelessWidget {
  const RaBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<nv.NavigatorBloc, nv.NavigatorState>(
      builder: (context, state) {
        if(state.tabIndex > 2){
          return const SizedBox.shrink();
        }
        return Container(
          decoration: const BoxDecoration(
      color: RaColor.white,
      boxShadow: RaShadow.light,
    ),
          child: Row(
            children: [
              tabButton('Home', Icons.home, state.tabIndex==0, () {
                changeIndex(context, 0);
              }),
              tabButton('Model', Icons.library_add, state.tabIndex==1, () {
                changeIndex(context, 1);
              }),
              tabButton('Setting', Icons.settings, state.tabIndex==2, () {
                changeIndex(context, 2);
              }),
            ],
          ),
        );
      },
    );
  }

  Widget tabButton(
      String text, IconData icon, bool selected, Function onPressed) {
    return Expanded(
        child: InkWell(
      onTap: () {
        onPressed();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RaSpacer.h2,
          Icon(
            icon,
            size: 6.w,
            color: selected ? RaColor.black : RaColor.grey,
          ),
          RaSpacer.h1,
          RaText.sp16(text).color(selected ? RaColor.black : RaColor.grey),
          RaSpacer.h2,
        ],
      ),
    ));
  }

  void changeIndex(BuildContext context, int index){
    context.read<nv.NavigatorBloc>().add(nv.ChangeTabIndex(index));
    AppUtils.tabController.animateTo(index);
  }
}
