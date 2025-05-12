
import 'package:clinic/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  const Separator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(          margin: const EdgeInsets.symmetric(horizontal: 16, vertical:2),height: 1,width:double.infinity ,color: AppColors.lightGrey,);
  }
}