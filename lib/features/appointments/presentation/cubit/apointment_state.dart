
part of 'apointment_cubit.dart';
enum AppointmentStatus { initial, loading, loaded, error }
enum AppointmentFilter { today, all }

class AppointmentsState extends Equatable {
  final AppointmentStatus status;
  final List<Appointment> appointments;
  final AppointmentFilter selectedFilter;
  final String? errorMessage;
  final int todayCasesCount;
final int totalCasesCount;
final int appointmentsCount;

  const AppointmentsState({this.todayCasesCount=0, this.totalCasesCount=0, this.appointmentsCount=0, 
    this.status = AppointmentStatus.initial,
    this.appointments = const [],
    this.selectedFilter = AppointmentFilter.all, // Default to "الكل"
    this.errorMessage,
  });

  AppointmentsState copyWith({
    AppointmentStatus? status,
    List<Appointment>? appointments,
    AppointmentFilter? selectedFilter,
    String? errorMessage,
      int? todayCasesCount,
  int? totalCasesCount,
  int? appointmentsCount,
  }) {
    return AppointmentsState(
      status: status ?? this.status,
      appointments: appointments ?? this.appointments,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      errorMessage: errorMessage ?? this.errorMessage,
       todayCasesCount: todayCasesCount ?? this.todayCasesCount,
    totalCasesCount: totalCasesCount ?? this.totalCasesCount,
    appointmentsCount: appointmentsCount ?? this.appointmentsCount,
    );
  }

  @override
  List<Object?> get props => [status, appointments, selectedFilter, errorMessage ,todayCasesCount,
  totalCasesCount,
  appointmentsCount,];
}