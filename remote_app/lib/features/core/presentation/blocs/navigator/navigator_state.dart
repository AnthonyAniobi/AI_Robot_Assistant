part of 'navigator_bloc.dart';

class NavigatorState extends Equatable {
  final int tabIndex;
  const NavigatorState(this.tabIndex);
  
  @override
  List<Object> get props => [tabIndex];
}

