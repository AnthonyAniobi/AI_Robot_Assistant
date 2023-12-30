import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remote_app/features/core/data/datasources/wifi_data.dart';
import 'package:remote_app/features/core/domain/repositories/wifi_service.dart';
import 'package:wifi_scan/wifi_scan.dart';

part 'wifi_event.dart';
part 'wifi_state.dart';

class WifiBloc extends Bloc<WifiEvent, WifiState> {
  WifiBloc() : super(WifiState(WifiData.initial())) {
    on<InitEvent>(init);
    on<ToggleWifiEvent>(toggleWifi);
    on<SearchWifiAccessPointEvent>(searchWifiAccessPointEvent);
    on<ConnectWifiEvent>(connectWifiEvent);
    on<DisconnectWifiEvent>(disconnectWifiEvent);
  }

  Future init(InitEvent event, Emitter<WifiState> emit) async {
    bool enabled = await WifiService.isEnabled();
    bool connected = await WifiService.isConnected();
    emit(WifiState(state.data.copy(isOn: enabled, isConnected: connected)));
  }

  Future toggleWifi(ToggleWifiEvent event, Emitter<WifiState> emit) async {
    if (state.data.isOn) {
      WifiService.onOffWifi(false);
      emit(WifiState(WifiData.initial()));
    } else {
      WifiService.onOffWifi(true);
      emit(WifiState(state.data.copy(isOn: true, loading: true)));
      bool connected = await WifiService.isConnected();
      final data = await WifiService.getWifiAccessPoints();
      emit(WifiState(state.data.copy(
          isConnected: connected,
          loading: false,
          availableConnections: data ?? [])));
    }
  }

  Future searchWifiAccessPointEvent(
      SearchWifiAccessPointEvent event, Emitter<WifiState> emit) async {
    emit(WifiState(state.data.copy(loading: true)));
    final data = await WifiService.getWifiAccessPoints();
    emit(WifiState(
        state.data.copy(availableConnections: data ?? [], loading: false)));
  }

  Future connectWifiEvent(
      ConnectWifiEvent event, Emitter<WifiState> emit) async {
    emit(WifiState(state.data.copy(loading: true)));
    bool data =
        await WifiService.connect(event.accessPoint, password: event.password);
    if (data) {
      emit(WifiState(state.data.copy(
          isConnected: data,
          loading: false,
          connectedNetwork: event.accessPoint)));
    } else {
      emit(WifiState(state.data.copy(isConnected: data, loading: false)));
    }
  }

  Future disconnectWifiEvent(
      DisconnectWifiEvent event, Emitter<WifiState> emit) async {
    final data = await WifiService.disconnect();
    emit(WifiState(state.data.copy(isConnected: !data)));
  }
}
