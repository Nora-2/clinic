import 'package:clinic/core/utils/app_colors.dart';
import 'package:clinic/core/utils/app_strings.dart';
import 'package:clinic/business%20logic/appointmentcubit/cubit/apointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tabbarmange extends StatelessWidget {
  const Tabbarmange({super.key, required this.tabController});
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentsCubit, AppointmentsState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildButton(
              context: context,
              label: AppStrings.tabAll,
              isSelected: state.selectedFilter == AppointmentFilter.all,
              onTap: () => _onTabTap(context, 0),
            ),
            const SizedBox(width: 8),
            _buildButton(
              context: context,
              label: AppStrings.tabToday,
              isSelected: state.selectedFilter == AppointmentFilter.today,
              onTap: () => _onTabTap(context, 1),
            ),
          ],
        );
      },
    );
  }

  void _onTabTap(BuildContext context, int index) {
    final cubit = context.read<AppointmentsCubit>();
    final currentFilter = cubit.state.selectedFilter;
    final newFilter = index == 0 ? AppointmentFilter.all : AppointmentFilter.today;

    if (currentFilter != newFilter) {
      cubit.setFilter(newFilter);
      tabController.animateTo(index);
    }
  }

  Widget _buildButton({
    required BuildContext context,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.white,
          border: Border.all(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'NotoSansArabic',
            ),
          ),
        ),
      ),
    );
  }
}
