import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'control_event.dart';
part 'control_state.dart';

class ControlBloc extends Bloc<ControlEvent, ControlState> {
  ControlBloc() : super(ControlInitial()) {
    on<ControlEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
