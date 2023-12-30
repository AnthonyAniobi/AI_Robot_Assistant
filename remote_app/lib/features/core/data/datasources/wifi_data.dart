import 'package:equatable/equatable.dart';
import 'package:wifi_scan/wifi_scan.dart';

class WifiData extends Equatable {
  final bool isOn;
  final bool isConnected;
  final bool loading;
  final List<WiFiAccessPoint> availableConnections;
  final WiFiAccessPoint? connectedNetwork;

  const WifiData(
      {required this.isOn,
      required this.isConnected,
      required this.loading,
      required this.availableConnections,
      this.connectedNetwork});

  factory WifiData.initial() => const WifiData(
      isOn: false,
      isConnected: false,
      loading: false,
      availableConnections: [],
      connectedNetwork: null);

  WifiData copy({
    bool? isOn,
    bool? isConnected,
    bool? loading,
    List<WiFiAccessPoint>? availableConnections,
    WiFiAccessPoint? connectedNetwork,
  }) =>
      WifiData(
        isOn: isOn ?? this.isOn,
        loading: loading ?? this.loading,
        isConnected: isConnected ?? this.isConnected,
        availableConnections: availableConnections ?? this.availableConnections,
        connectedNetwork: connectedNetwork ?? this.connectedNetwork,
      );

  @override
  List<Object?> get props => [isOn, isConnected, loading, availableConnections];
}
