import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remote_app/features/core/data/datasources/app_utils.dart';
import 'package:remote_app/features/core/presentation/blocs/navigator/navigator_bloc.dart' as nv;
import 'package:remote_app/features/core/presentation/widgets/ra_color.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_spacer.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RaDrawer extends StatelessWidget {
  const RaDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: RaColor.white,
      surfaceTintColor: RaColor.white,
      child: Column(
        children: [
          DrawerHeader(
            child: Center(child: RaText.sp22('Remote App').w700),
          ),
          //
          drawerItem('Home', Icons.home, 0),
          drawerItem('Models', Icons.library_add, 1),
          drawerItem('Control', Icons.gamepad, 3),
          drawerItem('Settings', Icons.settings, 2),
        ],
      ),
    );
  }

  Widget drawerItem(String text, IconData icon, int index) {
    return BlocBuilder<nv.NavigatorBloc, nv.NavigatorState>(
      builder: (context, state) {
        bool selected = state.tabIndex == index;
        return InkWell(
          onTap: (){
            context.read<nv.NavigatorBloc>().add(nv.ChangeTabIndex(index));
            AppUtils.tabController.animateTo(index);
            AppUtils.scaffoldKey.currentState?.closeDrawer();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.w),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 6.5.w,
                  color: selected? RaColor.black: RaColor.grey,
                ),
                RaSpacer.w4,
                RaText.sp18(text).color(selected? RaColor.black: RaColor.grey)
              ],
            ),
          ),
        );
      },
    );
  }
}
