import 'package:equatable/equatable.dart';

class Complaint extends Equatable {
  final String id;
  final String userName;
  final String userImageUrl;
  final DateTime dateTime;
  final String text;

  const Complaint({
    required this.id,
    required this.userName,
    required this.userImageUrl,
    required this.dateTime,
    required this.text,
  });

  @override
  List<Object?> get props => [id, userName, userImageUrl, dateTime, text];
}