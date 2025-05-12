
import 'package:clinic/core/enums/enum.dart';
import 'package:clinic/core/utils/app_colors.dart';
import 'package:clinic/core/utils/app_strings.dart';
import 'package:clinic/core/widgets/placeholder.dart'; 
import 'package:clinic/features/Complaints/presentation/pages/compliment_screen.dart';
import 'package:clinic/features/app/presentation/cubit/app_cubit.dart';
import 'package:clinic/features/appointments/presentation/pages/appointment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class NavItemData {
  final NavTab tab;
  final IconData icon;
  final String label;

  const NavItemData({required this.tab, required this.icon, required this.label});
}

class MainLayoutScreen extends StatelessWidget {
  const MainLayoutScreen({super.key});

  // Define screens in the order of NavTab enum
  static final List<Widget> _screens = [
    const AppointmentsScreen(), 
    const PlaceholderScreen(title: AppStrings.navPatients), 
    const PlaceholderScreen(title: AppStrings.navStaff), 
    const ComplaintsScreen(),
  ];

  // Define navigation items data
  static final List<NavItemData> _navItemDetails = [
    const NavItemData(tab: NavTab.appointments, icon: Icons.home_outlined, label: AppStrings.navHome),
    const NavItemData(tab: NavTab.patients, icon: Icons.person_outline, label: AppStrings.navPatients),
    const NavItemData(tab: NavTab.staff, icon: Icons.people_outline, label: AppStrings.navStaff),
    const NavItemData(tab: NavTab.complaints, icon: Icons.description_outlined, label: AppStrings.navComplaints),
  ];


  @override
  Widget build(BuildContext context) {

    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, navState) { 
        final selectedIndex = navState.selectedIndex;

        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: IndexedStack(
              index: selectedIndex,
              children: _screens,
            ),
            
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 6.0,
              color: Colors.white, 
              elevation: 8.0,
              child: SizedBox(
                height: 60.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildNavItem(context, _navItemDetails[0], selectedIndex),
                    _buildNavItem(context, _navItemDetails[1], selectedIndex),

                    _buildNavItem(context, _navItemDetails[2], selectedIndex),
                    _buildNavItem(context, _navItemDetails[3], selectedIndex),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavItem(BuildContext context, NavItemData itemData, int currentIndex) {
    final bool isSelected = itemData.tab.index == currentIndex;

    return Expanded(
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () => context.read<NavigationCubit>().navigateTo(itemData.tab.index),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                itemData.icon,
                color: isSelected ? AppColors.primaryColor : AppColors.darkGrey,
                size: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Text(
                  itemData.label,
                  style: TextStyle(
                    fontSize: 10,
                    color: isSelected ? AppColors.primaryColor : AppColors.darkGrey,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                  overflow: TextOverflow.ellipsis, // Handle long text
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}