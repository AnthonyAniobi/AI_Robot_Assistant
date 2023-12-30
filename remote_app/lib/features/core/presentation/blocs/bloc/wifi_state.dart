part of 'wifi_bloc.dart';

class WifiState extends Equatable {
  final WifiData data;
  const WifiState(this.data);
  
  @override
  List<Object> get props => [data];
}
