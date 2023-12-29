import 'package:flutter/material.dart';
import 'package:remote_app/features/control/presentation/pages/control_homepage.dart';
import 'package:remote_app/features/core/data/datasources/app_utils.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_bottom_nav.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_drawer.dart';
import 'package:remote_app/features/home/presentation/pages/homepage.dart';
import 'package:remote_app/features/model/presentation/pages/model_homepage.dart';
import 'package:remote_app/features/settings/presentation/pages/settings_homepage.dart';

class AppNavPage extends StatefulWidget {
  const AppNavPage({super.key});

  @override
  State<AppNavPage> createState() => _AppNavPageState();
}

class _AppNavPageState extends State<AppNavPage> with SingleTickerProviderStateMixin{

  @override
  void initState() {
    AppUtils.tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: RaDrawer(),
      bottomNavigationBar: RaBottomNav(),
      body: TabBarView(
        controller: AppUtils.tabController,
        children: [
        Homepage(),
        ModelHomepage(),
        SettingsHomepage(),
        ControlHomepage(),
      ]),
      );
  }
}