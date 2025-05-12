part of 'app_cubit.dart'; // Use this if in the same directory and part of the cubit file


abstract class NavigationState extends Equatable {
  final int selectedIndex;

  const NavigationState({required this.selectedIndex});

  @override
  List<Object> get props => [selectedIndex];
}

class NavigationInitial extends NavigationState {
  const NavigationInitial() : super(selectedIndex: 0); 
}

class NavigationItemSelected extends NavigationState {
  const NavigationItemSelected({required super.selectedIndex});
}
