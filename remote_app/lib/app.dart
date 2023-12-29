import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remote_app/features/core/presentation/bloc/navigator/navigator_bloc.dart';
import 'package:remote_app/features/core/presentation/pages/app_nav_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenSize) {
      return BlocProvider(
        create: (context) => NavigatorBloc(),
        child: MaterialApp(
          title: 'Remote App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const AppNavPage(),
        ),
      );
    });
  }
}
