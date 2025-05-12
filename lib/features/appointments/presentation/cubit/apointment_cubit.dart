import 'package:clinic/features/appointments/models/appointment.dart';
import 'package:clinic/core/utils/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'apointment_state.dart';

class AppointmentsCubit extends Cubit<AppointmentsState> {
  AppointmentsCubit() : super(const AppointmentsState()) {
    loadAppointments();
  }

  Future<void> loadAppointments() async {
    emit(state.copyWith(status: AppointmentStatus.loading));
    await Future.delayed(const Duration(seconds: 1)); 
    _filterAndEmit();
  }

  void setFilter(AppointmentFilter filter) {
    emit(state.copyWith(selectedFilter: filter, status: AppointmentStatus.loading));
    _filterAndEmit();
  }

void _filterAndEmit() {
  final now = DateTime.now();

  final all = Constants.allAppointments;
  final today = all.where((app) =>
    app.dateTime.year == now.year &&
    app.dateTime.month == now.month &&
    app.dateTime.day == now.day,
  ).toList();

  final filteredAppointments = state.selectedFilter == AppointmentFilter.today
      ? today
      : all;

  emit(state.copyWith(
    status: AppointmentStatus.loaded,
    appointments: filteredAppointments,
    todayCasesCount: today.length,
    totalCasesCount: all.length,
    appointmentsCount: filteredAppointments.length,
  ));
}

}