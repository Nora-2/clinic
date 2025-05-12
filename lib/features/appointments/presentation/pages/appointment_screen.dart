import 'package:clinic/core/widgets/separator.dart';
import 'package:clinic/core/utils/app_colors.dart';
import 'package:clinic/features/appointments/presentation/cubit/apointment_cubit.dart';
import 'package:clinic/features/appointments/presentation/widgets/Tabbarmanage.dart';
import 'package:clinic/features/appointments/presentation/widgets/buildappointmentlist.dart';
import 'package:clinic/features/appointments/presentation/widgets/buildsammarycard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
      } else {
        final filter = _tabController.index == 0
            ? AppointmentFilter.all
            : AppointmentFilter.today;
        context.read<AppointmentsCubit>().setFilter(filter);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.local_hospital, color: AppColors.primaryColor),
          onPressed: () {
            if (Navigator.canPop(context)) Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 8.0),
            child: Icon(Icons.notifications,
                color: AppColors.primaryColor), // Placeholder logo
          ),
        ],
      ),
      body: BlocBuilder<AppointmentsCubit, AppointmentsState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    BuildSummaryCard(context: context, title: 'حالات اليوم', count: state.todayCasesCount.toString()),
                    const SizedBox(width: 2),
                    BuildSummaryCard(context: context, title: 'اجمالي الحالات', count: state.totalCasesCount.toString()),
                    const SizedBox(width: 2),
                    BuildSummaryCard(context: context, title: 'المواعيد', count: state.appointmentsCount.toString()),
                  ],
                ),
              ),
              SizedBox(height: 8), // Space between summary and tab bar
              Separator(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'مواعيد المرضى',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor),
                    )),
              ),
              Tabbarmange(tabController: _tabController),

              Divider(thickness: 1, color: AppColors.lightGrey), // Separator
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    BuildApointmentList(context: context, state: state, expectedFilter: AppointmentFilter.all),
                    BuildApointmentList(context: context, state: state, expectedFilter: AppointmentFilter.today),
                  ],
                ),
              ),
              //  Padding(
              //      padding: const EdgeInsets.symmetric(vertical: 15.0),
              //      child: ElevatedButton(
              //        onPressed: () {
                                       
              //        },
              //        style: ElevatedButton.styleFrom(
              //          backgroundColor: const Color.fromARGB(255, 3, 33, 84), // Dark background
              //          foregroundColor: Colors.white, // White text
              //          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 12), // Adjust padding
              //          shape: RoundedRectangleBorder(
              //            borderRadius: BorderRadius.circular(8),
              //          ),
              //        ),
              //        child: const Text(
              //          'احجز الان',
              //          style: TextStyle(fontFamily: 'NotoSansArabic', fontWeight: FontWeight.bold, fontSize: 15),
              //        ),
              //      ),
              //    ),
            ],
          );
        },
      ),
    );
  }
  

}

