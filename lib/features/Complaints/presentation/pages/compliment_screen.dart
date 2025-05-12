import 'package:clinic/core/utils/app_colors.dart';
import 'package:clinic/core/utils/app_strings.dart';
import 'package:clinic/business%20logic/compolaintscubit/cubit/complaints_cubit.dart';
import 'package:clinic/features/Complaints/presentation/widgets/compliment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComplaintsScreen extends StatelessWidget {
  const ComplaintsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () {
            if (Navigator.canPop(context)) Navigator.pop(context);
          },
        ),
        title: const Text(AppStrings.complaintsScreenTitle),)
        ,
      body: BlocBuilder<ComplaintsCubit, ComplaintsState>(
        builder: (context, state) {
          if (state.status == ComplaintStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == ComplaintStatus.error) {
            return Center(child: Text('خطأ: ${state.errorMessage}'));
          }
          if (state.complaints.isEmpty) {
            return const Center(child: Text(AppStrings.noComplaintsCurrently));
          }
          return ListView.builder(
            padding: const EdgeInsets.only(top:8.0),
            itemCount: state.complaints.length,
            itemBuilder: (context, index) {
              return ComplaintCard(complaint: state.complaints[index]);
            },
          );
        },
      ),
    );
  }
}