part of 'wifi_bloc.dart';

abstract class WifiEvent extends Equatable {
  const WifiEvent();

  @override
  List<Object> get props => [];
}

class InitEvent extends WifiEvent {}

class ToggleWifiEvent extends WifiEvent {}

class SearchWifiAccessPointEvent extends WifiEvent {}

class DisconnectWifiEvent extends WifiEvent {}

class ConnectWifiEvent extends WifiEvent {
  final WiFiAccessPoint accessPoint;
  final String? password;

  const ConnectWifiEvent({required this.accessPoint, this.password});

  @override
  List<Object> get props => [accessPoint.ssid];
}
