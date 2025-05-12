import 'package:clinic/features/Complaints/models/complaint.dart';
import 'package:clinic/core/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'complaints_state.dart';

class ComplaintsCubit extends Cubit<ComplaintsState> {
  ComplaintsCubit() : super(const ComplaintsState()) {
    loadComplaints();
  }

  final List<Complaint> _mockComplaints = Constants.mockComplaints;
  Future<void> loadComplaints() async {
    emit(state.copyWith(status: ComplaintStatus.loading));
    await Future.delayed(const Duration(seconds: 1)); 
    emit(state.copyWith(
        status: ComplaintStatus.loaded, complaints: _mockComplaints));
  }
}
