import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'model_event.dart';
part 'model_state.dart';

class ModelBloc extends Bloc<ModelEvent, ModelState> {
  ModelBloc() : super(ModelInitial()) {
    on<ModelEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
