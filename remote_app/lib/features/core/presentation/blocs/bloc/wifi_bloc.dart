import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:remote_app/features/core/data/datasources/wifi_data.dart';
import 'package:remote_app/features/core/domain/repositories/wifi_service.dart';

part 'wifi_event.dart';
part 'wifi_state.dart';

class WifiBloc extends Bloc<WifiEvent, WifiState> {
  WifiBloc() : super(WifiState(WifiData.initial())) {
    on<InitEvent>(init);
    on<ToggleWifiEvent>(toggleWifi);
  }

  Future init(InitEvent event, Emitter<WifiState> emit) async {
    bool enabled = await WifiService.isEnabled();
    bool connected = await WifiService.isConnected();
    emit(WifiState(state.data.copy(isOn: enabled, isConnected: connected)));
  }

  Future toggleWifi(ToggleWifiEvent event, Emitter<WifiState> emit) async {
    if (state.data.isOn) {
      WifiService.onOffWifi(false);
      emit(WifiState(state.data.copy(isOn: false, isConnected: false)));
    } else {
      WifiService.onOffWifi(true);
      emit(WifiState(state.data.copy(isOn: true, loading: true)));
      await Future.delayed(const Duration(seconds: 5));
      bool connected = await WifiService.isConnected();
      emit(WifiState(state.data.copy(isConnected: connected, loading: false)));
    }
  }
}
