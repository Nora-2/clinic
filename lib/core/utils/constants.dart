import 'package:clinic/features/appointments/models/appointment.dart';
import 'package:clinic/features/Complaints/models/complaint.dart';
import 'package:clinic/core/utils/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Constants {
  static void showErrorDialog(
      {required BuildContext context, required String msg}) {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(
                msg,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      textStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                  child: const Text('Ok'),
                )
              ],
            ));
  }
 
  static final List<Complaint> mockComplaints = [
    Complaint(
      id: 'c1',
      userName: 'راندا البلتاجي',
      userImageUrl: Appimages.profile1,
      dateTime: DateTime(2025, 11, 11, 10, 0),
      text: 'عملت عندكم في العيادة عملية ليزر لإزالة شعر الجسم المشكلة إني بعد العملية، النتايج مش زي ما كنت متوقعة خالص. الموضوع ده مضايقني جداً ومأثر على شكلي.',
    ),
     Complaint(
      id: 'c4',
      userName: 'راندا البلتاجي',
      userImageUrl: Appimages.profile1,
      dateTime: DateTime(2025, 11, 11, 10, 0),
      text: 'عملت عندكم في العيادة عملية ليزر لإزالة شعر الجسم المشكلة إني بعد العملية، النتايج مش زي ما كنت متوقعة خالص. الموضوع ده مضايقني جداً ومأثر على شكلي.',
    ),
    Complaint(
      id: 'c2',
      userName: 'راندا البلتاجي',
      userImageUrl: Appimages.profile1,
      dateTime: DateTime(2025, 11, 11, 10, 0),
      text: 'عملت عندكم في العيادة عملية ليزر لإزالة شعر الجسم المشكلة إني بعد العملية، النتايج مش زي ما كنت متوقعة خالص. الموضوع ده مضايقني جداً ومأثر على شكلي.',
    ),
    Complaint(
      id: 'c3',
      userName: 'راندا البلتاجي',
      userImageUrl:Appimages.profile1,
      dateTime: DateTime(2025, 11, 11, 10, 0),
      text: 'عملت عندكم في العيادة عملية ليزر لإزالة شعر الجسم المشكلة إني بعد العملية، النتايج مش زي ما كنت متوقعة خالص. الموضوع ده مضايقني جداً ومأثر على شكلي.',
    ),
  ];
  static final DateFormat timeFormat = DateFormat('HH:mm');
   static final DateFormat dateFormat = DateFormat('yy/MM/dd');
   static final DateFormat dateTimeFormat = DateFormat('HH.mm,dd/MM/yy');
  static final List<Appointment> allAppointments = [
    Appointment(
      id: '1',
      patientName: 'يوسف علي',
      serviceName: 'ليزر',
      doctorName: 'ليلى احمد',
      dateTime: DateTime(2025, 11, 11, 10, 0),
      patientImageUrl: Appimages.profile1,
      status: "Today"
    ),
    Appointment(
      id: '2',
      patientName: 'احمد محمود',
      serviceName: 'تنظيف بشرة',
      doctorName: 'سارة خالد',
      dateTime: DateTime(2025, 11, 11, 11, 30),
      patientImageUrl: Appimages.profile2,
      status: "Today"
    ),
    Appointment(
      id: '3',
      patientName: 'نور حسين',
      serviceName: 'فيلر',
      doctorName: 'ليلى احمد',
      dateTime: DateTime(2025, 11, 12, 14, 0),
      patientImageUrl: Appimages.profile3,
      status: "Upcoming"
    ),
  ];

}
