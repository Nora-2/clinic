
import 'package:clinic/core/utils/app_strings.dart';
import 'package:clinic/core/utils/constants.dart';
import 'package:clinic/features/appointments/models/appointment.dart';
import 'package:clinic/business%20logic/appointmentcubit/cubit/apointment_cubit.dart';
import 'package:clinic/features/appointments/presentation/widgets/appointmentcard.dart';
import 'package:flutter/material.dart';

class BuildApointmentList extends StatelessWidget {
  const BuildApointmentList({
    super.key,
    required this.context,
    required this.state,
    required this.expectedFilter,
  });

  final BuildContext context;
  final AppointmentsState state;
  final AppointmentFilter expectedFilter;

  @override
  Widget build(BuildContext context) {
    if (state.status == AppointmentStatus.loading &&
        state.selectedFilter == expectedFilter) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.status == AppointmentStatus.error) {
      return Center(child: Text('خطأ: ${state.errorMessage}'));
    }

    List<Appointment> appointmentsToShow;
    if (expectedFilter == AppointmentFilter.today) {
      final now = DateTime.now();
      appointmentsToShow = Constants.allAppointments
          .where((app) =>
              app.dateTime.year == now.year &&
              app.dateTime.month == now.month &&
              app.dateTime.day == now.day)
          .toList();
    } else {
      appointmentsToShow = Constants.allAppointments;
    }

    // If current cubit selected filter matches the expected filter for this tab view
    if (state.selectedFilter == expectedFilter) {
      appointmentsToShow = state.appointments; // Use the cubit's filtered list
    }

    if (appointmentsToShow.isEmpty &&
        state.status == AppointmentStatus.loaded) {
      return Center(
          child: Text(
              '${AppStrings.noAppointmentsFor}${expectedFilter == AppointmentFilter.today ?AppStrings.tabToday : AppStrings.tabAll}.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.only(top: 8),
      itemCount: appointmentsToShow.length,
      itemBuilder: (context, index) {
        return AppointmentCard(appointment: appointmentsToShow[index]);
      },
    );
  }
}