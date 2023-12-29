part of 'control_bloc.dart';

abstract class ControlState extends Equatable {
  const ControlState();  

  @override
  List<Object> get props => [];
}
class ControlInitial extends ControlState {}
