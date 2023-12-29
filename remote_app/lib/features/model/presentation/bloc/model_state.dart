part of 'model_bloc.dart';

abstract class ModelState extends Equatable {
  const ModelState();  

  @override
  List<Object> get props => [];
}
class ModelInitial extends ModelState {}
