import 'package:clinic/core/utils/constants.dart';
import 'package:clinic/core/widgets/separator.dart';
import 'package:clinic/features/appointments/models/appointment.dart';
import 'package:clinic/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;

  const AppointmentCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(appointment.patientImageUrl),
                      onBackgroundImageError: (_, __) {}, // Handle error
                      child: AssetImage(appointment.patientImageUrl)
                              .assetName
                              .isEmpty
                          ? Icon(Icons.person, color: AppColors.primaryColor)
                          : null,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            appointment.patientName,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontSize: 15),
                          ),
                          Text(
                            appointment.serviceName,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: AppColors.primaryColor),
                          ),
                          Text(
                            appointment.doctorName,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                Constants.dateFormat
                                    .format(appointment.dateTime),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontSize: 11,
                                      color: AppColors.textDark,
                                    )),
                            const SizedBox(width: 4),
                            Icon(Icons.watch_later_outlined,
                                color: AppColors.textDark, size: 18),
                          ],
                        ),
                        Text(Constants.timeFormat.format(appointment.dateTime),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: 11,
                                  color: AppColors.textDark,
                                )),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: AppColors.hint.withOpacity(.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        icon: Icon(
                          Icons.phone_outlined,
                          size: 18,
                          color: AppColors.primaryColor,
                        ),
                        label: Text(
                          'اتصال',
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: AppColors.hint.withOpacity(.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        icon: Icon(
                          Icons.chat_bubble_outline,
                          size: 18,
                          color: AppColors.primaryColor,
                        ),
                        label: const Text('مراسلة'),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        separator()
      ],
    );
  }
}
