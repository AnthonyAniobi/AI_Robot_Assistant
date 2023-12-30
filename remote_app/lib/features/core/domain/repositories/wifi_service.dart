import 'package:wifi_iot/wifi_iot.dart';

class WifiService{
  static Future<bool> isConnected()async{
    return WiFiForIoTPlugin.isConnected();
  }

  static Future<bool> isEnabled()async{
    return WiFiForIoTPlugin.isEnabled();
  }

  /// turn on or turn off wifi
  static Future onOffWifi(bool enable)async{
    WiFiForIoTPlugin.setEnabled(enable);
  }
}