import 'package:remote_app/features/core/data/datasources/app_utils.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:wifi_scan/wifi_scan.dart';

class WifiService {
  static Future<bool> isConnected() async {
    return WiFiForIoTPlugin.isConnected();
  }

  static Future<bool> isEnabled() async {
    return WiFiForIoTPlugin.isEnabled();
  }

  /// turn on or turn off wifi
  static Future onOffWifi(bool enable) async {
    WiFiForIoTPlugin.setEnabled(enable);
  }

  static Future<List<WiFiAccessPoint>?> getWifiAccessPoints() async {
    final can =
        await WiFiScan.instance.canGetScannedResults(askPermissions: false);
    final startScan = await WiFiScan.instance.startScan();
    if (startScan) {
      switch (can) {
        case CanGetScannedResults.yes:
          final accessPoints = await WiFiScan.instance.getScannedResults();
          return accessPoints;
        case CanGetScannedResults.noLocationPermissionDenied:
          AppUtils.showToast('Permission is required');
          return null;
        case CanGetScannedResults.noLocationPermissionRequired:
          AppUtils.showToast("no location permission required");
          return null;
        case CanGetScannedResults.noLocationPermissionUpgradeAccuracy:
          AppUtils.showToast("no location permission upgrade accuracy");
          return null;
        case CanGetScannedResults.noLocationServiceDisabled:
          AppUtils.showToast("no location service disabled");
          return null;
        case CanGetScannedResults.notSupported:
          AppUtils.showToast("not supported");
          return null;
      }
    }
    return null;
  }

  static Future<bool> connect(WiFiAccessPoint accessPoint,
      {String? password}) async {
    NetworkSecurity security;
    if (password == null) {
      security = NetworkSecurity.NONE;
    } else if (accessPoint.capabilities.toLowerCase().contains('wpa')) {
      security = NetworkSecurity.WPA;
    } else {
      security = NetworkSecurity.WEP;
    }

    bool val = await WiFiForIoTPlugin.connect(
      accessPoint.ssid,
      bssid: accessPoint.bssid,
      password: password,
      security: security,
    );
    return val;
  }

  static Future<bool> disconnect() async {
    return WiFiForIoTPlugin.disconnect();
  }

  // static Future checkConnected()async{
  //   WiFiForIoTPlugin.
  // }
}
