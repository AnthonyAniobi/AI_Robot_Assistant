import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppUtils {
  static final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static late TabController tabController;
  static showToast(String message) {
    Fluttertoast.showToast(msg: message);
  }
}
