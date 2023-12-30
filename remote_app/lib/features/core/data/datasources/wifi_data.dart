import 'package:equatable/equatable.dart';

class WifiData extends Equatable {
  final bool isOn;
  final bool isConnected;
  final bool loading;
  final List<String> availableConnections;

  const WifiData(
      {required this.isOn,
      required this.isConnected,
      required this.loading,
      required this.availableConnections});

  factory WifiData.initial() => const WifiData(
      isOn: false,
      isConnected: false,
      loading: false,
      availableConnections: []);

  WifiData copy({
    bool? isOn,
    bool? isConnected,
    bool? loading,
    List<String>? availableConnections,
  }) =>
      WifiData(
          isOn: isOn ?? this.isOn,
          loading: loading ?? this.loading,
          isConnected: isConnected ?? this.isConnected,
          availableConnections:
              availableConnections ?? this.availableConnections);

  @override
  List<Object?> get props => [isOn, isConnected, loading, availableConnections];
}
