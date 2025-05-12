
import 'package:clinic/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BuildSummaryCard extends StatelessWidget {
  const BuildSummaryCard({
    super.key,
    required this.context,
    required this.title,
    required this.count,
  });

  final BuildContext context;
  final String title;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: AppColors.lightGrey,
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColors.textDark.withOpacity(0.8))),
              const SizedBox(height: 4),
              Text(count,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: AppColors.primaryColor, fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
