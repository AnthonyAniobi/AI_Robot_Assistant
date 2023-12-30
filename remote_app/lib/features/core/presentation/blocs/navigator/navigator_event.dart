part of 'navigator_bloc.dart';

abstract class NavigatorEvent extends Equatable {
  const NavigatorEvent();

  @override
  List<Object> get props => [];
}

class ChangeTabIndex extends NavigatorEvent{
  final int index;

  const ChangeTabIndex(this.index);
  
  @override
  List<Object> get props => [index];
}