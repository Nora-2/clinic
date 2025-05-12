import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationInitial());

  void navigateTo(int newIndex) {
    if (state.selectedIndex != newIndex) {
      emit(NavigationItemSelected(selectedIndex: newIndex));
    }
  }

}