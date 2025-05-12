import 'package:clinic/core/utils/constants.dart';
import 'package:clinic/core/widgets/separator.dart';
import 'package:clinic/features/Complaints/models/complaint.dart';
import 'package:clinic/core/utils/app_colors.dart';
import 'package:flutter/material.dart';


class ComplaintCard extends StatelessWidget {
  final Complaint complaint;

  const ComplaintCard({super.key, required this.complaint});

  @override
  Widget build(BuildContext context) {
    

    return Column(
      children: [
        Container(
          color: Colors.white,
         
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical:2),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(complaint.userImageUrl),
                  onBackgroundImageError: (_, __) {},
                  child: AssetImage(complaint.userImageUrl).assetName.isEmpty
                      ? Icon(Icons.person, color: AppColors.primaryColor)
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            complaint.userName,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 15,fontWeight: FontWeight.w600),
                          ),
                          Text(
                            Constants.dateTimeFormat.format(complaint.dateTime),
        
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 11),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        complaint.text,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.4),
                      ),
                        
                    ],
                  ),
                ),
        
              ],
            ),
          ),
        ),
                Separator()
      ],
    );
  }
}