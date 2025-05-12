import 'package:equatable/equatable.dart';

class Appointment extends Equatable {
  final String id;
  final String patientName;
  final String serviceName;
  final String doctorName;
  final DateTime dateTime;
  final String patientImageUrl;
  final String status; 

  const Appointment({
    required this.id,
    required this.patientName,
    required this.serviceName,
    required this.doctorName,
    required this.dateTime,
    required this.patientImageUrl,
    this.status = "Today",
  });

  @override
  List<Object?> get props => [id, patientName, serviceName, doctorName, dateTime, patientImageUrl, status];
}