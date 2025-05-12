
import 'package:clinic/config/routes/app_routes.dart';
import 'package:clinic/config/themes/app_theme.dart';
import 'package:clinic/core/utils/app_strings.dart';
import 'package:clinic/business%20logic/compolaintscubit/cubit/complaints_cubit.dart';
import 'package:clinic/business%20logic/appcubit/cubit/app_cubit.dart';
import 'package:clinic/business%20logic/appointmentcubit/cubit/apointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClinicApp extends StatelessWidget {
  const ClinicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NavigationCubit()),
        BlocProvider(create: (_) => AppointmentsCubit()),
        BlocProvider(create: (_) => ComplaintsCubit()),
      ],
      child: MaterialApp(
       title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
         theme: AppTheme.theme,
     
            onGenerateRoute: AppRoutes.onGenerateRoute,
        
      )
    );
  }
}


