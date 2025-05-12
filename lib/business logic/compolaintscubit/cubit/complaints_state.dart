part of 'complaints_cubit.dart';

enum ComplaintStatus { initial, loading, loaded, error }

class ComplaintsState extends Equatable {
  final ComplaintStatus status;
  final List<Complaint> complaints;
  final String? errorMessage;

  const ComplaintsState({
    this.status = ComplaintStatus.initial,
    this.complaints = const [],
    this.errorMessage,
  });

  ComplaintsState copyWith({
    ComplaintStatus? status,
    List<Complaint>? complaints,
    String? errorMessage,
  }) {
    return ComplaintsState(
      status: status ?? this.status,
      complaints: complaints ?? this.complaints,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, complaints, errorMessage];
}