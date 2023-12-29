
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigator_event.dart';
part 'navigator_state.dart';

class NavigatorBloc extends Bloc<NavigatorEvent, NavigatorState> {
  NavigatorBloc() : super(const NavigatorState(0)) {
    on<ChangeTabIndex>((event, emit) {
      emit(NavigatorState(event.index));
    });
  }
}
